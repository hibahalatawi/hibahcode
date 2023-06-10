//
//  OnboardingStep.swift
//  hibahcode
//
//  Created by vdotup on 10/06/2023.
//

import Foundation

struct OnBoardingStep: Identifiable {
    let id: Int
    let image: String
    let title: String
    let description: String
    let lastStep: Bool
    
    init(id: Int, image: String, title: String, description: String, lastStep: Bool = false) {
        self.id = id
        self.image = image
        self.title = title
        self.description = description
        self.lastStep = lastStep
    }
}
