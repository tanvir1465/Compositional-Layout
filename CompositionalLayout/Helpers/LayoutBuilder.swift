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
fileprivate typealias SupplementaryItem = NSCollectionLayoutBoundarySupplementaryItem

enum LayoutBuilder {
    
    public static func featuredAppsSectionLayout() -> NSCollectionLayoutSection {
        let size = Size(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = Item(layoutSize: size)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6)
        let groupSize = Size(widthDimension: .fractionalWidth(0.95), heightDimension: .estimated(300))
        let group = Group.horizontal(layoutSize: groupSize, subitems: [item])
        let layout = LayoutSection(group: group)
        layout.orthogonalScrollingBehavior = .groupPagingCentered
        return layout
    }
    
    public static func threeRowsSectionLayout() -> NSCollectionLayoutSection {
        let size = Size(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.33))
        let item = Item(layoutSize: size)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6)
        let groupSize = Size(widthDimension: .fractionalWidth(0.95), heightDimension: .fractionalWidth(0.55))
        let group = Group.vertical(layoutSize: groupSize, subitems: [item])
        let layout = LayoutSection(group: group)
        layout.orthogonalScrollingBehavior = .groupPagingCentered
        let sectionHeader = createSectionHeader(with: 0.95)
        layout.boundarySupplementaryItems = [sectionHeader]
        return layout
    }
    
    public static func twoRowsSectionLayout() -> NSCollectionLayoutSection {
        let size = Size(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5))
        let item = Item(layoutSize: size)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6)
        let groupSize = Size(widthDimension: .fractionalWidth(0.95), heightDimension: .fractionalWidth(0.55))
        let group = Group.vertical(layoutSize: groupSize, subitems: [item])
        let layout = LayoutSection(group: group)
        layout.orthogonalScrollingBehavior = .groupPagingCentered
        let sectionHeader = createSectionHeader(with: 0.95)
        layout.boundarySupplementaryItems = [sectionHeader]
        return layout
    }
    
    private static func createSectionHeader(with fractionalWidth: CGFloat) -> SupplementaryItem {
        let headerSize = Size(widthDimension: .fractionalWidth(fractionalWidth), heightDimension: .estimated(52))
        let sectionHeader = SupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        return sectionHeader
    }
    
}
