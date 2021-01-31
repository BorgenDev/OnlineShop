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
    lazy var carts: [RealmCard] = databaseService?.fetch() ?? []

    
    init(databaseService: DatabaseService?) {
        self.databaseService = databaseService
    }
    
    var productsCountUpdated: ((Int) -> Void)?
    
    func fetchProducts() -> [Product] {
        let cart = carts.first
        let productsIds = Array(cart?.productIds ?? List())
        let products: [RealmProduct] = databaseService?.fetch() ?? []
        
        let filteredProducts = products.filter { productsIds.contains($0.name) }.map { Product(realmProduct: $0) }
        return filteredProducts
    }
    
    func add(product: Product) {
        let emptyCart = RealmCard()
        emptyCart.sessionID = UUID().uuidString
        let cart = carts.first ?? emptyCart
        databaseService?.write {
            cart.productIds.append(product.name ?? "")
        }
        databaseService?.add(cart)
        
        let countOfProduct = self.fetchProducts()
        productsCountUpdated?(countOfProduct.count)
    }
    
    func remove(product: Product) {
        let cart = carts.first
        let productsIds = Array(cart?.productIds ?? List())
        guard let name = product.name, productsIds.contains(name) else {
            return
        }
        guard let indexOfProduct = productsIds.firstIndex(of: name) else {
            return
        }
        
        let index = Int(indexOfProduct)
        databaseService?.write {
            cart?.productIds.remove(at: index)
        }
        let countOfProduct = self.fetchProducts()
        productsCountUpdated?(countOfProduct.count)
    }
    
    
    

}
