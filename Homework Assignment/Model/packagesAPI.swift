//
//  packagesAPI.swift
//  Homework Assignment
//
//  Created by Yusuf DEMİRKOPARAN on 23.04.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import Foundation
//{
//    "name": "Platinum Maksi 6 GB",
//    "desc": "Zengin içerikli Platinum Maksi Paketi ile Turkcell Uygulamalarının keyfini sürün!",
//    "subscriptionType": "monthly",
//    "didUseBefore": true,
//    "benefits": [
//    "TV+",
//    "Fizy",
//    "BiP",
//    "lifebox",
//    "Platinum",
//    "Dergilik"
//    ],
//    "price": 109.90,
//    "tariff": {
//        "data": "6144",
//        "talk": "2000",
//        "sms": "100"
//    },
//    "availableUntil": "1558131150"
//},


//   let jSON = try? newJSONDecoder().decode(JSON.self, from: jsonData)

import Foundation



struct Package: Codable {
    let name, desc: String
    let subscriptionType: SubscriptionType
    let didUseBefore: Bool
    let benefits: [Benefit]?
    let price: Double
    let tariff: Tariff
    let availableUntil: String
}

 enum Benefit: String, Codable {
    case biP = "BiP"
    case dergilik = "Dergilik"
    case fizy = "Fizy"
    case lifebox = "lifebox"
    case platinum = "Platinum"
    case tv = "TV+"
}

enum SubscriptionType: String, Codable {
    case monthly = "monthly"
    case weekly = "weekly"
    case yearly = "yearly"
}

struct Tariff: Codable {
    let data, talk, sms: String
}


/*
 struct JSON: Codable {
 let packages: [Package]
 }
 
 struct Package: Codable {
 let name, desc: String
 let subscriptionType: SubscriptionType
 let didUseBefore: Bool
 let benefits: [Benefit]?
 let price: Double
 let tariff: Tariff
 let availableUntil: String
 }
 
 enum Benefit: String, Codable {
 case biP      = "BiP"
 case bip      = "Bip"
 case dergilik = "Dergilik"
 case fizy     = "Fizy"
 case lifebox  = "lifebox"
 case platinum = "Platinum"
 case tv       = "TV+"
 }
 
 enum SubscriptionType: String, Codable {
 case monthly = "monthly"
 case weekly  = "weekly"
 case yearly  = "yearly"
 }
 
 struct Tariff: Codable {
 let data, talk, sms: String
 }

 */





