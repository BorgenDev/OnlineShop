//
//  ProductService.swift
//  OnlineShop
//
//  Created by Arseniy on 27.01.2021.
//

import Foundation

protocol ProductService {
    func fetchProducts(_ clouser: (([Product]) -> Void)?)
}
