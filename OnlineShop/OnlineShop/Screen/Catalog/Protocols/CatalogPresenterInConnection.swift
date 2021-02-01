//
//  CatalogPresenterInConnection.swift
//  OnlineShop
//
//  Created by Arseniy on 31.01.2021.
//

import Foundation

protocol CatalogPresenterInConnection: class {
    func didFetchProducts(_ products: [Product])
    func statusOfAddButtonDidChange(indicator: Bool)
}
