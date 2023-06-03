//
//  ImgeReco.swift
//  hibahcode
//
//  Created by Hibah Abdullah Alatawi on 14/11/1444 AH.
//

import SwiftUI
import CoreData
import CoreML
import Vision
struct ImgeReco: View  {
        @State var isPresenting: Bool = false
        @State var uiImage: UIImage?
        @State private var showPhotoOptions: Bool = false
        @State private var image: UIImage?
        @State private var showSheet: Bool = false
        @State private var ishownhome: Bool = false
        @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
        @State private var classificationLabel: String = ""
        @State private var count : Int = 0
       //@ObservedObject var reademg:ImageClassifier
        
        
        private let classifier = VisionClassifier(mlModel: MobileNetV23().model)
        @State var isHideText = false
        @State  private var languages :[String] =
        [NSLocalizedString("English", comment: ""),
         NSLocalizedString("Arabic", comment: ""),
         NSLocalizedString("Chinese", comment: ""),
         NSLocalizedString("French", comment: ""),
         NSLocalizedString("Italian", comment: "")]
        var synthVM = SynthViewModel()
        //for translate
        // View Model
        @ObservedObject var viewModel: ViewModel
        // to take input from ML result
        func takeInput(text : String){
            viewModel.input = text
        }
        // Instances of objects
        @State var viewedLanguages = ViewedLanguages()
        @State var translation = Translation()
        
        // Decides whether to present modal sheet or not
        @State var isPresented: Bool = false
        //MARK: - Header
        let screen = UIScreen.main.bounds
        // end for translate
        //to present translation and update it
        //@State private var translationText: String
        @State private var coreDataPicture: UIImage? = UIImage(contentsOfFile: "AppIcon")
        @State private var coreDataResult: String = ""
        var body: some View {
            
            
            NavigationView {
                
                VStack{
                    
                    ZStack{
                        
                        
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color("CusColor"), style: StrokeStyle(lineWidth: 2, dash: [9]))
                            .padding(.top, -60.0)
                        
                            .overlay(
                                Group {
                                    if uiImage != nil {
                                        Image(uiImage: uiImage!)
                                            .resizable()
                                        //  .scaledToFit()
                                            .frame(width: 350, height:360)
                                            .cornerRadius(15)
                                        HStack{
                                            //الريبلاي
                                            Button{
                                                
                                                ishownhome.toggle()
                                                
                                            } label: {
                                                Image(systemName: "arrow.counterclockwise.circle.fill")
                                                
                                            }
                                            //                                            .padding(.top, 650.0)
                                            .fontWeight(.regular)
                                            .font(.system(size: 40))
                                            .foregroundColor(Color("CusColor"))
                                            //زر المعلومات
                                            Button(action:{
                                                takeInput(text: classificationLabel)
                                                
                                                if !viewModel.input.isEmpty {
                                                    // Calls API translate function to retrieve translation
                                                    ViewModel().translate(for: viewModel.input, for: viewedLanguages.firstCode, for: viewedLanguages.secondCode) { (results) in
                                                        viewModel.translation = results.data.translations.first?.translatedText ?? "default value"
                                                        viewModel.targetLang = viewedLanguages.secondCode
                                                        
                                                    }
                                                    //     translationText = viewModel.translation
                                                    
                                                    //                                }
                                                }
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 1 ) {
                                                    handleData(picture: coreDataPicture, result: coreDataResult, translatedText: viewModel.translation)
                                                }
                                            },label: {
                                                
                                                Text("hhhhhhhhh")
                                                
                                            }).accentColor(.white)
                                                .font(Font.custom("SF Pro", size: 18))
                                                .frame(width: 150 , height: 50)
                                                .background(RoundedRectangle(cornerRadius: 15 ).fill(Color("CusColor")).opacity(1))
                                            
                                            
                                        } .padding(.top, 650.0)
                                        
                                        
                                    }else {
                                           Button() {
                                               // open action sheet
                                               self.showSheet = true
                                               
                                           }label: {
                                               
                                               Label("Upload a Picture", systemImage: "plus")
                                               
                                           }
                                           .accentColor(.white)
                                           .font(Font.custom("SF Pro", size: 18))
                                           .frame(width: 270 , height: 50)
                                           .background(RoundedRectangle(cornerRadius: 15 ).fill(Color("CusColor")).opacity(1))
                                           
                                           
                                           
                                       }
                                       
                                })
                            .frame(width: 370.0, height:500.0)
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
                    .padding()
                    
                }    .navigationBarTitle("Image ")
                    .padding(.bottom, 80.0)
            }
                .sheet(isPresented: $isPresenting){
                    ImagePicker(uiImage: $uiImage, isPresenting:  $isPresenting, sourceType: $sourceType)
                        .onDisappear{
                            if uiImage != nil {
                                Image(uiImage: image)
                                    .resizable()
                                //  .scaledToFit()
                                    .frame(width: 350, height:360)
                                    .cornerRadius(15)
                            }
                        }
                    
                }.padding()
                .actionSheet(isPresented:$ishownhome ){
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
         
                               }
            
            
            
                            
                        
        @State var didchange = false
        
        func handleData(picture: UIImage?, result: String , translatedText: String) {
            let context = PersistenceController.shared.container.viewContext
            let newHistory = History(context: context)
            newHistory.date = Date()
            
            let imageData = picture?.jpegData(compressionQuality: 1.0)
                newHistory.picture = imageData
                
            
            newHistory.result = result
            newHistory.translatedText = translatedText
            
            PersistenceController.shared.save()
           
            
            
       }
    }
            struct ImgeReco_Previews: PreviewProvider {
                static var previews: some View {
                    ImgeReco(viewModel: ViewModel())
                      //  .environment(\.locale, .init(identifier: "en"))
                 
                }
            }
        
        
     import AVKit

       class SynthViewModel: NSObject {
         private var speechSynthesizer = AVSpeechSynthesizer()
         
         override init() {
           super.init()
           self.speechSynthesizer.delegate = self
         }
         // ممكن تضيفين متغير ياخذ الللغه من الفيو مثال , code: String في الفانكشن اللي تحت
           func speak(text: String , code: String) {
               print("code : \(code)")
               print("text : \(text)")
           let utterance = AVSpeechUtterance(string: text)
             utterance.rate = AVSpeechUtteranceDefaultSpeechRate;
             utterance.voice = AVSpeechSynthesisVoice(language: code)
             print(AVSpeechSynthesisVoice.speechVoices())
           speechSynthesizer.speak(utterance)
         }
       }

       extension SynthViewModel: AVSpeechSynthesizerDelegate {
         func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
           print("started")
         }
         func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didPause utterance: AVSpeechUtterance) {
           print("paused")
         }
         func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didContinue utterance: AVSpeechUtterance) {}
         func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didCancel utterance: AVSpeechUtterance) {}
         func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, willSpeakRangeOfSpeechString characterRange: NSRange, utterance: AVSpeechUtterance) {}
         func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
           print("finished")
         }
       }

