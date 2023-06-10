//
//import SwiftUI
//import CoreData
//import CoreML
//import Vision




import SwiftUI


struct ContentView: View {
    @EnvironmentObject private var auth: AuthViewModel
    
    //@EnvironmentObject var purchaseManager: PurchaseManager
    @State var selectedTab: TabBarItem = .imageRec
    @State var loggedIn: Bool = false
    @State var didOnboard: Bool = false
    //let persistenceController = PersistenceController.shared

    
    var body: some View {
        ZStack {
            if didOnboard {
                if auth.isLoggedIn {
                    TabBarView()
                } else {
                    LoginView()
                }
            } else {
                OnBoardingView(didOnboard: $didOnboard)
            }
        }
        .onAppear(perform: auth.check)
        
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            // 1
//            ContentView()
//                .environment(\.locale, .init(identifier: "en"))
//            // 2
//            ContentView()
//                .environment(\.locale, .init(identifier: "ar"))
//        }
//    }
//}
