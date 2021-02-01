//
//  SettingsPresenter.swift
//  OnlineShop
//
//  Created by Arseniy on 31.01.2021.
//

import Foundation

class SettingsPresenter: SettingsViewOutConnection, SettingsPresenterInConnection {

    weak var view: SettingsViewInConnection?
    var interactor: SettingsPresenterOutConnection?
    
    func viewDidLoad() {
        
    }
    
    func databaseStatusDidChange(indicator: Bool) {
        interactor?.removeOrAddScren(indicator: indicator)
    }
    
}
