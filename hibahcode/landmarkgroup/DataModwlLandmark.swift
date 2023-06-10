//
//  DataModwlLandmark.swift
//  Project2030
//
//  Created by Hibah Abdullah Alatawi on 05/11/1444 AH.
//

import Foundation
import SwiftUI
struct landmark: Identifiable {
    var id = UUID()
    var titlee: String
    var tag: String
    var placee: String
    var imagee: String
    var descriptionn: String
    var Otherimage: [String]
    
}

class HomeModelll:ObservableObject{
    
    // propareties for image viwer
    @Published var showImageViewerr = false
    @Published var selectedImageIDD : String = ""
    @Published var imageViewer0ffsett: CGSize = .zero
    @Published var bgOpacityy: Double = 1
    // Scaling.
    @Published var imageScalee: CGFloat = 1
    
    func onChangee (value: CGSize) {
        // updating Offset.
        imageViewer0ffsett = value
        
        // calculating opactity...
        let halgHeightt = UIScreen.main.bounds.height / 2
    
        let progresss = imageViewer0ffsett.height / halgHeightt

        withAnimation (.default){bgOpacityy = Double(1 - (progresss < 0 ? -progresss : progresss))
        
        }
        
    }
    func onEndd(value: DragGesture.Value) {
        withAnimation (.easeInOut){
            var translation = value.translation.height
            if translation < 0{
            translation = -translation
            }
            if translation < 250{
            imageViewer0ffsett = .zero
                bgOpacityy = 1
            }
            else{
                showImageViewerr.toggle()
                imageViewer0ffsett = .zero
                bgOpacityy = 1
                
            }
        }
    }
    
}

let Landmarkdata: [landmark] = [
    
   
    landmark(
        titlee: "Al Faisaliah Tower",
        tag: "Al Faisaliah Tower",
        placee: "Riyadh",
         imagee: "",
        descriptionn: "",Otherimage: ["",""]),
    
    landmark(
        titlee: "Al-Masmak Palace",
        tag: "Al-Masmak Palace",
        placee: "Riyadh",
        imagee: "",
        descriptionn: "", Otherimage: ["",""]),
    
    landmark(
        titlee: "Almuraba Palace",
        tag: "Almuraba Palace",
        placee: "Riyadh",
        imagee: "",
        descriptionn: "", Otherimage:["",""]),
    landmark(
        titlee: "Grammel Al-Ula",
        tag: "Grammel Al-Ula",
        placee: "Al-Ula",
        imagee: "",
        descriptionn: "",Otherimage:["",""]),
    
    landmark(
        titlee: "Ithra Adamam",
        tag: "Ithra Adamam",
        placee: "ALdamam",
        imagee: "",
        descriptionn: "", Otherimage: ["",""]),
    
    landmark(
        
        titlee: "Kingdom Tower",
        tag: "Kingdom Tower",
        placee: "Riyadh",
        imagee: "",
        descriptionn: "",Otherimage: ["",""]),
    
    landmark(
    
    titlee: "Madain Saleh",
    tag: "Madain Saleh",
    placee: "Al-Ula",
    imagee: "",
    descriptionn: "",Otherimage: ["",""]),
    
    
    landmark(
    titlee: "Rejal Almaa village",
    tag: "Rejal Almaa village",
    placee: "Aseer",
    imagee: "rj1",
    descriptionn: "Situated in the Asir region of Saudi Arabia, Rijal Alma Village is undoubtedly one of the most historically important and beautiful villages in the Middle East. Famous for its fascinating architecture, rich history, pleasant weather, and beautiful landscape, this small village served as the regional trade center through centuries and was the natural passage that connected Yemen and Lavant to Makkah and Madinah.\nThe village consists of 60 multiple-storey ancient buildings that were built using stone, clay, and wood while the hillside has several defensive watchtowers built strategically to maximize fields of view and firing range. As beautiful as the tall stone buildings are, the real wonders lie behind the stone and clay walls. Each house is decorated and painted by skilled artisans with the most fascinating color combinations and artworks. The village is surrounded by steep hills that look over a winding road that once served as one of the most important trade routes in the Arabian Peninsula.\nThe tallest fort in the village is the Fort of Al Jaber & Al Hawat while some of the other important forts include Forts of Maejib & Hakim, Msamr, al-Dir”iyyah, and al-Sisbae, each of which has its own unique history documented and preserved by the original families.\nRijal Alma is also home to the oldest museum in Saudi history which was established by the locals in one of the stone buildings in 1985 to preserve the village’s ancient history and heritage. The museum displays over 2800 exhibits of local history and over 500 kg of ancient local jewelry.\n",Otherimage: ["rj2","rj3","rj4","rj5"]),

    
    landmark(
    titlee: "The Elephant Mountain",
    tag: "The Elephant Mountain",
    placee: "Al-Ula",
    imagee: "",
    descriptionn: "",Otherimage: ["",""]),

    
    landmark(
    titlee: "The Floating Mosque In Jeddah",
    tag: "The Floating Mosque In Jeddah",
    placee: "Jeddah",
    imagee: "flo1",
    descriptionn: "Located on the edge of the Corniche Road in Jeddah, Saudi Arabia is the Al Rahma Floating Mosque, also known as Fatima Al Zahra Mosque. It lies on the northern tip of Jeddah’s waterfront across the Red Sea and is attached to the shore by a walkway surrounded by low walls. The mosque was built in 1985 and is one of Jeddah’s most visited mosques.\nIt is known as the ‘floating mosque’ because at high tide, the mosque appears to hover over the waves of the Red Sea below and also because of the stilts that suspend it above the edge of the water.\nThe mosque combines ancient and modern Islamic architecture. It is built in the form of a turquoise domed structure with a white minaret and also consists of 52 outer domes in addition to its main dome. There are also 23 external umbrellas, which are engraved with verses of the Holy Quran.\nThe mosque has a total of 56 windows, all designed in the Islamic style. The central dome is supported by eight pillars and the roof is inlaid with stained glass, from which hangs a chandelier. The mosque is now equipped with advanced lighting and sound systems. Facilities in the mosque include a prayer area and an area for wudhu (abulation).\nThe mosque has an open courtyard which offers spectacular views of the coast and a chance to enjoy the sea breeze with the sound of waves adding serenity to the ambience.",Otherimage: ["flo2","flo3","flo4","flo5"]),


    landmark(
    titlee: "Wadi Al-Disa",
    tag: "Wadi Al-Disa",
    placee: "Jeddah",
    imagee: "M3",
    descriptionn: "",Otherimage: ["",""]),

    
]
