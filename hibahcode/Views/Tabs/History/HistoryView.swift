

//  HistoryView.swift
//  Recognizlator
//
//  Created by WadiahAlbuhairi on 01/08/1444 AH.
//
//??++

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct HistoryData: Identifiable {
    var id = UUID()
    var date: String
    let userID: String
    let result: String
    var detection: Detection
}

struct HistoryView: View {
    
    @EnvironmentObject private var auth: AuthViewModel
    
    
    
    
    //@Environment(\.managedObjectContext) private var viewContext
//    @FetchRequest(entity: History.entity(), sortDescriptors: []) var data: FetchedResults<History>
//    @FetchRequest(
//        sortDescriptors: [],
//    animation: .default)
    //private var data: FetchedResults<History>
//    @State private var classificationLabel: String = ""
    @State private var items: [HistoryData] = []
    @State private var networking: Bool = false

//    func createImage(_ value: Data) -> Image {
//        let songArtwork: UIImage = UIImage(data: value) ?? UIImage()
//        return Image(uiImage: songArtwork)
//    }
    
    var body: some View {
        NavigationView {
            ZStack {
                if networking {
                    ProgressView()
                } else {
                    Form {
                        ForEach(items) { item in
                            NavigationLink(destination: InformationView(detection: item.detection)) {
                                HStack {
                                    Image(uiImage: item.detection.img)
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .cornerRadius(12)
                                    Text(item.result)
                                    Spacer()
                                    Text(item.date)
                                }
                                
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
//                    List(items) { item in
                       
//                        ForEach(0..<10, id: \.self) { item in
//                            NavigationLink {
//                                Text("Item")
//                                //InformationView(landmark: Landmarkdata[0])
//                            } label: {
//                                VStack {
//                                    HStack {
//                                        //createImage(item.picture ?? Data())
//                                        Image(systemName: "heart")
//                                            .resizable()
//                                            .frame(width: 50  , height: 50)
//                                        Text("Uknown")
//                                    }
//                                }
//                            }
//                        }
                        //
//                    }
                    
        //            .onAppear(perform: {
        //                print(data.count)
        //            })
                    
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("history")
            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
            }
        }
        .task {
            
            networking = true
            await fetch()
            networking = false
        }
        
    }
    
    private func fetch() async {
        items = []
        let db = Firestore.firestore()
        guard let currentUser = auth.currentUser else { return }
        Task {
            do {
                let snapshot = try await db.collection("history").whereField("userID", isEqualTo: currentUser.uid).getDocuments()
                for doc in snapshot.documents {
                    let date = doc.data()["date"]! as! String
                    let userID = doc.data()["userID"]! as! String
                    let result = doc.data()["result"]! as! String
                    if let landmark = Landmarkdata.first(where: { $0.tag.contains(result)} ) {
                        let detection = Detection(img: UIImage(named: landmark.imagee)!, label: result, landmark: landmark)
                        let historyData = HistoryData(date: date, userID: userID, result: result, detection: detection)
                        items.append(historyData)
                    }
                    
                }
            } catch {
                print(error.localizedDescription)
            }
            
        }
        
    }
    
    private func deleteItems(offsets: IndexSet) {
//        networking = true
//        let db = Firestore.firestore()
//        withAnimation {
//            offsets.map { items[$0] }.forEach { item in
//            }
////            offsets.map { data[$0] }.forEach(viewContext.delete)
////
////            do {
////                try viewContext.save()
////            } catch {
////
////                let nsError = error as NSError
////                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
////            }
//        }
    }
    
}
    
    
    struct HistoryView_Previews: PreviewProvider {
        static var previews: some View {
            HistoryView()
        }
    }
