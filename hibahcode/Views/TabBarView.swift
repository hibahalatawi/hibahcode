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

    var body: some View {
        
        NavigationView {
            TabView {
                ImgeReco()
                    .tabItem {
                        Label("camera", systemImage: "camera.viewfinder")
                    }
                
                listOf()
                    .tabItem {
                        Label("explore", systemImage: "safari")
                    }
                HistoryView()
                    .tabItem {
                        Label("history", systemImage: "doc.richtext")
                    }
            }
        }
    }
}


