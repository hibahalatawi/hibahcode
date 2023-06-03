//
//  DataModwlLandmark.swift
//  Project2030
//
//  Created by Hibah Abdullah Alatawi on 05/11/1444 AH.
//

import Foundation

struct landmark: Identifiable {
    var id = UUID ()
    var titlee: String
    var placee: String
    var imagee: String
    var descriptionn: String
    var Otherimage: [String]
    
}
let Landmarkdata: [landmark] = [
    
   
    landmark(
        titlee: "landmark1",
        placee: "Riyadh",
         imagee: "M9",
        descriptionn: "hhhhhhbjhnbje gljbvnerlgknbvlekgj blejrnvkengrjbhnvkengkjbnerhlbnekvnuhgnekjjkfjkfjfjfnjvnvjsp;sakdjoiuytrewasdfghjkl;.,mnbvcxsdfghjklpoiuytrerftghyjkl.,m nbvcxsderftyuiol,mnbvcxswertyuiop;lkmnbvzxcvbnasdfghjklwertyuioasdfghjkl;zxcvbnm,",Otherimage: ["M1","M2"]),
    
    landmark(
        titlee: "Makkah Clock Royal Tower",
        placee: "Makkah",
        imagee: "M5",
        descriptionn: " Makkah Clock Royal Tower hotel is located in the prestigious Clock Towers Complex, offering a unique opportunity to reside in elegantly furnished and superbly serviced residences with breath-taking views of the Holy Kaaba.Seize every moment at Makkah Clock Royal Tower, A Fairmont Hotel and create unforgettable memories at the heart of Makkah just a few steps away from the Holiest spot. with its 76 floors Makkah Clock Royal Tower, A Fairmont Hotel stands as an iconic symbol of Arab hospitality and a beacon for pilgrims in the heart of the Holy City as it's marked as one of the world's tallest buildings holding the world's biggest clock.Luxury 5-Star hotel steps away from haram Clock Royal Tower, A Fairmont Hotel is the perfect place to experience Mecca, umrah, hajj and its surroundings Elegantly furnished and superbly serviced residences with breathtaking views of Masjid Al Haram and the Holy Ka'aba. The site of the complex is across the piazza to the south from the main entrance (King Abdul-Aziz Gate) to the Masjid al Haram mosque, which houses the Kaaba. It accommodates worshippers visiting the Kaaba. The tallest tower in the complex also contains a five-star hotel, operated by Fairmont Hotels and Resorts, to help provide lodging for the millions of pilgrims that travel to Mecca annually to participate in the Hajj.n addition, The Clock Towers has a five-story shopping mall (The Clock Towers Shopping Center) and a parking garage capable of holding over a thousand vehicles.", Otherimage: ["M1","M2"]),
    
    landmark(
        titlee: "Winter Wonderland",
        placee: "Riyadh",
        imagee: "M8",
        descriptionn: "Riyadh hosts Winter Wonderland, the biggest theme park in its third season, combining rides & adventures in a unique experience for all ages. More than 80 different experiences including thrill, family, kids rides, and different characters & musical shows.Riyadh Winter Wonderland was initially inaugurated as a 50-acres theme park on October 20, 2019 during the first week of the 2019 edition of Riyadh Season as one of the zones of the entertainment festival.The theme park offered 42 games, including the largest skating rink in the Middle East, theatrical performances, Real Madrid club exhibition, and illusionist acts.Originally scheduled till 15 December 2019, however, Crown Prince Mohammed bin Salman issued directives in November 2019 for the extension of Riyadh Season till the end of January 2020 in selected zones that were attracting more visitors, including Winter Wonderland.During the 2021 edition of Riyadh Season, the Winter Wonderland was relaunched by the General Entertainment Authority on 26 October 2021.The area of theme park saw an increase of almost 40% compared to the 2019 edition of Riyadh Season and offered much more recreational choices.As the weather starts to improve in Riyadh winter season that resembles London’s weather, residents and visitors from neighboring countries are eagerly anticipating this event. It will include theatrical performances, Marvel's world, Real Madrid club exhibition, and illusionist acts. “Wonderland” also includes many large games, such as the Ferris wheel, which enables its passengers to enjoy spectacular views.", Otherimage:["M1","M2"]),
    landmark(
        titlee: "Jabal AlFil",
        placee: "Alula",
        imagee: "M7",
        descriptionn: "(Jabal AlFil) is one of the world’s most popular rocks formations and the highlight of the region of Alula a city of the Madinah Provine in Saudi Arabia. Looking at it from afar, this rocks seems like an elephant with a ground-bound trunk. The Elephant Rock is also known as Jabal-Al’fil in the Arabic language. Standing at a height of 52 meters, the giant rock climbs three stories into the Arabian sky. It is hard to look at the gargantuan Elephant Rock and not feel awestruck by its tremendous size.This mammoth stands out among the other hand-carved, ornate structures of nearby Hegra’s Nabataean tombs as it was shaped by natural forces. The trunk and body of this red sandstone beast were shaped through water and wind erosion that was caused over millions of years.The huge elephant stands in a landscape of golden sands, surrounded by other rocky formations which are equally impressive in size. Regardless, the Elephant Rock still overshadows all that falls in its sight and acts as reminder of the sands of time. The beauty of this mighty elephant only increases at nightfall where it becomes more lifelike in the warm lights that have been installed at the site. Visiting the rock at night is advantageous to avoid the hot weather during the day. There are some seating arrangements near the rock, with sunken sofa areas and the option to light a fire; visitors can sit and enjoy the music and mountains. Coffee shops are located nearby where drinks and snacks are available. Most of the food places open at 4 pm, therefore it is advised to carry water along with some snacks due to the hot weather.",Otherimage:["M1","M2"]),
    
    landmark(
        titlee: "The floating mosque",
        placee: "Jeddah",
        imagee: "M4",
        descriptionn: "The floating mosque in Jeddah is not just a mosque to establish Islamic religious rituals in the Saudi city of Jeddah, but it is the distinguished and most famous mosque within the Kingdom of Saudi Arabia, to build and view the Red Sea coast, and even became the kiss of all visitors and the people of the city.The floating mosque in Jeddah was built in 1985 AD, within the middle of the Red Sea coast, to be surrounded by seawater from all sides, and its facade and view are overlooking the waters of the coast, it was built in the name of Al-Rahma Mosque, but it is famous as the floating mosque.The floating mosque in Jeddah has become a local landmark within the city of Jeddah, and all families and visitors prefer to perform the five prayers inside the mosque, and they also like to walk in the mosque square, to enjoy the breezes of the air and its location within the coast, as well as the elegance of marble.The mosque was called the floating mosque because the waters of the Red Sea flood it and surround it from every side at the tide and the height of the water level, so it is that the mosque is floating.", Otherimage: ["M1","M2"]),
    
    landmark(
        
        titlee: "Al Masmak",
        placee: "Riyadh",
        imagee: "M3",
        descriptionn: "Al-Masmak Palace is located in the center of Riyadh, and inside the old Riyadh dervis, originally named (Al-Masmak Palace), due to the thickness of its walls and roles, built during the reign of Imam Abdullah bin Faisal bin Turki Al Saud - may God rest his soul.Al-Masmak Palace is considered one of the most prominent national landmarks, as it was the scene of the battle for the recovery of Riyadh by His Majesty King Abdulaziz - may God rest his soul -, and the palace door still preserves some traces of that battle. Ibn Jalawi's spearhead is still stuck in it, and it is one of the authentic and existing Riyadh buildings to this day. Today, the palace contains a museum dedicated to the story of uniting the Kingdom, and it was designed to be divided into 6 main parts: the palace gate on the western side, the mosque to the left of the entrance, the council or Diwaniyah in the entrance facade, the well on the northeastern side, the towers on each of its four corners, and the courtyard surrounded by rooms with connected columns Some of them internally, in addition to the palace included 3 housing units, the first was for the governor's residence, the second used a house for money, and the third was allocated for guest accommodation.d Heritage List.",Otherimage: ["M1","M2"]),
    
    
]
