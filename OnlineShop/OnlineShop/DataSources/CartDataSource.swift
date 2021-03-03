//
//  CartDataSource.swift
//  OnlineShop
//
//  Created by Arseniy on 28.01.2021.
//

import UIKit

class CartDataSource: NSObject {
    
    private(set) var products: [Product] = []
    var productShouldBeRemoved: ((Product) -> Void)?

    func load(products: [Product]) {
        self.products = products
    }
}

extension CartDataSource: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableViewCellWrapped<ProductView>.get(from: tableView, in: indexPath)
        let product = products[indexPath.row]
        cell.view.configure(by: product)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let product = products[indexPath.row]
            products.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            productShouldBeRemoved?(product)
            tableView.reloadData()
            
        }
    }
    
}
