//
//  hibahcodeApp.swift
//  hibahcode
//
//  Created by Hibah Abdullah Alatawi on 11/11/1444 AH.
//

import SwiftUI
import Firebase

@main
struct hibahcodeApp: App {
    let persistenceController = PersistenceController.shared
        
    @StateObject
    private var entitlementManager: EntitlementManager

    @StateObject
    private var purchaseManager: PurchaseManager

    init() {
        let entitlementManager = EntitlementManager()
        let purchaseManager = PurchaseManager(entitlementManager: entitlementManager)

        self._entitlementManager = StateObject(wrappedValue: entitlementManager)
        self._purchaseManager = StateObject(wrappedValue: purchaseManager)
        
        FirebaseApp.initialize()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(purchaseManager)
                .environmentObject(entitlementManager)
                .task {
                    await purchaseManager.updatePurchasedProducts()
                }
        }
    }
}
