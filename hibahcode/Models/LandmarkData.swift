//
//  LandmarkData.swift
//  hibahcode
//
//  Created by vdotup on 10/06/2023.
//

import Foundation

struct LandmarkData: Codable {
    let title: String
    let tag: String
    let place: String
    let imageName: String
    let otherImages: [String]
    let description: String
}
