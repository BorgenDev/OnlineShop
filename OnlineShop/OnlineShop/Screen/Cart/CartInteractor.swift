//
//  CartInteractor.swift
//  OnlineShop
//
//  Created by Arseniy on 28.01.2021.
//

import Foundation

class CartInteractor {
    weak var presenter: CartPresenter?
    private var cartService: CartService?
    
    init(cartService: CartService?) {
        self.cartService = cartService
    }
    
    func removeProductFromCart(_ product: Product) {
        cartService?.remove(product: product)
    }
    
    func fetchProducts() {
        let products = cartService?.fetchProducts() ?? []
        self.presenter?.didFetchProducts(products)
    }
}
