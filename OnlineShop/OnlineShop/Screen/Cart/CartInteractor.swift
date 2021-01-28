//
//  CartInteractor.swift
//  OnlineShop
//
//  Created by Arseniy on 28.01.2021.
//

import Foundation

class CartInteractor {
    weak var presenter: CartPresenter?
    private let service: ProductService
    
    init(service: ProductService) {
        self.service = service
    }
    
    func fetchProducts() {
        let products = CartManager.shared.fetchProducts()
        self.presenter?.didFetchProducts(products)
    }
}
