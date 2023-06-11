//
//  OnBoardingStepView.swift
//  hibahcode
//



//  Created by azizah ahmed alshami on 10/06/2023.



import SwiftUI

struct OnBoardingStepView: View {
    
    let tealColor = Color(red: 0.471, green: 0.76, blue: 0.705)
    
    let step: OnBoardingStep
    @Binding var didOnboard: Bool
    
    var body: some View {
        VStack {
            Image(step.image)
                .resizable()
                .frame(width:375 ,height: 380)
                .padding(.bottom, 200.0)
            
            VStack {
                Text(step.title)
                    .font(.title2)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .font(Font.custom("SF Pro", size: 24))
                    .padding(.top, -150.0)
            }
            
            VStack {
                Text(step.description)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.gray)
                    .font(Font.custom("SF Pro", size: 20))
                    .padding(.horizontal, 32)
                    .padding(.top, -120.0)
            }
            
            if step.lastStep {
                Button{didOnboard.toggle()}
            label: {
                Text("Get started")
                    .fontWeight(.bold)
            }
            .padding(16)
            .font(Font.custom("SF Pro", size: 18))
            .frame(maxWidth: .infinity)
            .background(tealColor)
            .cornerRadius(15)
            .padding(.horizontal, 16)
            .foregroundColor(.white)
            .fontWeight(.bold)
            .buttonStyle(PlainButtonStyle())
            }
            Spacer()
        }
        .padding(.top, 10)
    }
}

//struct OnBoardingStepView_Previews: PreviewProvider {
//    static var previews: some View {
//        OnBoardingStepView(step: .init(id: 0, image: "", title: "", description: ""))
//    }
//}
