//
//import SwiftUI
//import CoreData
//import CoreML
//import Vision




import SwiftUI


struct ContentView: View {
    @EnvironmentObject var purchaseManager: PurchaseManager
    @State var selectedTab: TabBarItem = .imageRec
    @State var didOnboard: Bool = false
    let persistenceController = PersistenceController.shared

    
    var body: some View {
        if didOnboard {
            TabBarView()
        } else {
            OnBoardingView(didOnboard: $didOnboard)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            // 1
            ContentView()
                .environment(\.locale, .init(identifier: "en"))
            // 2
            ContentView()
                .environment(\.locale, .init(identifier: "ar"))
        }
    }
}
