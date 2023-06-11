//
//  DataModwlLandmark.swift
//  Project2030
//
//  Created by Hibah Abdullah Alatawi on 05/11/1444 AH.
//Created by azizah ahmad alshami on 05/06/1444 AH.
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
         imagee: "BRF1",
        descriptionn: "The Al Faisaliah Tower is a commercial skyscraper and complex located in Riyadh, Saudi Arabia. This tower is 267 meters high with 55 stories and is famous for being the first skyscraper to be built in Saudi Arabia.  The Al Faisaliah Complex was designed by the well known British Architect firm,  Foster + Partners.\n\nShaped like an elongated pyramid, the Al Faisaliah Tower looks futuristic, especially at night as it stands out from afar. The tower is famous for the enormous glass globe that is located near the apex. The globe is 24 meters in diameter and is made of 655 glass panels. Another famous element of this building is its lobby’s monumental stained-glass walls that were designed by artist Brian Clarke. Currently, the tower is the fourth tallest in Saudi Arabia and ranks as the 325th tallest building in the world.\n\nInside the tower are apartments, restaurants, offices, the Sky shopping mall, and a viewing platform. From the viewing platform, tourists can marvel at the Riyadh skyline including the iconic Kingdom Tower. This activity alone attracts the biggest number of tourists, as it is not every day that you get to be on top of one of the biggest cities in the world.  At the top of the tower is the Globe Restaurant, which is located inside the golden sphere and requires a reservation to visit.\n\nThe Al Faisaliah complex includes the adjacenet five star Al Faisaliah Hotel and fine dining restaurants including the Italian restaurant,  Mamo Michelangelo , LPM Riyadh, Meraki, Entrecote Cafe de Paris as well Mode Mall which contains the famous Yauatcha Riyadh which is a fine dining Chinese restaurant.\n\nAccess to the tower is limited, and is only open from 12 pm to 12 am, and you have to pay a fee of 63 Saudi riyals in order to go up. With some of the best food and an amazing atmosphere, the tower is among the top places tourists should visit if they are in the city.",Otherimage: ["BRF2","BRF3","BRF4","BRF5"]),
    
    landmark(
        titlee: "Al-Masmak Palace",
        tag: "Al-Masmak Palace",
        placee: "Riyadh",
        imagee: "qm1",
        descriptionn: "Sitting in the heart of Saudi Arabia’s biggest metropolis, Riyadh, the 150-year old Al Masmak Palace serves as a museum displaying different historical artifacts, works of art, weapons, maps, and other exhibits of Saudi history.  Built in 1865, this historic palace served many purposes over the years and was originally used as a base for the military . The fortress was eventually conquered by King Abdul Aziz when his forces took control of Riyadh in 1902 and unified the kingdom.\n\nThe fortress is a proud indicator of the Saudi kingdom’s regain of control over Riyadh, which makes it the perfect place to display remnants of Saudi history and roots. Exhibits at this museum include photographs dating to the early 20th century, works of art, and audiovisual presentations. Visitors to the museum can also watch a documentary exhibiting the regain of control of the fortress by the kingdom.\n\nA palm tree gate leads into the museum from an open plaza and is known as al-Khokha, which only allows one person to pass through at a time for security measures. Some of the major museum attractions include the spacious courtyard outside the fortress which is a common point of exploration for tourists, the watchtowers that look over the city, historic artworks dating back to the early 20th century and even earlier, and several freshwater wells. Souq Al Zal, a famous Saudi market, is located right next to the museum which is a great place to get souvenirs that represent Saudi culture in the form of jewelry and handicrafts.", Otherimage: ["qm2","qm3","qm4","qm5"]),
    
    landmark(
        titlee: "Almuraba Palace",
        tag: "Almuraba Palace",
        placee: "Riyadh",
        imagee: "qmor1",
        descriptionn: "The Murabba Historical Palace, also known as the Qasr al Murabba, which means 'the square' in Arabic, is located in Riyadh, Saudi Arabia. To be exact, it is located two kilometers to the north of the old city of Riyadh, about half a mile away from the Masmak fort.\n\nThe palace is known to be the first building to be built outside the old city's walls and was initially built by King Abdulaziz, who is known as the founder of modern Saudi Arabia. The construction began in 1936 and came to an end in 1945. At the time of construction, the palace was built as a residential place for the king's family and his court. As of now, it is one of the museums of the city.\n\nThe building is made up of several palaces used for different purposes. The cubic building had it all, ranging from residential buildings and service facilities to diwan of the king and a vast and breezy courtyard surrounding the building. Around the courtyard is a brick wall, having a total of nine gates. As of now, the main gate is the one on the southern side, as it allows a very short link to the nearby mosque.\n\nThere are many attractions in the museum that attract tourists, some of the most popular of which are the personal belongings of King Abdulaziz and photographs from meetings he conducted with prominent people from all over the world. ", Otherimage:["qmor2","qmor3","qmor4"]),
    
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
        imagee: "BRM1",
        descriptionn: "Kingdom Centre Tower is a skyscraper located in the heart of Riyadh. The construction of the tower was completed in 2002, and since then, it has become one of the tallest buildings in Saudi Arabia, with 99 stories. The tower consists of malls, hotels, offices, and luxury apartments. Its height of 992 ft and its unique inverted parabolic arch helps it stand out against a sea of skyscrapers and tall buildings. It is also home to the five star Four Seasons Hotel Riyadh, which is where the footballer, Christiano Ronaldo famously stayed with his family when he arrived in Riyadh.\n\nThe highlight of the tower is its 65m sky bridge that is located on top of the skyscraper. It is shaped as an enclosed corridor with windows on both sides. Visitors can take two elevators to reach the floor after paying the entrance fee. The bridge offers a remarkable sight of the Riyadh skyline that cannot be viewed from any other place.\n\nWhile the day offers a clear view of the surroundings, the night view is even better, with the city lights resembling tiny stars in the dark.\n\nThe Al Mamlaka shopping mall is located in the East wing, which houses more than 150 stores. The west wing is for entertainment; it has a VOX cinema with a VIP lounge and waiter service along with high-quality audio and visuals to provide the best viewing experience to the audience.\n\nYou will also find all sorts of dining options here, from boutique restaurants and steakhouses to fast food chains and ice cream parlors. All and all, The Kingdom Center Tower is the complete package; it provides you everything you could possibly want under one roof.",Otherimage: ["BRM2","BRM3","BRM4","BRM5"]),
    
    landmark(
    
    titlee: "Madain Saleh",
    tag: "Madain Saleh",
    placee: "Al-Ula",
    imagee: "MD1",
    descriptionn: "Hegra, or Mada'in Saleh, is an archaeological site located in Al Ula. Once home to an ancient civilization, the site was the kingdom's southernmost and largest settlement after Petra. Visitors can marvel at the remnants of the lost civilisation and natural beauty of the surrounding landscape.\n\n Mada'in Saleh is famous for Prophet Saleh (Peace be upon him) and his camel. The people of Thamud lived in Hegra and carved houses inside the mountains, thinking themselves to be invincible. According to Muslim belief, Prophet Saleh was sent to these people to bring God's message. However, the people demanded a miracle, and so a camel came out of the mountains. The Prophet forbade the people to bother the camel, but they did not listen and ended up killing the poor creature. As a result, severe earthquakes destroyed the entire tribe. The land violently shook, destroying all living creatures in it.\n\nAll the tombs vary in size, from small one-room tombs to bigger ones that can fit multiple people. Some of these tombs are easily accessible, while you have to climb to see some. However, visitors are only allowed to go inside three of them which are easily reachable.\n\nThe site has just only recently been opened to tourists, and a ticket is needed to enter it. There is also a bus with a tour guide that takes the tourists to the site. Other than Madain Saleh, you can also check out the railway station museum in Hegra that houses ancient historical artifacts.",Otherimage: ["MD2","MD3","MD4","MD5"]),
    
    
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
    imagee: "EL5",
    descriptionn: "The Elephant Rock (Jabal AlFil) is one of the world’s most popular rocks formations and the highlight of the region of Al Ula, a city of the Madinah Province in Saudi Arabia. Looking at it from afar, this rocks seems like an elephant with a ground-bound trunk. The Elephant Rock is also known as Jabal-Al’fil in the Arabic language. Standing at a height of 52 meters, the giant rock climbs three stories into the Arabian sky. It is hard to look at the gargantuan Elephant Rock and not feel awestruck by its tremendous size.\n\nThis mammoth stands out among the other hand-carved, ornate structures of nearby Hegra’s Nabataean tombs as it was shaped by natural forces. The trunk and body of this red sandstone beast were shaped through water and wind erosion that was caused over millions of years.\n\nThe huge elephant stands in a landscape of golden sands, surrounded by other rocky formations which are equally impressive in size. Regardless, the Elephant Rock still overshadows all that falls in its sight and acts as reminder of the sands of time. The beauty of this mighty elephant only increases at nightfall where it becomes more lifelike in the warm lights that have been installed at the site. Visiting the rock at night is advantageous to avoid the hot weather during the day.\n\nThere are some seating arrangements near the rock, with sunken sofa areas and the option to light a fire; visitors can sit and enjoy the music and mountains. Coffee shops are located nearby where drinks and snacks are available. Most of the food places open at 4 pm, therefore it is advised to carry water along with some snacks due to the hot weather.",Otherimage: ["EL1","EL2","EL3","EL4"]),

    
    landmark(
    titlee: "The Floating Mosque In Jeddah",
    tag: "The Floating Mosque In Jeddah",
    placee: "Jeddah",
    imagee: "flo1",
    descriptionn: "Located on the edge of the Corniche Road in Jeddah, Saudi Arabia is the Al Rahma Floating Mosque, also known as Fatima Al Zahra Mosque. It lies on the northern tip of Jeddah’s waterfront across the Red Sea and is attached to the shore by a walkway surrounded by low walls. The mosque was built in 1985 and is one of Jeddah’s most visited mosques.\n\n It is known as the ‘floating mosque’ because at high tide, the mosque appears to hover over the waves of the Red Sea below and also because of the stilts that suspend it above the edge of the water.\nThe mosque combines ancient and modern Islamic architecture. It is built in the form of a turquoise domed structure with a white minaret and also consists of 52 outer domes in addition to its main dome. There are also 23 external umbrellas, which are engraved with verses of the Holy Quran.\n\nThe mosque has a total of 56 windows, all designed in the Islamic style. The central dome is supported by eight pillars and the roof is inlaid with stained glass, from which hangs a chandelier. The mosque is now equipped with advanced lighting and sound systems. Facilities in the mosque include a prayer area and an area for wudhu (abulation).\n\nThe mosque has an open courtyard which offers spectacular views of the coast and a chance to enjoy the sea breeze with the sound of waves adding serenity to the ambience.",Otherimage: ["flo2","flo3","flo4","flo5"]),


    landmark(
    titlee: "Wadi Al-Disa",
    tag: "Wadi Al-Disa",
    placee: "Tabuk",
    imagee: "wd2",
    descriptionn: "Wadi Disah is a mountainous region and one of the most beautiful natural landscapes in Saudi Arabia. The valley provides a secluded escape from the hustle and bustle of city life for those wanting to experience nature in its pure form.\n\nNestled between the towering escarpments in the northern region of Saudi Arabia in the Tabuk Province, the valley lies 400 meters above sea level. Although the summers are not as hot as the rest of the southern Saudi Arabia, it is better to visit the valley during winters. The valley has two entrances, however the southern entrance is considered the more beautiful one.\n\nThe name Al Disah translates to “The Valley of Palm Trees” because the valley floor is surrounded by huge sandstone cliffs that are perfect for exploration. Another reason why this valley attracts many visitors every year is because tourists can easily go camping or hiking because of the pleasant temperature during the winter months. Camping under the unpolluted night sky provides a breathtaking experience. Many of the Saudis have picnics at the entrance of the valley. Tourists often stay until the evenings to witness light playing on the sandstone cliffs during sunset.\n\nThose who want to go on a road trip to the valley should take plenty of water with them. It is also a good idea to download offline maps to know exactly where you need to go. People planning backpacking trips to the valley should take their camping gear along with them. Due to the lack of facilities near the valley, it is better to pick up snacks and overnight food from Tabuk, especially if you are going camping. It is also recommended to travel on a 4×4 vehicle if you plan to drive off the main road.",Otherimage: ["wd1","wd3","wd4","wd5"]),

    
]
