//
//  hibahcodeApp.swift
//  hibahcode
//
//  Created by Hibah Abdullah Alatawi on 11/11/1444 AH.
//

import SwiftUI

@main
struct hibahcodeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            OnBoardingView()
    
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
