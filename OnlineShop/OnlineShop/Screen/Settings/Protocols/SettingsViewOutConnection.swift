//
//  SettingsViewOutConnection.swift
//  OnlineShop
//
//  Created by Arseniy on 31.01.2021.
//

import Foundation

protocol SettingsViewOutConnection: class {
    func viewDidLoad()
    func databaseStatusDidChange(indicator: Bool)
}
