//
//  ImgeReco.swift
//  hibahcode
//
//  Created by azizah ahmed alshami on 03/05/1444 AH.
//

import SwiftUI
import CoreData
import CoreML
import Vision

struct ImgeReco: View  {
    
    @EnvironmentObject private var storeVM: StoreViewModel
    @EnvironmentObject private var auth: AuthViewModel
    
    @State var isPresenting: Bool = false
    @State var uiImage: UIImage?
    @State private var showPhotoOptions: Bool = false
    @State private var showSheet: Bool = false
    @State private var ishownhome: Bool = false
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var count : Int = 0
    @State private var classified : Bool = false
    @State private var detection: Detection?
    @State private var showSubscriptionSheet: Bool = false
    
    //    @Environment(\.managedObjectContext) private var viewContext
    
    
    private let classifier = VisionClassifier(mlModel: CoreMLAZ2030().model)
    
    
    
    var body: some View {
        VStack {
            //                ZStack {
            //                    Text("Image")
            //                        .font(.largeTitle)
            //                        .fontWeight(.bold)
            //                        .foregroundColor(Color.black)
            //                        .padding(.bottom, -20.0)
            //                        .padding(.leading, -180.0)
            //                }
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color(red: 0.471, green: 0.76, blue: 0.705), style: StrokeStyle(lineWidth: 2, dash: [9]))
                
                if let image = uiImage {
                    Image(uiImage: uiImage!)
                        .resizable()
                        .cornerRadius(15)
                    // .stroke(Color("CusColor"), style: StrokeStyle(lineWidth: 2, dash: [9]))
                } else {
                    
                    Button(action: { showSheet.toggle() }) {
                        Label("Upload a Picture", systemImage: "plus")
                    }
                    .accentColor(.white)
                    .font(Font.custom("SF Pro", size: 18))
                    .frame(width: 270 , height: 50)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color(red: 0.465, green: 0.76, blue: 0.701)).opacity(1))
                    
                    
                }
                
            }
            .frame(maxWidth: .infinity)
            .padding(12)
            
            
            if classified {
                if let detection = detection {
                    if detection.label.isEmpty {
                        Text("Not Classified")
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.red)
                            .font(Font.custom("SF Pro", size: 17))
                    } else {
                        Text("\(detection.label)")
                            .frame(maxWidth: .infinity)
                            .accentColor(.white)
                            .font(Font.custom("SF Pro", size: 17))
                    }
                }
                
            }
            
            //.frame(height: 35)
            
            if uiImage != nil {
                HStack {
                    Button(action: { showSheet.toggle() }) {
                        Image(systemName: "arrow.counterclockwise.circle.fill")
                    }
                    .fontWeight(.regular)
                    .font(.system(size: 40))
                    .foregroundColor(Color(red: 0.465, green: 0.76, blue: 0.701))
                    
                    if let detection = detection {
                        if storeVM.purchasedSubscriptions.isEmpty && auth.tries > 5 {
                            Button("Subscribe", action: { showSubscriptionSheet.toggle() })
                        } else {
                            NavigationLink(destination: InformationView(detection: detection))
                            {
                                Text("details")
                                    .padding()
                                    .foregroundColor(Color.white)
                                    .background(Color(red: 0.465, green: 0.76, blue: 0.701))
                                    .cornerRadius(10)
                            }
                        }
                    }
                    
                    //                            .background(RoundedRectangle(cornerRadius: 15 ).fill(Color("CusColor")).opacity(1))
                }
            }
            
        }
        //                    .navigationBarTitle("Image")
        .sheet(isPresented: $isPresenting) {
            ImagePicker(uiImage: $uiImage, isPresenting:  $isPresenting, sourceType: $sourceType)
                .onDisappear {
                    if uiImage != nil {
                        classify()
                    }
                }
            
        }
        .actionSheet(isPresented: $showSheet) {
            ActionSheet(title: Text("Select Photo"), message: Text("Choose"), buttons: [
                .default(Text("Photo Library")) {
                    // open photo library
                    self.sourceType = .photoLibrary
                    self.isPresenting = true
                },
                .default(Text("Camera")) {
                    // open camera
                    self.sourceType = .camera
                    self.isPresenting = true
                },
                .cancel()
            ])
        }
        .sheet(isPresented: $showSubscriptionSheet) {
            paymentview()
        }
    }
    
    private func classify() {
        
        let imagePredictor = ImagePredictor()
        
        if let img = self.uiImage {
//            do {
//                try imagePredictor.makePredictions(for: img) { predictions in
//                    print(predictions)
//                }
//            } catch {
//                print("Vision was unable to make a prediction...\n\n\(error.localizedDescription)")
//            }
            
//             perform image classification
            self.classifier?.classify(img) { label, confidence in
                if confidence > 0.1 {
                    if let landmark = Landmarkdata.first(where: { $0.tag.contains(label)} ) {
                        self.detection = Detection(img: img, label: label, landmark: landmark)
                        self.classified = true
                    }

                    //handleData(picture: img, result: label)
                }
            }
        }
    }
}

struct Detection {
    var img: UIImage
    var label: String
    var landmark: landmark
}













struct Previews_ImgeReco_Previews: PreviewProvider {
    static var previews: some View {
        ImgeReco()
    }
}
