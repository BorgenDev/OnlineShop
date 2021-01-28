//
//  CartPresenter.swift
//  OnlineShop
//
//  Created by Arseniy on 28.01.2021.
//

import Foundation
import UIKit

class CartPresenter {
    weak var view: CartViewController?
    var interactor: CartInteractor?
    
    private let dataSource = CartDataSource()
    
    func didFetchProducts(_ products: [Product]) {
        dataSource.load(products: products)
        view?.reloadTableView()
    }
    
    func viewLoaded() {
        interactor?.fetchProducts()
    }
    
    func subscribe(tableView: UITableView) {
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
    }
}
