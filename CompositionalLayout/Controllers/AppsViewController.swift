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
        collectionView.register(FeaturedAppsCell.self, forCellWithReuseIdentifier: FeaturedAppsCell.reuseIdentifier)
        collectionView.register(ThreeRowsAppsCell.self, forCellWithReuseIdentifier: ThreeRowsAppsCell.reuseIdentifier)
    }
    
    fileprivate func configureCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (index, environment) -> NSCollectionLayoutSection? in
            let section = self.sections[index]
            switch section.type {
            case .row:
                return LayoutBuilder.threeRowsSectionLayout()
            default:
                return LayoutBuilder.featuredAppsSectionLayout()
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
            case .row:
                return CellBuilder.render(ThreeRowsAppsCell.self, for: collectionView, with: app, for: indexPath)
            default:
                return CellBuilder.render(FeaturedAppsCell.self, for: collectionView, with: app, for: indexPath)
            }
        })
    }
    
    fileprivate func configureSnapshot() {
        snapshot.appendSections(sections)
        for section in sections {
            snapshot.appendItems(section.apps, toSection: section)
        }
    }
    
}
