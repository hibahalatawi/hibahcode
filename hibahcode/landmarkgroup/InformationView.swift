//
//  InformationView.swift
//  Project2030
//
//  Created by Hibah Abdullah Alatawi on 07/11/1444 AH.
//



import Foundation
import SwiftUI
import Firebase
import FirebaseStorage


struct InformationView: View{
    
    @EnvironmentObject private var auth: AuthViewModel
    @StateObject var homeDataaa = HomeModelll()
    
    
    var detection: Detection
    
    var body: some View {
        ScrollView {
            VStack(spacing: 25) {
                Text(detection.landmark.titlee)
                    .font(.system(size: 36, weight: .bold))
                    .multilineTextAlignment(.center)
                Image(detection.landmark.imagee)
                    .resizable()
                    .clipped()
                    .frame(width: 360, height: 260)
                    .cornerRadius(14)
                
                VStack(alignment: .leading, spacing: 20) {
                    Text(detection.landmark.placee)
                        .font(.system(size: 24, weight: .regular))
                    
                    Text("Overview")
                        .font(.system(size: 24, weight: .semibold))
                    Text(detection.landmark.descriptionn)
                        .font(.system(size: 16, weight: .regular))
                    
                        .multilineTextAlignment(.leading)
                    Text("Photos")
                        .font(.system(size: 24, weight: .semibold))
                }
                .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .center, spacing: 20) {
                        ForEach(detection.landmark.Otherimage.indices,id: \.self) { index in
                            GimgeView( Index: index, landmark: detection.landmark, Otherimage: detection.landmark)
                                .environmentObject(homeDataaa)
                        }
                    }
                    .padding(.all)
                    .frame(minWidth: 100)
                }
            }
        }
        .onAppear(perform: storeHistory)
        .overlay (
            ZStack {
                if homeDataaa.showImageViewerr {
                    imgviewotherimge(landmark: detection.landmark,Otherimage : detection.landmark)
                        .environmentObject(homeDataaa)
                }
            }
                .frame(maxHeight: .infinity)
        )
    }
    
    private func storeHistory() {
        
        if auth.tries <= 5 {
            auth.tries += 1
        }
        
        let db = Firestore.firestore()
        
        Task {
            guard let currentUser = auth.currentUser else { return }
            try await db.collection("history").addDocument(data: [
                "userID": currentUser.uid,
                "date": Date().formatted(),
                "result": detection.label,
            ])
        }
        
        
        
    }
}

//struct InfoemationView_Previews: PreviewProvider {
//static var previews: some View {
//   // InformationView(landmark: Landmarkdata[0])
//    InformationView(landmark: Landmarkdata[0], Otherimage: Landmarkdata[0])
//}
//}
