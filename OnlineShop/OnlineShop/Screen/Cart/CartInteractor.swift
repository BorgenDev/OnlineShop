//
//  CartInteractor.swift
//  OnlineShop
//
//  Created by Arseniy on 28.01.2021.
//

import Foundation

class CartInteractor {
    weak var presenter: CartPresenter?
    private var productService: ProductService?
    private var cartService: CartService?
    
    init(productService: ProductService?, cartService: CartService?) {
        self.productService = productService
        self.cartService = cartService
    }
    
    func fetchProducts() {
        let products = cartService?.fetchProducts() ?? []
        self.presenter?.didFetchProducts(products)
    }
}
