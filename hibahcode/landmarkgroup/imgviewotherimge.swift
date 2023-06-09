//
//  imgviewotherimge.swift
//  hibahcode
//
//  Created by Hibah Abdullah Alatawi on 18/11/1444 AH.
//

import SwiftUI

struct imgviewotherimge: View {
    @EnvironmentObject var homeDataaa: HomeModelll
    @GestureState var draggingOffsett: CGSize = .zero
    var landmark : landmark
    var Otherimage : landmark

    var body: some View {
        ZStack{
            Color.ui.dark
                .opacity (homeDataaa.bgOpacityy)
                .ignoresSafeArea ()
            ScrollView(.init()){
                TabView(selection: $homeDataaa.selectedImageIDD) {
                    ForEach (landmark.Otherimage, id: \.self ){image in
                        Image (image)
                            
                        .resizable ()
                        .frame(width: 400, height: 246)
                        //.aspectRatio (contentMode: .fit)
                        .tag(image)
                        .scaleEffect (homeDataaa.selectedImageIDD == image ?
                        (homeDataaa.imageScalee > 1 ? homeDataaa.imageScalee : 1) : 1)
                        // Moving Only Image...
                        // For SMooth Animation...
                        .offset (y: homeDataaa.imageViewer0ffsett.height)
                        .gesture (
                        // Magnifying Gesture.
                        MagnificationGesture () .onChanged ({ (value) in
                        homeDataaa.imageScalee = value
                        }).onEnded ({ (_) in
                            withAnimation (.spring()){
                            homeDataaa.imageScalee = 1
                            }
                            }))
                        
                    }
                    
                }.offset(y:130)
                .frame(height:600)
                .tabViewStyle(.page)
                    .indexViewStyle(.page(backgroundDisplayMode: .always))
               
                        .overlay (
                        // CLose Button...
                        Button (action: {
                            withAnimation (.default){
                            // Removing All.....
                                homeDataaa.showImageViewerr.toggle()
                            }
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor (.ui.light)
                                .padding ( )
                                .background (Color.ui.light.opacity (0.10))
                                .clipShape (Circle())
                            
                        })
                        .padding (10)
                        .padding (.top, UIApplication.shared .windows.first?.safeAreaInsets.top)
                        ,alignment: .topTrailing
                        )

            }.ignoresSafeArea()
                .transition(.move (edge:.bottom))
            
        }.navigationBarHidden(true)
        
        .gesture (DragGesture () .updating($draggingOffsett, body: {(value, outValue,_) in
         outValue = value.translation
            homeDataaa.onChangee (value:draggingOffsett)
            
        }).onEnded (homeDataaa.onEndd(value:)))
    }}

struct imgviewotherimge_Previews: PreviewProvider {
    static var previews: some View {
        secound()
    }
}

extension Color {
    static let uii = Color.UI()
    
    struct UII {
         let darkk = Color("dark")
        let lightt = Color("light")
        let yalleww = Color("myColor")
    }
}
