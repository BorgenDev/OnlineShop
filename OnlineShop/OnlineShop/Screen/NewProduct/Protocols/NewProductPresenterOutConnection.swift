//
//  NewProductPresenterOutConnection.swift
//  OnlineShop
//
//  Created by Arseniy on 31.01.2021.
//

import Foundation

protocol NewProductPresenterOutConnection: class {
    func getProduct(product: Product) -> Void
}
