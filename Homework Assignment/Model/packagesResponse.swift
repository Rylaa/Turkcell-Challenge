//
//  packagesResponse.swift
//  Homework Assignment
//
//  Created by Yusuf DEMİRKOPARAN on 23.04.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import Foundation
import SwiftyJSON


final class packagesResponse {
    
    public let service = packagesService()
    static let shared = packagesResponse()
    
    func getPackages() {
        if let path = Bundle.main.path(forResource: "packageList", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let json = try JSON(data: data)
                var packagesfavoriteJSON : [JSON] = []
                var packagesJson : [JSON] = []
                let arrayNames = json["packages"]
                
                for i in 0...json["packages"].arrayValue.count-1 {
                    if arrayNames[i]["didUseBefore"] == false {
                        packagesJson.append(arrayNames[i])
                    } else {
                        packagesfavoriteJSON.append(arrayNames[i])
                    }
                }
                
                service.packagesJSON(json: packagesJson)
            //    service.favoriteJSON(json: packagesfavoriteJSON)
                saveFavoritePackages.shared.saveFavorite(json: packagesfavoriteJSON)
                
            } catch let error {
                print(error.localizedDescription)
            }
        }
        
    }
}



