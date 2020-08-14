//
//  LayoutBuilder.swift
//  CompositionalLayout
//
//  Created by Tanvir Hasan Piash on 14/8/20.
//  Copyright © 2020 Tanvir Hasan Piash. All rights reserved.
//

import UIKit

fileprivate typealias Size = NSCollectionLayoutSize
fileprivate typealias Item = NSCollectionLayoutItem
fileprivate typealias Group = NSCollectionLayoutGroup
fileprivate typealias LayoutSection = NSCollectionLayoutSection

enum LayoutBuilder {
    
    public static func featuredAppsSectionLayout() -> NSCollectionLayoutSection {
        let size = Size(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = Item(layoutSize: size)
        let groupSize = Size(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let group = Group.horizontal(layoutSize: groupSize, subitems: [item])
        let layout = LayoutSection(group: group)
        layout.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        return layout
    }
    
}
