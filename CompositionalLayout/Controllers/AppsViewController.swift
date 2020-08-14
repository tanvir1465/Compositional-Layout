//
//  AppsViewController.swift
//  CompositionalLayout
//
//  Created by Tanvir Hasan Piash on 13/8/20.
//  Copyright © 2020 Tanvir Hasan Piash. All rights reserved.
//

import UIKit

fileprivate typealias DataSource = UICollectionViewDiffableDataSource<Section, App>
fileprivate typealias Snapshot = NSDiffableDataSourceSnapshot<Section, App>

class AppsViewController: UIViewController {
    
    var collectionView: UICollectionView!
    
    let sections = Bundle.main.decode([Section].self, from: "dummyApps.json")
    fileprivate var dataSource: DataSource?
    fileprivate var snapshot = Snapshot()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Apps"
        
        addCollectionView()
        registerCells()
        configureDataSource()
        configureSnapshot()
        dataSource?.apply(snapshot)
    }
    
    fileprivate func addCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: configureCompositionalLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        collectionView.showsVerticalScrollIndicator = false
        view.addSubview(collectionView)
    }
    
    fileprivate func registerCells() {
        collectionView.register(AppsSectionHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AppsSectionHeaderCell.reuseIdentifier)
        collectionView.register(FeaturedAppsCell.self, forCellWithReuseIdentifier: FeaturedAppsCell.reuseIdentifier)
        collectionView.register(ThreeRowsAppsCell.self, forCellWithReuseIdentifier: ThreeRowsAppsCell.reuseIdentifier)
        collectionView.register(TwoRowsAppsCell.self, forCellWithReuseIdentifier: TwoRowsAppsCell.reuseIdentifier)
    }
    
    fileprivate func configureCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (index, environment) -> NSCollectionLayoutSection? in
            let section = self.sections[index]
            switch section.type {
            case .featured:
                return LayoutBuilder.featuredAppsSectionLayout()
            case .rowBig:
                return LayoutBuilder.twoRowsSectionLayout()
            default:
                return LayoutBuilder.threeRowsSectionLayout()
            }
        }
        let layoutConfiguration = UICollectionViewCompositionalLayoutConfiguration()
        layoutConfiguration.interSectionSpacing = 20
        layout.configuration = layoutConfiguration
        return layout
    }
    
    fileprivate func configureDataSource() {
        dataSource = DataSource(collectionView: collectionView, cellProvider: { (collectionView, indexPath, app) -> UICollectionViewCell? in
            switch self.sections[indexPath.section].type {
            case .featured:
                return CellBuilder.render(FeaturedAppsCell.self, for: collectionView, with: app, for: indexPath)
            case .rowBig:
                return CellBuilder.render(TwoRowsAppsCell.self, for: collectionView, with: app, for: indexPath)
            default:
                return CellBuilder.render(ThreeRowsAppsCell.self, for: collectionView, with: app, for: indexPath)
            }
        })
        
        dataSource?.supplementaryViewProvider = { [weak self] (collectionView, kind, indexPath) -> UICollectionReusableView? in
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AppsSectionHeaderCell.reuseIdentifier, for: indexPath) as? AppsSectionHeaderCell else { return nil }
            guard let item = self?.dataSource?.itemIdentifier(for: indexPath) else { return nil }
            guard let section = self?.dataSource?.snapshot().sectionIdentifier(containingItem: item) else { return nil }
            header.titleLabel.text = section.title
            return header
        }
    }
    
    fileprivate func configureSnapshot() {
        snapshot.appendSections(sections)
        for section in sections {
            snapshot.appendItems(section.apps, toSection: section)
        }
    }
    
}
