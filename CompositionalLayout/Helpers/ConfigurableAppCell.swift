//
//  ConfigurableAppCell.swift
//  CompositionalLayout
//
//  Created by Tanvir Hasan Piash on 14/8/20.
//  Copyright © 2020 Tanvir Hasan Piash. All rights reserved.
//

import Foundation

protocol ConfigurableAppCell {
    static var reuseIdentifier: String { get }
    func configureCell(with app: App)
}
