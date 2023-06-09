//
//  EntitlementManager.swift
//  hibahcode
//
//  Created by WadiahAlbuhairi on 17/11/1444 AH.
//

import SwiftUI

class EntitlementManager: ObservableObject {
    static let userDefaults = UserDefaults(suiteName: "group.app.test")!

    @AppStorage("hasPro", store: userDefaults)
    var hasPro: Bool = false
}
