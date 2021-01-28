//
//  CartDataSource.swift
//  OnlineShop
//
//  Created by Arseniy on 28.01.2021.
//

import UIKit

class CartDataSource: NSObject {
    
    private(set) var products: [Product] = []

    func load(products: [Product]) {
        self.products = products
    }
}

extension CartDataSource: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CartTableViewCell = tableView.dequeueReusableCell(withIdentifier: CartTableViewCell.nibName, for: indexPath) as! CartTableViewCell
        let product = products[indexPath.row]
        cell.configure(by: product)
        return cell
    }
    
}
