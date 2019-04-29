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
    // gives the favorite packages
    func fetchFavotePackages(completion: @escaping ([Package]) -> Void) {
        if let data = UserDefaults.standard.data(forKey: "SavedItemArray") {
            let Result = try! PropertyListDecoder().decode([Package].self, from: data)
            completion(Result)
        }
    }
    // gives the packages
    func fetchPackagesList(completion: @escaping ([Package]) -> Void) {
        if let path = Bundle.main.path(forResource: "packageList", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let json = try JSON(data: data)
                let decoder = JSONDecoder()
                let arrayNames = String(describing:  json["packages"])
                let Result = try? decoder.decode([Package].self, from: arrayNames.data(using: .utf8)!)
                if let res = Result {
                    completion(res)
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }
        
    }
}


