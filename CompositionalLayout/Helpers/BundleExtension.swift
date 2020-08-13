//
//  BundleExtension.swift
//  CompositionalLayout
//
//  Created by Tanvir Hasan Piash on 14/8/20.
//  Copyright © 2020 Tanvir Hasan Piash. All rights reserved.
//

import Foundation

extension Bundle {
    
    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else { fatalError() }
        guard let data = try? Data(contentsOf: url) else { fatalError() }
        guard let result = try? JSONDecoder().decode(T.self, from: data) else { fatalError() }
        return result
    }
    
}
