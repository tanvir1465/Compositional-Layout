//
//  Section.swift
//  CompositionalLayout
//
//  Created by Tanvir Hasan Piash on 14/8/20.
//  Copyright © 2020 Tanvir Hasan Piash. All rights reserved.
//

import Foundation

struct Section: Decodable, Hashable {
    let id: Int
    let type: SectionType
    let title: String
    let subtitle: String
    let apps: [App]
}

enum SectionType: String, Decodable {
    case featured = "Featured"
    case newToPhone = "New To iPhone"
    case popular =  "Popular Apps"
    case madeForKids = "Made For Kids"
    case appWeLove = "Apps We Love Right Now"
}
