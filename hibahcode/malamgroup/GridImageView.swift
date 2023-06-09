//
//  GridImageView.swift
//  hibahcode
//
//  Created by amalghurm on 17/11/1444 AH.
//

import SwiftUI

struct GridImageView: View {
    @EnvironmentObject var homeData: HomeModel
    var Index: Int
    var malm : malm
    var Gimage : malm
    @State private var isPresented = false
    var body: some View {
        Button(action: {
            withAnimation(.easeInOut){
                // For Page Tab View Automatic Scrolling..
                homeData.selectedImageID =
                malm.Gimage[Index]
                homeData.showImageViewer.toggle()
                isPresented.toggle()
                
            }
            
        }, label: {
            
            ZStack{
                if Index<=2{
                    Image (malm.Gimage[Index])
                        .resizable ()
                        .aspectRatio(contentMode:.fill)
                        .frame(width:105,height: 105)
                        .cornerRadius (12)
                }
               // if malm.Gimage.count > 4 && Index == 2{
                    
                    
                //    RoundedRectangle (cornerRadius: 12)
                   //     .fill(Color.black.opacity(0.3))
                    
                  //  let remainingImages =
                 //   malm.Gimage.count - 4
                 //   Text ("+\(remainingImages)")
                   //     .font (.title)
                     //   .fontWeight (.heavy)
                    //    .foregroundColor (.white)
                    
              //  }
                
                
                
                
                
            }
            
        })
    }
    
    // expanding Image Size when space is availble.
    func getwidth(index: Int)->CGFloat{
        let width = getRect() .width - 100
        if malm.Gimage.count % 2 == 0{
            return width / 2
        }
        else{
            if Index == malm.Gimage.count - 1{
                return width
            }
            else{
                return width / 2
            }
        }}
}

struct GridImageView_Previews: PreviewProvider {
    static var previews: some View {
        First()
    }
}
extension View{
    
    
    func getRect () ->CGRect {
        
        
        return UIScreen.main.bounds
        
    }}
