//
//  ProductsServiceImplementation.swift
//  OnlineShop
//
//  Created by Arseniy on 27.01.2021.
//

import Foundation

class ProductsServiceImplementation: ProductService {
    func fetchProducts(_ clouser: (([Product]) -> Void)?) {
        let cachedRealmProducts: [RealmProduct] = DatabaseManager.shared.fetch()
        let cachedProducts = cachedRealmProducts.map { Product(realmProduct: $0) }
        clouser?(cachedProducts)
        
        FirebaseHandler().read { (response: [String: Product]?) in
            let products = (response ?? [:]).map { $0.value }
            let realmProducts = products.map { RealmProduct(product: $0) }
            DatabaseManager.shared.add(realmProducts)
            clouser?(products)
        }
    }
}
