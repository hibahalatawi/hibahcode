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
    
    OnBoardingStep(image: "pic1", title: NSLocalizedString("KNOW THE STORY FROM ONE STEP", comment: ""), description: NSLocalizedString( "Pictures of Any Historical Landmark And It Will Show You Information About It ", comment: "")),
    OnBoardingStep(image: "pic2", title: NSLocalizedString("TAKE oR UPLOAD PHOTO...",comment: ""), description: NSLocalizedString( "Just Take or Upload Photo of The  landmark you Want to Recognize", comment: "")),
    OnBoardingStep(image: "pic3", title: NSLocalizedString(
 """
  AND HERE IS THE INFORMTION
 """, comment: ""), description: NSLocalizedString( "Your Information Will Be Extracted From Here", comment: ""))]

struct OnBoardingView: View {
    @Binding var didOnboard: Bool
    @State private var currentStep = 0
    
    
    //    init(){
    //        UIScrollView.appearance().bounces = false
    //    }
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button("SKIP") {
                    didOnboard.toggle()
                }
                .fontWeight(.bold)
                .font(Font.custom("SF Pro", size: 20))
                .foregroundColor(Color(red: 0.471, green: 0.76, blue: 0.702))                .padding(20)
            }
            
            TabView(selection: $currentStep){
                ForEach(0..<OnBoardingSteps.count) { step in
                    VStack{
                        Image(OnBoardingSteps[step].image)
                            .resizable()
                            .frame(width:375 ,height: 380)
                            .padding(.bottom, 200.0)
                        
                        VStack{
                            Text(OnBoardingSteps[step].title)
                                .font(.title2)
                                .fontWeight(.medium)
                                .multilineTextAlignment(.center)
                                .font(Font.custom("SF Pro", size: 24))
                                .padding(.top, -150.0)
                            
                        }
                        
                        VStack{
                            
                            Text(OnBoardingSteps[step].description)
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color.gray)
                                .font(Font.custom("SF Pro", size: 20))
                                .padding(.horizontal, 32)
                                .padding(.top, -120.0)
                        }
                        
                    }
                    .tag(step)
                }}
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            
            if self.currentStep == OnBoardingSteps.count - 1 {
                Button{didOnboard.toggle()}
            label: {
                Text("Get started")
                    .fontWeight(.bold)
            }
            .padding(16)
            .font(Font.custom("SF Pro", size: 18))
            .frame(maxWidth: .infinity)
            .background(Color(red: 0.471, green: 0.76, blue: 0.705))
            .cornerRadius(15)
            .padding(.horizontal, 16)
            .foregroundColor(.white)
            .fontWeight(.bold)
            .buttonStyle(PlainButtonStyle())
                
                
                
            }
            
            
            HStack{
                ForEach(0..<OnBoardingSteps.count) { step in
                    if step == currentStep {
                        Rectangle()
                            .frame(width: 20, height: 10)
                            .cornerRadius(15)
                            .foregroundColor(Color(red: 0.471, green: 0.76, blue: 0.705))
                    }
                    else {
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(Color.gray)
                    }
                }
            }
            .padding(.bottom, 24)
            
            
            
        }
    }
}
