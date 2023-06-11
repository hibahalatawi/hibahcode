//
//  listOf.swift
//  hibahcode
//
//  Created by amalghurm on 17/11/1444 AH.
//

import SwiftUI


struct listOf: View {
    var malm: [malm] = malmdata
    var body: some View {
        
        NavigationStack{
            
            
                    VStack(alignment: .leading){
                        Text("Discover various sight in Saudi Arabia").font(.system(size: 28, weight: .semibold)).foregroundColor(Color.black).padding(.leading).frame(width:230.0,height: 140.4)
                        
                        VStack(alignment: .leading, spacing:10){
                            Text("Trending").font(.system(size: 24, weight: .semibold)).foregroundColor(Color(hue: 0.471, saturation: 0.469, brightness: 0.56)).padding(.leading)
                        
                            ScrollView(.horizontal){
                                
                                HStack(spacing:20){
                                    
                                        ForEach (malm) { item in
                                        NavigationLink{
                                            infoView(malm: item, Gimage: item)
                                        } label: {
                                            malmView(malm: item)
                                        }
                                        
                                    }
                                    Image("M6")  .resizable()
                                        .clipped()
                                        .frame(width: 235, height: 430)
                                        .cornerRadius(14)
                                        .scaledToFill()
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10).opacity(0.1)
                                                
                                        )
                                }.accentColor(.black)
                                .padding(.all)}
                        }
                        .frame(height: 500)
                        
                    }
            
        }
            
        }
    }

struct listOf_Previews: PreviewProvider {
    static var previews: some View {
        listOf(malm: malmdata)
    }
}
