//
//  CartViewOutConnection.swift
//  OnlineShop
//
//  Created by Arseniy on 31.01.2021.
//

import Foundation
import UIKit

protocol CartViewOutConnection: class {
    func viewLoaded()
    func subscribe(tableView: UITableView)
}
