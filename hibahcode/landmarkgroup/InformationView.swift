//
//  InformationView.swift
//  Project2030
//
//  Created by Hibah Abdullah Alatawi on 07/11/1444 AH.
//



import Foundation
import SwiftUI



struct InformationView: View{
    
    @StateObject var homeDataaa = HomeModelll()
    var detection: Detection
//    var landmark : landmark
//    var Otherimage : landmark
    // var landmark : landmark
    
    var body: some View {
        VStack(spacing:25){
            Text(detection.landmark.titlee)
                .font(.system(size: 36, weight: .bold))
                .multilineTextAlignment(.center)
            Image(detection.landmark.imagee)
                .resizable()
                .clipped()
                .frame(width: 360, height: 260)
                .cornerRadius(14)
            ScrollView{
                
                VStack(alignment: .leading , spacing:20){
                    
                    Text(detection.landmark.placee)
                        .font(.system(size: 24, weight: .regular))
                    
                    Text("Overview")
                        .font(.system(size: 24, weight: .semibold))
                    Text(detection.landmark.descriptionn)
                        .font(.system(size: 16, weight: .regular))
                    
                        .multilineTextAlignment(.leading)
                    Text("Photos")
                        .font(.system(size: 24, weight: .semibold))
                }.padding(.all)
                
                ScrollView(.horizontal){
                    
                    
                    HStack(alignment: .center, spacing: 20){
                        ForEach (detection.landmark.Otherimage.indices,id: \.self){index
                            in
                            GimgeView( Index: index, landmark: detection.landmark, Otherimage: detection.landmark)
                        }}.padding(.all)
                    .frame(minWidth: 100)}
            }}    .overlay (
                // Image Viewer.
                ZStack{
                    if homeDataaa.showImageViewerr{
                        imgviewotherimge(landmark: detection.landmark,Otherimage : detection.landmark)
                        
                    }})
            .environmentObject (homeDataaa)
            .onAppear {
                handleData()
            }
    }
    
    func handleData() {
        let context = PersistenceController.shared.container.viewContext
        let newHistory = History(context: context)

        newHistory.date = Date()
        
        let imageData = detection.img.jpegData(compressionQuality: 1.0)
        newHistory.picture = imageData
        
        newHistory.result = detection.label
        
        newHistory.tries += 1
        
        PersistenceController.shared.save()
   }
}

//struct InfoemationView_Previews: PreviewProvider {
//static var previews: some View {
//   // InformationView(landmark: Landmarkdata[0])
//    InformationView(landmark: Landmarkdata[0], Otherimage: Landmarkdata[0])
//}
//}
