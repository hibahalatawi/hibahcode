//
//  TabBarItem.swift
//  Project2030
//
//  Created by azizah ahmed alshami on 03/11/1444 AH.
//

import Foundation

enum TabBarItem: CaseIterable {
    case imageRec
   // case textRec
    case History
   
    
    var title: String {
        switch self {
        case .imageRec:   return NSLocalizedString("Image Rec", comment: "")
       // case .textRec:     return NSLocalizedString("Text Rec", comment: "")
        case .History:   return NSLocalizedString("History", comment: "")
        }
    }
    
    var imageName: String {
        switch self {
        case .imageRec:   return "photo"
       // case .textRec:     return "doc.plaintext"
        case .History:   return "doc.richtext"
 
        }
    }
}
