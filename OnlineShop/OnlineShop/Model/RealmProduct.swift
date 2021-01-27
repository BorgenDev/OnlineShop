//
//  RealmProduct.swift
//  OnlineShop
//
//  Created by Arseniy on 27.01.2021.
//

import Foundation
import RealmSwift

final class RealmProduct: Object {
   @objc dynamic var name: String = ""
   @objc dynamic var price: Double = 0.0
   @objc dynamic var rating: Float = 0.0
   @objc dynamic var imageUrl: String = ""
    
    convenience init(product: Product) {
        self.init()
        self.name = product.name ?? ""
        self.price = product.price ?? 0.0
        self.rating = product.rating ?? 0.0
        self.imageUrl = product.imageUrl ?? ""
    }
    
    @objc override class func primaryKey() -> String? {
        return "name"
    }
}
