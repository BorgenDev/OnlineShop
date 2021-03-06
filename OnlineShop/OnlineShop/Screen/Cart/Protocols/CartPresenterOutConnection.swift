//
//  CartPresenterOutConnection.swift
//  OnlineShop
//
//  Created by Arseniy on 31.01.2021.
//

import Foundation

protocol CartPresenterOutConnection: class {
    func removeProductFromCart(product: Product)
    func fetchProducts()
}
