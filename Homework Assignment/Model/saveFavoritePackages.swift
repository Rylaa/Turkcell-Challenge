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
    
    public func saveFavorite(json: [JSON]) {
        let jsonString = String(describing: json)
        UserDefaults.standard.removeObject(forKey: "FavoritePackages")
        UserDefaults.standard.set(jsonString, forKey: "FavoritePackages")
    }
}


