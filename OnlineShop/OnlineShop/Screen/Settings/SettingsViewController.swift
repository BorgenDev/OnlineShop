//
//  SettingsViewController.swift
//  OnlineShop
//
//  Created by Arseniy on 31.01.2021.
//

import UIKit

class SettingsViewController: UIViewController, SettingsViewInConnection {
    
    var presenter: SettingsViewOutConnection?
    
    @IBOutlet private weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidLoad()
        
        setupeTableView()
        
        self.title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupeTableView() {
        tableView.register(SettingsTableViewCell.nib, forCellReuseIdentifier: SettingsTableViewCell.nibName)
        tableView.delegate = self
        tableView.dataSource = self
    }


}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.nibName, for: indexPath) as! SettingsTableViewCell
        cell.stateDidChange = { [weak self] indicator in
            self?.presenter?.databaseStatusDidChange(indicator: indicator)
        }
        
        return cell
    }
    
    
}
