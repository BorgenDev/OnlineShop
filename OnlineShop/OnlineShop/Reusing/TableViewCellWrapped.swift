//
//  TableViewCellWrapped.swift
//  OnlineShop
//
//  Created by Arseniy on 03.03.2021.
//

import UIKit

class TableViewCellWrapped<View: NibLoadable & UIView> {
    
    static func register(in tableView: UITableView) {
        tableView.register(WrappedTableViewCell<View>.self, forCellReuseIdentifier: View.nibName)
    }
    
    static func get(from tableView: UITableView, in indexPath: IndexPath) -> WrappedTableViewCell<View> {
        let cell = tableView.dequeueReusableCell(withIdentifier: View.nibName, for: indexPath) as! WrappedTableViewCell<View>
        
        return cell
    }
    
    static func forceGet(from tableView: UITableView, in indexPath: IndexPath) -> WrappedTableViewCell<View> {
        let cell = tableView.cellForRow(at: indexPath) as! WrappedTableViewCell<View>
        
        return cell
    }
}
