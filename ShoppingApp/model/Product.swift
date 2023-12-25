//
//  Product.swift
//  ShoppingApp
//
//  Created by Semanur Eserler on 14.12.2023.
//

import Foundation

struct Product : Decodable , Identifiable {
    let id:Int
    let title, description , category, image: String
    let price: Double
    let rating: Rate
}

struct Rate: Decodable {
    let rate : Double
    let count : Int
}
