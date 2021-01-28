//
//  CatalogInteractor.swift
//  OnlineShop
//
//  Created by Arseniy on 27.01.2021.
//

import Foundation

class CatalogInteractor {
    weak var presenter: CatalogPresenter?
    private let service: ProductService
    
    init(service: ProductService) {
        self.service = service
    }
    
    func addProductToCart(_ product: Product) {
        CartManager.shared.add(product: product)
    }
    
    func fetchProducts() {
        service.fetchProducts { (products) in
            self.presenter?.didFetchProducts(products)
        }
    }
}
