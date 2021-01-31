//
//  NewProductInteractor.swift
//  OnlineShop
//
//  Created by Arseniy on 31.01.2021.
//

import Foundation

class NewProductInteractor: NewProductPresenterOutConnection {
    weak var presenter: NewProductPresenterInConnection?
    
    func getProduct(product: Product) {
        FirebaseHandler(product)
            .auto()
            .setValue()
    }
}
