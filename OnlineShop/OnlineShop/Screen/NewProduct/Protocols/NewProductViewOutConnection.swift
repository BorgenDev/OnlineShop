//
//  NewProductViewOutConnection.swift
//  OnlineShop
//
//  Created by Arseniy on 31.01.2021.
//

import Foundation

protocol NewProductViewOutConnection: class {
    func viewDidLoad()
    func getInformationAdoutProduct(name: String?, price: Double?, raiting: Float?)
}
