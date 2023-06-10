//
//  TabBarView.swift
//  hibahcode
//
//   Created by Hibah Abdullah Alatawi 16/11/1444 AH.
//


import SwiftUI

struct TabBarView: View {
    
    //@EnvironmentObject private var auth: AuthViewModel
    //let persistenceController = PersistenceController.shared

    var body: some View {
        
        NavigationView {
            TabView {
                ImgeReco()
                    .tabItem {
                        Label("camera", systemImage: "camera.viewfinder")
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
//            .onAppear(){
//                UITabBar.appearance().barTintColor = .white
//            }
//            .accentColor(Color(red: 0.475, green: 0.764, blue: 0.704))
            
        }
    }
}


