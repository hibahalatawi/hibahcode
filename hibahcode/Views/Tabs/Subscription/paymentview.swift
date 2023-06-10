//
//  paymentview.swift
//  hibahcode
//
//  Created by WadiahAlbuhairi on 17/11/1444 AH.
//

import SwiftUI
import StoreKit

struct paymentview: View {
    
    @EnvironmentObject private var storeVM: StoreViewModel
    
    @State private var isPurchased: Bool = false
    
    var body: some View {
        ZStack {
            Image("0")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Text("Purchase")
                if storeVM.purchasedSubscriptions.isEmpty {
                    Text("Not Purchased")
                    
                    ForEach(storeVM.subscriptions)  { product in
                        Button {
                            Task {
                                await buy(product: product)
                            }
                        } label: {
                            Text("\(product.displayName) - \(product.displayPrice)")
                                .foregroundColor(.white)
                                .frame(width: 300, height: 50)
                                .background(RoundedRectangle(cornerRadius: 15)
                                    .fill(Color("pemantcolor"))
                                    .opacity(1)
                                )
                        }
                    }
                    
                    
                } else {
                    HStack {
                        Image(systemName: "heart.fill")
                        Text("Thank You :)")
                    }
                    .font(.title.bold())
                    .foregroundColor(.pink)
                    
                }
                //                if purchaseManager.hasUnlockedPro {
                //                    Text("Thank you :)")
                //                } else {
                //
                //                    ForEach(purchaseManager.products) { product in
                //                        Button {
                //                            Task {
                //                                do {
                //                                    try await purchaseManager.purchase(product)
                //                                } catch {
                //                                    print(error)
                //                                }
                //                            }
                //                        } label: {
                //                            Text("\(product.displayName) - \(product.displayPrice)")
                //                                .foregroundColor(.white)
                //                                .frame(width: 300, height: 50)
                //                                .background(RoundedRectangle(cornerRadius: 15)
                //                                    .fill(Color("pemantcolor"))
                //                                    .opacity(1)
                //                                )
                //                        }
                //                    }
                //                    Button {
                //                        Task {
                //                            do {
                //                                try await AppStore.sync()
                //                            } catch {
                //                                print(error)
                //                            }
                //                        }
                //                    } label: {
                //                        Text("Restore Purchases")
                //                    }
                //                }
            }
            //            .task {
            //                Task {
            //                    do {
            //                        try await purchaseManager.loadProudcts()
            //                    } catch {
            //                        print(error)
            //                    }
            //                }
            //            }
        }
        .toolbarBackground(.visible, for: .tabBar)
    }
    
    private func buy(product: Product) async {
        do {
            if try await storeVM.purchase(product) != nil {
                isPurchased = true
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}


