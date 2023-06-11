//
//  infoView.swift
//  hibahcode
//
//  Created by amalghurm on 17/11/1444 AH.
//

import SwiftUI


struct infoView: View {
    @StateObject var homeData = HomeModel()
    var malm : malm
    var Gimage : malm
    var body: some View {
        ScrollView{
        VStack(spacing:25){
            Text(malm.title)
                .font(.system(size: 36, weight: .bold))
                .multilineTextAlignment(.center)
            Image(malm.image)
                .resizable()
                .clipped()
                .frame(width: 360, height: 260)
                .cornerRadius(14)
            
                
                VStack(alignment: .leading , spacing:20){
                    
                    Text(malm.place)
                        .font(.system(size: 24, weight: .regular))
                    
                    Text("Overview")
                        .font(.system(size: 24, weight: .semibold))
                    Text(malm.description)
                        .font(.system(size: 16, weight: .regular))
                        
                        .multilineTextAlignment(.leading)
                    Text("Photos")
                        .font(.system(size: 24, weight: .semibold))
                }.padding(.all)
                
                          ScrollView(.horizontal){
                   
                        
                              HStack(alignment: .center, spacing: 20){
                            ForEach (malm.Gimage.indices,id: \.self){index
                                in
                                GridImageView( Index: index, malm: malm, Gimage: malm)
                            }}.padding(.all)
                              .frame(minWidth: 100)}
            }}    .overlay (
                // Image Viewer.
                    ZStack{
                        if homeData.showImageViewer{
                            PhotoView(malm: malm, Gimage: malm)
                            
                        }})
                .environmentObject (homeData)
    }
}

 

struct infoView_Previews: PreviewProvider {
    static var previews: some View {
        infoView(malm: malmdata[0], Gimage: malmdata[0])
    }
}
