//
//  ProductsServiceImplementation.swift
//  OnlineShop
//
//  Created by Arseniy on 27.01.2021.
//

import Foundation

class ProductsServiceImplementation: ProductService {
    private var databaseService: DatabaseService?
    
    init(databaseService: DatabaseService?) {
        self.databaseService = databaseService
    }
    
    func fetchProducts(_ clouser: (([Product]) -> Void)?) {
        let cachedRealmProducts: [RealmProduct] = databaseService?.fetch() ?? []
        let cachedProducts = cachedRealmProducts.map { Product(realmProduct: $0) }
        clouser?(cachedProducts)
        
        FirebaseHandler().read { (response: [String: Product]?) in
            let products = (response ?? [:]).map { $0.value }
            let realmProducts = products.map { RealmProduct(product: $0) }
            self.databaseService?.add(realmProducts)
            clouser?(products)
        }
    }
}
