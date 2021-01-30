//
//  CartManager.swift
//  OnlineShop
//
//  Created by Arseniy on 28.01.2021.
//

import Foundation
import RealmSwift

class CartServiceImplementation: CartService {
    
    private var databaseService: DatabaseService?
    
    init(databaseService: DatabaseService?) {
        self.databaseService = databaseService
    }
    
    var productsCountUpdated: ((Int) -> Void)?
    
    func fetchProducts() -> [Product] {
        let carts: [RealmCard] = databaseService?.fetch() ?? []
        let cart = carts.first
        let productsIds = Array(cart?.productIds ?? List())
        let products: [RealmProduct] = databaseService?.fetch() ?? []
        
        let filteredProducts = products.filter { productsIds.contains($0.name) }.map { Product(realmProduct: $0) }
        return filteredProducts
    }
    
    func add(product: Product) {
        let carts: [RealmCard] = databaseService?.fetch() ?? []
        let emptyCart = RealmCard()
        emptyCart.sessionID = UUID().uuidString
        let cart = carts.first ?? emptyCart
        databaseService?.write {
            cart.productIds.append(product.name ?? "")
        }
        databaseService?.add(cart)
        let filteredProducts = self.fetchProducts()
        
        productsCountUpdated?(filteredProducts.count)
    }
}
