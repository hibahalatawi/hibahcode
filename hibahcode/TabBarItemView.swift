//
//  TabBarItemView.swift
//  Project2030
//
//  Created by azizah ahmed alshami on 03/11/1444 AH.
//

import SwiftUI

struct TabBarItemView: View {
    
    var type: TabBarItem
    @Binding var selectedTab: TabBarItem
    
    var isSelected: Bool {
        return selectedTab == type
    }
    
    var body: some View {
        ZStack{
              Spacer()
            GeometryReader.init(content: { geometry in
                Button(action: {
                    selectedTab = type
                }, label: {
                    VStack {
                        Spacer()
                        Image(systemName: type.imageName + (isSelected ? ".fill" : "")).font(.system(size:25)).bold()
                        Text(type.title)
                            .font(Font.custom("SF Pro", size: 13))
                    }
                })
                .frame( width: 70, height: 50)
                .foregroundColor(isSelected ? .newPrimaryColorq : .newPrimaryColorw)
            })
            .frame(width: 75, height: 60)
        }
        
    }
}

extension Color {
    static let olldPrimaryColor = Color(UIColor.systemIndigo)
    static let newPrimaryColorw = Color("Gray")
}

extension Color {
    static let oladPrimaryColor = Color(UIColor.systemIndigo)
    static let newPrimaryColorq = Color("CusColor")
}


struct TabBarViewItem_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            // 1
            TabBarItemView(type: .History, selectedTab: .constant(.History))
                .environment(\.locale, .init(identifier: "en"))
            // 2
            TabBarItemView(type: .History, selectedTab: .constant(.History))
                .environment(\.locale, .init(identifier: "ar"))
        }
        
    }
}



//import CoreML
//import Vision
//import CoreImage
//
//struct Classifier {
//
//    private(set) var results: String?
//
//    mutating func detect(ciImage: CIImage) {
//
//        guard let model = try? VNCoreMLModel(for: MobileNetV23(configuration: MLModelConfiguration()).model)
//        else {
//            return
//        }
//
//        let request = VNCoreMLRequest(model: model)
//
//        let handler = VNImageRequestHandler(ciImage: ciImage, options: [:])
//
//        try? handler.perform([request])
//
//        guard let results = request.results as? [VNClassificationObservation] else {
//            return
//        }
//
//        if let firstResult = results.first {
//            self.results = firstResult.identifier
//        }
//
//    }
//
//}
