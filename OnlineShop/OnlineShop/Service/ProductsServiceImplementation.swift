//
//  ProductsServiceImplementation.swift
//  OnlineShop
//
//  Created by Arseniy on 27.01.2021.
//

import Foundation

class ProductsServiceImplementation: ProductService {
    func fetchProducts(_ clouser: (([Product]) -> Void)?) {
        FirebaseHandler().read { (response: [String: Product]?) in
            let products = (response ?? [:]).map { $0.value }
            clouser?(products)
        }
    }
}
