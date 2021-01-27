//
//  CatalogInteractor.swift
//  OnlineShop
//
//  Created by Arseniy on 27.01.2021.
//

import Foundation

class CatalogInteractor {
    weak var presenter: CatalogPresenter?
    
    func fetchProducts() {
        FirebaseHandler().read { (response: [String: Product]?) in
            let products = (response ?? [:]).map { $0.value }
            self.presenter?.didFetchProducts(products)
        }
    }
}
