//
//  SettingsInteractor.swift
//  OnlineShop
//
//  Created by Arseniy on 31.01.2021.
//

import Foundation

class SettingsInteractor: SettingsPresenterOutConnection {
    
    private var settingsService: SettingsService?
    
    init(settingsService: SettingsService?) {
        self.settingsService = settingsService
    }

    weak var presenter: SettingsPresenterInConnection?
    
    func removeOrAddScren(indicator: Bool) {
        settingsService?.hideCartScreena?(indicator)
        settingsService?.hideAddButton?(indicator)
    }
}
