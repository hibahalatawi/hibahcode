//
//  TabBarView.swift
//  hibahcode
//
//   Created by Ibrahim MOHAMMED on 16/11/1444 AH.
//


import SwiftUI

struct TabBarView: View {
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
                paymentview()
                    .tabItem {
                        Label("payment", systemImage: "doc.richtext")
                    }
            }
//            .onAppear(){
//                UITabBar.appearance().barTintColor = .white
//            }
//            .accentColor(Color(red: 0.475, green: 0.764, blue: 0.704))
            
        }
    }
}


