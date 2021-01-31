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
        dataSource.productShouldBeRemoved = { [weak self] product in
            self?.interactor?.removeProductFromCart(product)
        }
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
