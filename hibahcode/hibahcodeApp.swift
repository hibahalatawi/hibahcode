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
    //    @StateObject private var entitlementManager: EntitlementManager
    //    @StateObject private var purchaseManager: PurchaseManager
    
    init() {
        //        let entitlementManager = EntitlementManager()
        //        let purchaseManager = PurchaseManager(entitlementManager: entitlementManager)
        //
        //        self._entitlementManager = StateObject(wrappedValue: entitlementManager)
        //        self._purchaseManager = StateObject(wrappedValue: purchaseManager)
        
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AuthViewModel())
                .environmentObject(StoreViewModel())
            //                .environmentObject(purchaseManager)
            //                .environmentObject(entitlementManager)
                .task {
                    //await purchaseManager.updatePurchasedProducts()
                    //await uploadLocalLandmarksToFirestore()
                }
        }
    }
    
    private func uploadLocalLandmarksToFirestore() async {
        let db = Firestore.firestore()
        do {
            for lm in Landmarkdata {
                try await db.collection("landmarks").addDocument(data: [
                    "title": lm.titlee,
                    "tag": lm.tag,
                    "place": lm.placee,
                    "imageName": lm.imagee,
                    "otherImages": lm.Otherimage,
                    "description": lm.descriptionn
                ])
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
