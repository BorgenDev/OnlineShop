//
//  CartService.swift
//  OnlineShop
//
//  Created by Arseniy on 30.01.2021.
//

import Foundation

protocol CartService: class {
    func fetchProducts() -> [Product]
    func add(product: Product)
    
    var productsCountUpdated: ((Int) -> Void)? { get set }
}
