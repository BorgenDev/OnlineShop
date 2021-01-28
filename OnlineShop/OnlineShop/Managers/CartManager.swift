//
//  CartManager.swift
//  OnlineShop
//
//  Created by Arseniy on 28.01.2021.
//

import Foundation
import RealmSwift

class CartManager {
    static let shared = CartManager()
    
    private init() {}
    
    func fetchProducts() -> [Product] {
        let carts: [RealmCard] = DatabaseManager.shared.fetch()
        let cart = carts.first
        let productsIds = Array(cart?.productIds ?? List())
        let products: [RealmProduct] = DatabaseManager.shared.fetch()
        let filteredProducts = products.filter { productsIds.contains($0.name) }.map { Product(realmProduct: $0) }
        return filteredProducts
    }
    
    func add(product: Product) {
        let carts: [RealmCard] = DatabaseManager.shared.fetch()
        let emptyCart = RealmCard()
        emptyCart.sessionID = UUID().uuidString
        let cart = carts.first ?? emptyCart
        DatabaseManager.shared.write {
            cart.productIds.append(product.name ?? "")
        }
        
        DatabaseManager.shared.add(cart)
    }
}
