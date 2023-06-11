//
//  ModelData .swift
//  hibahcode
//
//  Created by amalghurm on 17/11/1444 AH.
//


import SwiftUI

struct malm: Identifiable {
    var id = UUID ()
    var title: String
    var place: String
    var image: String
    var description: String
    var Gimage: [String]
    
}

class HomeModel:ObservableObject{
    
    // propareties for image viwer
    @Published var showImageViewer = false
    @Published var selectedImageID : String = ""
    @Published var imageViewer0ffset: CGSize = .zero
    @Published var bgOpacity: Double = 1
    // Scaling.
    @Published var imageScale: CGFloat = 1
    
    func onChange (value: CGSize) {
        // updating Offset.
        imageViewer0ffset = value
        
        // calculating opactity...
        let halgHeight = UIScreen.main.bounds.height / 2
        
        let progress = imageViewer0ffset.height / halgHeight

        withAnimation (.default){
            bgOpacity = Double(1 - (progress < 0 ? -progress : progress))
        
        }
        
    }
    func onEnd(value: DragGesture.Value) {
        withAnimation (.easeInOut){
            var translation = value.translation.height
            if translation < 0{
            translation = -translation
            }
            if translation < 250{
            imageViewer0ffset = .zero
                bgOpacity = 1
            }
            else{
                showImageViewer.toggle()
                imageViewer0ffset = .zero
                bgOpacity = 1
                
            }
        }
    }
    
}

let malmdata: [malm] = [
    
   
    malm(
        title: "Burj Rafal",
        place: "Riyadh",
        image: "M9",
        description:"Headquartered in Al Riyadh, RAFAL Real Estate Co. was formed in late 2007, with the objective of developing distinguished communities providing a unique lifestyle, offering both clients and investors a real opportunity to live and invest.RAFAL is owned by leading business groups in KSA, namely, Lafana, A. K. Al Muhaidib & Sons Group and Arabian Tawazon for Commercial Investm.Opened in January 2014, this unique and glorious vertical residential and self-sustained community is a landmark of 70 floors constructed on an exclusive 20,000sqm plot. It is the nearest luxurious vertical property to the KKIA and has the advantage of alternate accessibility. The community is equipped with state-of-the-art facilities and fully integrated systems aligned with Kempinski Hotel – one of the most renowned luxurious European hotels in the world.Living Style Unique, luxurious vertical residential apartments in compound-style living. An inspiration. The scale, the attention to detail: the mind races to take it all in. Pinch yourself if you need to, comprehend where you are, take your time. This is more than accommodation, this is a SUITE LIVING; and once you’re inside its cool walls, the effect is even more dazzling – dare we say ’humbling’. What you considered the lap of luxury is suddenly real. Apartment Types The general layouts of the apartments were designed in the character and essence of the Kempinski suites to match an elegant lifestyle. The only elegant luxurious apartments in a vertical community with a compound-style living are a dream come true.",
        Gimage: ["M9-1","M9-2","M9-3"]),
    
    malm(
        title: "Clock Tower",
        place: "Makkah",
        image: "A3",
        description: " Makkah Clock Royal Tower hotel is located in the prestigious Clock Towers Complex, offering a unique opportunity to reside in elegantly furnished and superbly serviced residences with breath-taking views of the Holy Kaaba.Seize every moment at Makkah Clock Royal Tower, A Fairmont Hotel and create unforgettable memories at the heart of Makkah just a few steps away from the Holiest spot. with its 76 floors Makkah Clock Royal Tower, A Fairmont Hotel stands as an iconic symbol of Arab hospitality and a beacon for pilgrims in the heart of the Holy City as it's marked as one of the world's tallest buildings holding the world's biggest clock.Luxury 5-Star hotel steps away from haram Clock Royal Tower, A Fairmont Hotel is the perfect place to experience Mecca, umrah, hajj and its surroundings Elegantly furnished and superbly serviced residences with breathtaking views of Masjid Al Haram and the Holy Ka'aba. The site of the complex is across the piazza to the south from the main entrance (King Abdul-Aziz Gate) to the Masjid al Haram mosque, which houses the Kaaba. It accommodates worshippers visiting the Kaaba. The tallest tower in the complex also contains a five-star hotel, operated by Fairmont Hotels and Resorts, to help provide lodging for the millions of pilgrims that travel to Mecca annually to participate in the Hajj.n addition, The Clock Towers has a five-story shopping mall (The Clock Towers Shopping Center) and a parking garage capable of holding over a thousand vehicles.",
        Gimage: ["M5-1","M5-2","M5-3"]),
    
    malm(
        title: "Wonderland",
        place: "Riyadh",
        image: "S1",
        description: "Riyadh hosts Winter Wonderland, the biggest theme park in its third season, combining rides & adventures in a unique experience for all ages. More than 80 different experiences including thrill, family, kids rides, and different characters & musical shows.Riyadh Winter Wonderland was initially inaugurated as a 50-acres theme park on October 20, 2019 during the first week of the 2019 edition of Riyadh Season as one of the zones of the entertainment festival.The theme park offered 42 games, including the largest skating rink in the Middle East, theatrical performances, Real Madrid club exhibition, and illusionist acts.Originally scheduled till 15 December 2019, however, Crown Prince Mohammed bin Salman issued directives in November 2019 for the extension of Riyadh Season till the end of January 2020 in selected zones that were attracting more visitors, including Winter Wonderland.During the 2021 edition of Riyadh Season, the Winter Wonderland was relaunched by the General Entertainment Authority on 26 October 2021.The area of theme park saw an increase of almost 40% compared to the 2019 edition of Riyadh Season and offered much more recreational choices.As the weather starts to improve in Riyadh winter season that resembles London’s weather, residents and visitors from neighboring countries are eagerly anticipating this event. It will include theatrical performances, Marvel's world, Real Madrid club exhibition, and illusionist acts. “Wonderland” also includes many large games, such as the Ferris wheel, which enables its passengers to enjoy spectacular views.",
        Gimage: ["M8-1","M8-2","M8-3"]),
    malm(
        title: "AlMajdul Tower",
        place: "Riyadh",
        image: "D3",
        description: "A new addition to the features of Riyadh with a unique 135-degree design that reflects the concept of non-traditional architecture to be the focus of the world’s eye and a model for the vision and aspirations of the company and the level look forward to.Majdoul Tower designed to reflect the sheer elegance and luxury that every-one has always been dreaming of. Destined to be one of the most desirable destinations in Riyadh and a representation for the economic and commercial power experienced in Saudi Arabia.In order to achieve the Luxury and well-being of the Tower of Majdoul, interior design has been adopted to reflect the luxury and its implementation by professionals in the latest methods in the world of construction and the adoption of the best materials to achieve the highest quality required for the project.A new addition to the features of Riyadh with a unique 135-degree design that reflects the concept of non-traditional architecture to be the focus of the world’s eye and a model for the vision and aspirations of the company and the level look forward to.Majdoul Tower designed to reflect the sheer elegance and luxury that every-one has always been dreaming of. Destined to be one of the most desirable destinations in Riyadh and a representation for the economic and commercial power experienced in Saudi Arabia.In order to achieve the Luxury and well-being of the Tower of Majdoul, interior design has been adopted to reflect the luxury and its implementation by professionals in the latest methods in the world of construction and the adoption of the best materials to achieve the highest quality required for the project.",
        Gimage: ["M7-1","M7-2","M7-3"]),
    
    malm(
        title: "KAFD",
        place: "Riyadh",
        image: "M4",
        description: "KAFD was inspired by King Abdullah’s vision to create a new financial district that will take the economy of Riyadh to new heights. Following its acquisition by the Public Investment Fund (PIF) of Saudi Arabia, KAFD has evolved to become a prime business and lifestyle destination capturing the core values of Vision 2030. While contributing to the growth and diversification of the economy, provide our community with a vibrant experience in the heart of Riyadh. This city within a city, is redefining Riyadh’s skyline with outstanding buildings inspired by the native landscape. KAFD empowers businesses through access to advanced office infrastructure and sustainable smart city solutions, while simultaneously offering unique lifestyle experiences with leading leisure and retail facilities. KAFD: where you Envision, Accelerate, Live.The largest real estate project in the world with GFA of 5 million square meters.There will be over 5,000 residential units, 1 million sqm of Grade-A office space, 220,000 sqm of retail and F&B space and 110,000 sqm of entertainment space once the masterplan has been completed.The only LEED platinum certified mixed-use district in the world, achieving the highest possible accreditation from the world’s leading authority for Green Building.The only district that will have five key asset classes that makes it a truly 24x7 eco-system; offices, retail/F&B, residential, hotels  entertainment.Designed by more than 25 of the world’s most prominent architects and design firms, including Foster + Partners, Henning Larsen Architects and Gensler",
        Gimage: ["M4-1","M4-2","M4-3"]),
    
  //  malm(
   //     title: "Advertisement",
   //     place: "Riyadh",
     //   image: "M6",
    //    description: "KAFD was inspired by King Abdullah’s vision to create a new financial district that will take the economy of Riyadh to new heights. Following its acquisition by the Public Investment Fund (PIF) of Saudi Arabia, KAFD has evolved to become a prime business and lifestyle destination capturing the core values of Vision 2030. While contributing to the growth and diversification of the economy, provide our community with a vibrant experience in the heart of Riyadh. This city within a city, is redefining Riyadh’s skyline with outstanding buildings inspired by the native landscape. KAFD empowers businesses through access to advanced office infrastructure and sustainable smart city solutions, while simultaneously offering unique lifestyle experiences with leading leisure and retail facilities. KAFD: where you Envision, Accelerate, Live.The largest real estate project in the world with GFA of 5 million square meters.There will be over 5,000 residential units, 1 million sqm of Grade-A office space, 220,000 sqm of retail and F&B space and 110,000 sqm of entertainment space once the masterplan has been completed.The only LEED platinum certified mixed-use district in the world, achieving the highest possible accreditation from the world’s leading authority for Green Building.The only district that will have five key asset classes that makes it a truly 24x7 eco-system; offices, retail/F&B, residential, hotels  entertainment.Designed by more than 25 of the world’s most prominent architects and design firms, including Foster + Partners, Henning Larsen Architects and Gensler",
     //   Gimage: ["M4-1","M4-2","M4-3"]),
    

]
