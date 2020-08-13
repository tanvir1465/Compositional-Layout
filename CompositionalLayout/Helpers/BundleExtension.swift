//
//  BundleExtension.swift
//  CompositionalLayout
//
//  Created by Tanvir Hasan Piash on 14/8/20.
//  Copyright © 2020 Tanvir Hasan Piash. All rights reserved.
//

import Foundation

extension Bundle {
    
    func decode<T: Decodable>(_ type: T.Type, from file: String) ->T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("The file you are trying to decode is unavailable")
        }
        do {
            let data = try Data(contentsOf: url)
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                return result
            } catch let error {
                print(error.localizedDescription)
            }
        } catch let error {
            print(error.localizedDescription)
        }
        fatalError("Something bad hapenned")
    }
    
}
