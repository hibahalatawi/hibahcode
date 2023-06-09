//
//  PhotoView.swift
//  hibahcode
//
//  Created by amalghurm on 17/11/1444 AH.
//

import SwiftUI


struct PhotoView: View {
    @EnvironmentObject var homeData: HomeModel
    @GestureState var draggingOffset: CGSize = .zero
    var malm : malm
    var Gimage : malm

    var body: some View {
        ZStack{
            Color.ui.dark
                .opacity (homeData.bgOpacity)
                .ignoresSafeArea ()
            ScrollView(.init()){
                TabView(selection: $homeData.selectedImageID) {
                    ForEach (malm.Gimage, id: \.self ){image in
                        Image (image)
                            
                        .resizable ()
                        .frame(width: 400, height: 246)
                        //.aspectRatio (contentMode: .fit)
                        .tag(image)
                        .scaleEffect (homeData.selectedImageID == image ?
                        (homeData.imageScale > 1 ? homeData.imageScale : 1) : 1)
                        // Moving Only Image...
                        // For SMooth Animation...
                        .offset (y: homeData.imageViewer0ffset.height)
                        .gesture (
                        // Magnifying Gesture.
                        MagnificationGesture () .onChanged ({ (value) in
                        homeData.imageScale = value
                        }).onEnded ({ (_) in
                            withAnimation (.spring()){
                            homeData.imageScale = 1
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
                                homeData.showImageViewer.toggle()
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
        
        .gesture (DragGesture () .updating($draggingOffset, body: {(value, outValue,_) in
         outValue = value.translation
            homeData.onChange (value:draggingOffset)
            
        }).onEnded (homeData.onEnd(value:)))
    }}
struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
       First()
    }
}

extension Color {
    static let ui = Color.UI()
    
    struct UI {
         let dark = Color("dark")
        let light = Color("light")
        let yallew = Color("myColor")
    }
}
