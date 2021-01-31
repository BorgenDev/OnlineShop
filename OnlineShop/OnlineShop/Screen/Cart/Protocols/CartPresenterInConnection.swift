//
//  CartPresenterInConnection.swift
//  OnlineShop
//
//  Created by Arseniy on 31.01.2021.
//

import Foundation

protocol CartPresenterInConnection: class {
    func didFetchProducts(_ products: [Product])
}
