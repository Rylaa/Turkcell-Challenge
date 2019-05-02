//
//  saveFavoritePackages.swift
//  Homework Assignment
//
//  Created by Yusuf DEMİRKOPARAN on 24.04.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import Foundation
import SwiftyJSON
import UIKit

final class saveFavoritePackages {
    static let shared = saveFavoritePackages()
    public func saveFavorite(favoritePackage: [Package]) {
        if let data = UserDefaults.standard.data(forKey: "SavedItemArray") {
            var Result = try! PropertyListDecoder().decode([Package].self, from: data)
            let check = Result.filter({ $0.name == favoritePackage[0].name }).count
            if check == 0 {
                Result.append(favoritePackage[0])
            }
            if let data = try? PropertyListEncoder().encode(Result) {
                UserDefaults.standard.set(data, forKey: "SavedItemArray")
            }
        } else {
            if let data = try? PropertyListEncoder().encode(favoritePackage) {
                UserDefaults.standard.set(data, forKey: "SavedItemArray")
            }
        }
    }
}



