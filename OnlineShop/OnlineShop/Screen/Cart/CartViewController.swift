//
//  CartViewController.swift
//  OnlineShop
//
//  Created by Arseniy on 28.01.2021.
//

import UIKit

class CartViewController: UIViewController, CartViewInConnection {
    
    var presenter: CartViewOutConnection?
    
    @IBOutlet private weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewLoaded()
        presenter?.subscribe(tableView: tableView)
        
        TableViewCellWrapped<ProductView>.register(in: tableView)
        tableView.separatorInset = .init(top: 0, left: 15500, bottom: 0, right: 0)
        
        title = "Корзина"
        navigationController?.navigationBar.prefersLargeTitles = true
        reloadTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.viewLoaded()
    }

    
    func reloadTableView() {
        tableView.reloadData()
    }

}
