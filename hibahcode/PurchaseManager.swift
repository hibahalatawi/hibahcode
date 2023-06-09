//
//  PurchaseManager.swift
//  hibahcode
//
//  Created by WadiahAlbuhairi on 17/11/1444 AH.
//

import Foundation
import StoreKit

@MainActor
class PurchaseManager: NSObject, ObservableObject {
    private let proudctIds = ["monthly_pass"]
    
    @Published
    private(set) var products: [Product] = []
    private let entitlementManager: EntitlementManager
    private var productsLoaded = false
    @Published
    private(set) var purchasedProductID = Set<String>()
    private var updates: Task<Void, Never>? = nil
    
    var hasUnlockedPro: Bool {
        return !self.purchasedProductID.isEmpty
    }
    
    init(entitlementManager: EntitlementManager) {
        self.entitlementManager = entitlementManager
        super.init()
        SKPaymentQueue.default().add(self)
        self.updates = observeTransactionUpdates()
    }
    
    deinit {
        updates?.cancel()
    }
    
    // Function to load the products details from App Store Connect {StoreKit}
    func loadProudcts() async throws {
        guard !self.productsLoaded else { return }
        self.products = try await Product.products(for: proudctIds)
        self.productsLoaded = true
    }
    // Function to purchase/subscribe items
    func purchase(_ product: Product) async throws {
            let result = try await product.purchase()

            switch result {
            case let .success(.verified(transaction)):
                // Successful purhcase
                await transaction.finish()
                await self.updatePurchasedProducts()
            case let .success(.unverified(_, error)):
                // Successful purchase but transaction/receipt can't be verified
                // Could be a jailbroken phone
                break
            case .pending:
                // Transaction waiting on SCA (Strong Customer Authentication) or
                // approval from Ask to Buy
                break
            case .userCancelled:
                // ^^^
                break
            @unknown default:
                break
            }
        }
    // Function to update the state of the purchased items
    func updatePurchasedProducts() async {
        for await result in Transaction.currentEntitlements {
            guard case .verified(let transaction) = result else {
                continue
            }
            // Checking transaction revocationDate
            if transaction.revocationDate == nil {
                self.purchasedProductID.insert(transaction.productID)
            } else {
                self.purchasedProductID.remove(transaction.productID)
            }
        }
    }
    // This Function will observe the transaction whenever it's updated.
    private func observeTransactionUpdates() -> Task<Void, Never> {
        Task(priority: .background) { [unowned self] in
            for await _ in Transaction.updates {
                await self.updatePurchasedProducts()
            }
        }
    }
}
extension PurchaseManager: SKPaymentTransactionObserver {
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {

    }

    func paymentQueue(_ queue: SKPaymentQueue, shouldAddStorePayment payment: SKPayment, for product: SKProduct) -> Bool {
        return true
    }
}
