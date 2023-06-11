//
//  TabBarView.swift
//  hibahcode
//
//   Created by Hibah Abdullah Alatawi 16/11/1444 AH.
//


import SwiftUI

extension String {
    var localized: LocalizedStringKey {
        return LocalizedStringKey(self)
    }
}

struct TabBarView: View {
    
    @EnvironmentObject private var storeVM: StoreViewModel
    //let persistenceController = PersistenceController.shared


    var body: some View {
        
        NavigationView {
            TabView {
                ImgeReco()
                    .tabItem {
                        Label("Camera", systemImage: "camera.viewfinder")
                    }
                    //.environment(\.managedObjectContext, persistenceController.container.viewContext)
                    
                
                listOf()
                    .tabItem {
                        Label("Explore", systemImage: "safari")
                    }
                HistoryView()
                    .tabItem {
                        Label("History", systemImage: "doc.richtext")
                    }
                
//                if auth.tries > 5 {
//                    paymentview()
//                        .tabItem {
//                            Label("payment", systemImage: "doc.richtext")
//                        }
//                }
                
            }
           // .tint(storeVM.purchasedSubscriptions.isEmpty ? Color.red : Color.teal)
//            .onAppear(){
//                UITabBar.appearance().barTintColor = .white
//            }
        .accentColor(Color(red: 0.475, green: 0.764, blue: 0.704))
            
        }
    }
}


