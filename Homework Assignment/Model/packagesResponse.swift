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
    
    func getPackages( completion: @escaping ( [JSON] ) ->  Void) {
        if let path = Bundle.main.path(forResource: "packageList", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let json = try JSON(data: data)
                completion([json])
            } catch let error {
                print(error.localizedDescription)
            }
        }
        
    }
}



