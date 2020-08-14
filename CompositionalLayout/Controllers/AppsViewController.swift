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
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        view.addSubview(collectionView)
    }
    
    fileprivate func registerCells() {
        collectionView.register(FeaturedAppsCell.self, forCellWithReuseIdentifier: FeaturedAppsCell.reuseIdentifier)
    }
    
    fileprivate func configureDataSource() {
        dataSource = DataSource(collectionView: collectionView, cellProvider: { (collectionView, indexPath, app) -> UICollectionViewCell? in
            switch self.sections[indexPath.section].type {
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
