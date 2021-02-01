//
//  CatalogPresenterOutConnection.swift
//  OnlineShop
//
//  Created by Arseniy on 31.01.2021.
//

import Foundation

protocol CatalogPresenterOutConnection: class {
    func addProductToCart(product: Product)
    func fetchProducts()
    func addButtonShouldBeHide()
}
