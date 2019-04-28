//
//  packagesContacts.swift
//  Homework Assignment
//
//  Created by Yusuf DEMİRKOPARAN on 25.04.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import Foundation
import SwiftyJSON


protocol packagesListProtocol {
    func updatePackageList( packageList: [Package] )
    func setLoading(isLoading: Bool)
}

protocol favoritePackagesListProtocol {
    func updateFavoriPackageList( packageList: [Package] )
}

protocol getFavoritePackagesProtocol: class {
    func favoriteJSON ( json: JSON )
}

protocol getPackagesProtocol : class {
    func packagesJSON ( json: [JSON] )
}

protocol sortPackagesProtocol : class {
    func sortType(index: Int)
}
