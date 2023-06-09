//
//  GimgeView.swift
//  hibahcode
//
//  Created by Hibah Abdullah Alatawi on 18/11/1444 AH.
//



import SwiftUI

struct GimgeView: View {
    @EnvironmentObject var imgdata: HomeModelll
    var Index: Int
    var landmark : landmark
    var Otherimage : landmark
    @State private var isPresented = false
    var body: some View {
        Button(action: {
            withAnimation(.easeInOut){
                // For Page Tab View Automatic Scrolling..
                imgdata.selectedImageIDD =
                landmark.Otherimage[Index]
                imgdata.showImageViewerr.toggle()
                isPresented.toggle()
                
            }
            
        }, label: {
            
            ZStack{
                if Index<=2{
                    Image (landmark.Otherimage[Index])
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
        if landmark.Otherimage.count % 2 == 0{
            return width / 2
        }
        else{
            if Index == landmark.Otherimage.count - 1{
                return width
            }
            else{
                return width / 2
            }
        }}
}

struct GimgeView_Previews: PreviewProvider {
    static var previews: some View {
        First()
    }
}
extension View{
    
    
    func getRectt () ->CGRect {
        
        
        return UIScreen.main.bounds
        
    }}
