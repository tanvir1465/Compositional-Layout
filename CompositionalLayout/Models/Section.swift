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
    case featured
    case row
    case rowBig
}
