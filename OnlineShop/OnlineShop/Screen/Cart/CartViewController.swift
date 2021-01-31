//
//  CartViewController.swift
//  OnlineShop
//
//  Created by Arseniy on 28.01.2021.
//

import UIKit

class CartViewController: UIViewController {
    
    var presenter: CartPresenter?
    
    @IBOutlet private weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewLoaded()
        presenter?.subscribe(tableView: tableView)
        
        tableView.register(CartTableViewCell.nib, forCellReuseIdentifier: CartTableViewCell.nibName)
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
