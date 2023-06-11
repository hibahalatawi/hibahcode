//
//  StoreViewModel.swift
//  hibahcode
//
//  Created by azizah alshami on 10/06/1444 AH.
//

import Foundation
import StoreKit

class StoreViewModel: ObservableObject {
    
    private let proudctIds = ["monthly_pass"]
    
    var updateListenerTask: Task<Void, Error>? = nil
    
    @Published var subscriptions: [Product] = []
    @Published var purchasedSubscriptions: [Product] = []
    @Published var subscriptionsGroupStatus: StoreKit.Product.SubscriptionInfo.RenewalState?
    
    init() {
        print("Store INIT")
        updateListenerTask = listenForTransactions()
        Task {
            await requestProducts()
            await updateProductStatus()
        }
    }
    
    deinit {
        updateListenerTask?.cancel()
    }
    
    func listenForTransactions() -> Task<Void, Error> {
        return Task.detached {
            for await result in Transaction.updates {
                do {
                    let transaction = try self.checkVerified(result)
                    await self.updateProductStatus()
                    await transaction.finish()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    
    @MainActor
    func requestProducts() async {
        do {
            subscriptions = try await Product.products(for: proudctIds)
            print(subscriptions)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func purchase(_ product: Product) async throws -> Transaction? {
        let result = try await product.purchase()
        
        switch result {
        case .success(let verification):
            let transaction = try checkVerified(verification)
            await updateProductStatus()
            await transaction.finish()
            return transaction
        default:
            return nil
        }
    }
    
    func checkVerified<T>(_ result: VerificationResult<T>) throws -> T {
        switch result {
        case .unverified(_, let verificationError):
            throw verificationError
        case .verified(let signedType):
            return signedType
        }
    }
    
    @MainActor
    func updateProductStatus() async {
        for await result in Transaction.currentEntitlements {
            do {
                let transaction = try checkVerified(result)
                switch transaction.productType {
                case .autoRenewable:
                    if let subscription = subscriptions.first(where: { $0.id == transaction.productID }) {
                        print("purchased")
                        purchasedSubscriptions.append(subscription)
                    }
                default: break
                }
                await transaction.finish()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
