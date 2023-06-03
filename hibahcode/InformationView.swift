//
//  InformationView.swift
//  Project2030
//
//  Created by Hibah Abdullah Alatawi on 07/11/1444 AH.
//



import Foundation
import SwiftUI



struct InformationView: View {
    var landmark : landmark

    var body: some View {
        VStack{
            Text(landmark.titlee)
                .font(.headline)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
            Image(landmark.imagee)
                .resizable()
                .clipped()
                .frame(width: 350, height: 246)
            ScrollView{
                
                VStack(alignment: .leading , spacing:20){
                    
                    Text(landmark.placee)
                    Text("Overview")
                        .font(.title2)
                    Text(landmark.descriptionn)
                        .font(.body)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                    Text("Photos")
                        .font(.title2)
                }.padding(.all)
                
                    
                ScrollView(.horizontal){
                HStack(spacing:10){
                    
                        ForEach(landmark.Otherimage, id: \.self){
                            Otherimage in
                            Image(Otherimage)
                                .resizable()
                                .frame(width: 100.0, height: 100.0)
                                .scaledToFill()
                                .clipped()
                            
                                .cornerRadius(7)
                            
                        }}.padding(.all)
                    
                }
        }}
    }
}

struct InfoemationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView(landmark: Landmarkdata[0])
    }
}
