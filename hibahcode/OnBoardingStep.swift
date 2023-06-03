//
//  OnBoardingStep.swift
//  Project2030
//
//  Created by azizah ahmed alshami on 03/11/1444 AH.
//

import SwiftUI

struct OnBoardingStep {
    let image: String
    let title: String
    let description: String
}

private let OnBoardingSteps = [

    OnBoardingStep(image: "pic1", title: NSLocalizedString("KNOW THE STORY FROM ONE STEP", comment: ""), description: NSLocalizedString( "Pictures Of Any Historical Landmark And It Will Show You Information About It ", comment: "")),
OnBoardingStep(image: "pic2", title: NSLocalizedString("TAKE OR UPLOAD PHOTO...",comment: ""), description: NSLocalizedString( "Just Take Or Upload Photo Of The  landmark You Want To Recognize", comment: "")),
OnBoardingStep(image: "pic3", title: NSLocalizedString(
 """
  ...AND HERE IS THE INFORMTION
 """, comment: ""), description: NSLocalizedString( "Your Information Will Be Extracted From Here", comment: ""))]

struct OnBoardingView: View {
    @State private var currentStep = 0
    @State private var isshownhome = false
    @State private var ishownhome = false
    init(){
        UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button{
                    ishownhome.toggle()
                } label: {
                    Text("SKIP")
                }
                .fontWeight(.bold)
                .font(Font.custom("SF Pro", size: 20))
                .foregroundColor(Color(red: 0.972, green: 0.715, blue: 0.178))
                .padding(20)
                
                
                .fullScreenCover(isPresented:$ishownhome ){
                   ContentView()
                  
                }
            }
            
            TabView(selection: $currentStep){
                ForEach(0..<OnBoardingSteps.count) { step in
                    VStack{
                        Image(OnBoardingSteps[step].image)
                            .resizable()
                            .frame(width:370 ,height: 390)
                            .padding(.bottom)
                            
                        
                        Text(OnBoardingSteps[step].title)
                            .font(.title)
                            .fontWeight(.medium)
                            .multilineTextAlignment(.center)
                            .font(Font.custom("SF Pro", size: 24))
                        
                        
                        Text(OnBoardingSteps[step].description)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color.gray)
                            .font(Font.custom("SF Pro", size: 18))
                            .padding(.horizontal, 32)
                            .padding(.top, 16)
                    }
                    .tag(step)
                }}
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            HStack{
                ForEach(0..<OnBoardingSteps.count) { step in
                    if step == currentStep {
                        Rectangle()
                            .frame(width: 20, height: 10)
                            .cornerRadius(15)
                            .foregroundColor(Color("myColor"))
                    }
                    else {
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(Color.gray)
                    }
                }
            }
            .padding(.bottom, 24)
            
            if self.currentStep == OnBoardingSteps.count - 1 {
                Button{isshownhome.toggle()}
            label: {
                Text("Get started")
                //    .fontWeight(.bold)
            }
            .padding(16)
            .font(Font.custom("SF Pro", size: 18))
            .frame(maxWidth: .infinity)
            .background(Color(red: 0.972, green: 0.715, blue: 0.178))
            .cornerRadius(15)
            .padding(.horizontal, 16)
            .foregroundColor(.white)
            .fontWeight(.bold)
            .buttonStyle(PlainButtonStyle())
            .fullScreenCover(isPresented: $isshownhome)
                {
                    
                   ContentView()
                    
                    
                }
            }
            
        }
    }
    
}
struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            OnBoardingView()
                .environment(\.locale, .init(identifier: "en"))
            
            OnBoardingView()
                .environment(\.locale, .init(identifier: "ar"))
            
        }
    }
}

