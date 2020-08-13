//
//  AppsViewController.swift
//  CompositionalLayout
//
//  Created by Tanvir Hasan Piash on 13/8/20.
//  Copyright © 2020 Tanvir Hasan Piash. All rights reserved.
//

import UIKit

fileprivate typealias DataSource = UICollectionViewDiffableDataSource<Section, App>

class AppsViewController: UIViewController {
    
    var collectionView: UICollectionView!
    
    let sections = Bundle.main.decode([Section].self, from: "dummyApps.json")
    fileprivate var dataSource: DataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Apps"
        
        addCollectionView()
        registerCells()
    }
    
    fileprivate func addCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        view.addSubview(collectionView)
    }
    
    fileprivate func registerCells() {
        
    }
    
}
