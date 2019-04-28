//
//  packagesSerb.swift
//  Homework Assignment
//
//  Created by Yusuf DEMİRKOPARAN on 25.04.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import Foundation


import SwiftyJSON

final class packagesService {
    
  
 static var packagesJsonArray : [JSON] = []
    
    func fetchFavotePackages(completion: @escaping ([Package]) -> Void) {
        // OKUMA
        packagesResponse.shared.getPackages()
        let jsonString = UserDefaults.standard.string(forKey: "FavoritePackages")
        let decoder = JSONDecoder()
        let data = try! JSON(data: (jsonString?.data(using: .utf8))!)
        let Result = try! decoder.decode([Package].self, from: data.rawData())
        completion(Result)
    }
    
    func fetchPackagesList(completion: @escaping ([Package]) -> Void) {
        
        
        packagesResponse.shared.getPackages()
        let jsonString = String(describing: packagesService.packagesJsonArray)
        let decoder = JSONDecoder()
        let Result = try? decoder.decode([Package].self, from: jsonString.data(using: .utf8)!)
        completion(Result!)
    }
}

extension packagesService : getPackagesProtocol {

    func packagesJSON(json: [JSON]) {
       
        packagesService.packagesJsonArray =  json
    }
}

