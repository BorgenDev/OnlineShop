//
//  Product.swift
//  OnlineShop
//
//  Created by Arseniy on 27.01.2021.
//

import Foundation
struct Product: Codable {
    var name: String?
    var price: Double?
    var rating: Float?
    var imageUrl: String?
    
    
    init(name: String? = nil, price: Double? = nil, rating: Float? = nil, imageUrl: String? = nil) {
        self.name = name
        self.price = price
        self.rating = rating
        self.imageUrl = imageUrl
    }
    
    init(realmProduct: RealmProduct) {
        self.name = realmProduct.name
        self.price = realmProduct.price
        self.rating = realmProduct.rating
        self.imageUrl = realmProduct.imageUrl
    }
}
