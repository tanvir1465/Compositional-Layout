//
//  CellBuilder.swift
//  CompositionalLayout
//
//  Created by Tanvir Hasan Piash on 14/8/20.
//  Copyright © 2020 Tanvir Hasan Piash. All rights reserved.
//

import UIKit

class CellBuilder {
    
    private init() {}
    static let shared = CellBuilder()
    
    public func render<T: ConfigurableAppCell>(_ cell: T.Type, for collectionView: UICollectionView, with app: App, for indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cell.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unable to dequeue requested cell")
        }
        cell.configure(with: app)
        return cell
    }
    
}
