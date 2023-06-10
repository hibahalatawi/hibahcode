//
//  OnBoardingView.swift
//  Project2030
//
//  Created by azizah ahmed alshami on 03/05/1444 AH.
//

import SwiftUI

struct OnBoardingView: View {
    
    let tealColor = Color(red: 0.471, green: 0.76, blue: 0.705)
    
    private let OnBoardingSteps = [
        
        OnBoardingStep(
            id: 0,
            image: "pic1",
            title: "KNOW THE STORY FROM ONE STEP",
            description: "Pictures of Any Historical Landmark And It Will Show You Information About It"
        ),
        OnBoardingStep(
            id: 1,
            image: "pic2",
            title: "TAKE oR UPLOAD PHOTO...",
            description: "Just Take or Upload Photo of The  landmark you Want to Recognize"
        ),
        OnBoardingStep(
            id: 2,
            image: "pic3",
            title: "AND HERE IS THE INFORMTION",
            description: "Your Information Will Be Extracted From Here",
            lastStep: true
        )
    ]
    
    @Binding var didOnboard: Bool
    @State private var currentStep = 0
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button("SKIP") {
                    didOnboard.toggle()
                }
                .font(Font.custom("SF Pro", size: 20))
                .foregroundColor(tealColor)
                .padding(20)
            }
            
            TabView(selection: $currentStep) {
                ForEach(OnBoardingSteps) { step in
                    OnBoardingStepView(step: step, didOnboard: $didOnboard)
                        .tag(step.id)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            HStack {
                ForEach(OnBoardingSteps) { step in
                    Rectangle()
                        .frame(width: currentStep == step.id ? 20 : 10, height: 10)
                        .cornerRadius(15)
                        .foregroundColor(currentStep == step.id ? tealColor : .gray)
                }
            }
        }
        .animation(.spring(), value: currentStep)
    }
}

struct OnBoradingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView(didOnboard: .constant(false))
    }
}
