//
//  CatalogInteractor.swift
//  OnlineShop
//
//  Created by Arseniy on 27.01.2021.
//

import Foundation

class CatalogInteractor: CatalogPresenterOutConnection {
    weak var presenter: CatalogPresenterInConnection?
    private let productService: ProductService?
    private var cartService: CartService?
    private var settingsService: SettingsService?
    
    init(productService: ProductService?, cartService: CartService?, settingsService: SettingsService?) {
        self.productService = productService
        self.cartService = cartService
        self.settingsService = settingsService
    }
    
    func addProductToCart(product: Product) {
        cartService?.add(product: product)
    }
    
    func fetchProducts() {
        productService?.fetchProducts { (products) in
            self.presenter?.didFetchProducts(products)
        }
    }
    
    func addButtonShouldBeHide() {
        settingsService?.hideAddButton = { indictator in
            self.presenter?.statusOfAddButtonDidChange(indicator: indictator)
        }
    }
}
