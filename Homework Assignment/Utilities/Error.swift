//
//  Error.swift
//  Homework Assignment
//
//  Created by Yusuf DEMİRKOPARAN on 25.04.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import Foundation

public enum Error : Swift.Error {
    case serializetionError(internal: Swift.Error)
}
