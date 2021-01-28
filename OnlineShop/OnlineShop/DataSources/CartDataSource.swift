//
//  CartDataSource.swift
//  OnlineShop
//
//  Created by Arseniy on 28.01.2021.
//

import UIKit

class CartDataSource: NSObject {
    
}

extension CartDataSource: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return 0
    }
    
}
