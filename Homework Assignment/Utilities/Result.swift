//
//  Result.swift
//  Homework Assignment
//
//  Created by Yusuf DEMİRKOPARAN on 25.04.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import Foundation

public enum Result<Value> {
    case success(Value)
    case failure(Error)
    
}
