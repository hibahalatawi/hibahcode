//
//  malmView.swift
//  hibahcode
//
//  Created by amalghurm on 17/11/1444 AH.
//

import SwiftUI

struct malmView: View {
    var malm : malm
    var body: some View {
        ZStack(alignment: .bottomLeading){
            Image(malm.image)
                .resizable()
                
                .frame(width: 235, height: 430)
                .cornerRadius(14)
                
                .overlay(
                    RoundedRectangle(cornerRadius: 14).opacity(0.2)
                        
                )
            Text(malm.title)
                .multilineTextAlignment(.leading)
                .padding()
                .font(.title)
                .fontWeight(.semibold)
                
                
                .foregroundColor(.white)
            
              
           
            
            
        }
    }
}

struct malmView_Previews: PreviewProvider {
    static var previews: some View {
        malmView(malm: malmdata[3])
    }
}
