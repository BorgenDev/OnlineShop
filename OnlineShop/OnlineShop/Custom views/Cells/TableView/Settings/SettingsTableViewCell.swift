//
//  SettingsTableViewCell.swift
//  OnlineShop
//
//  Created by Arseniy on 31.01.2021.
//

import UIKit

class SettingsTableViewCell: UITableViewCell, NibLoadable {

    var stateDidChange: ((Bool) -> Void)?
    
    @IBAction func switchDidChange(sender: UISwitch) {
        let target = sender.isOn
        stateDidChange?(target)
    }
    
}
