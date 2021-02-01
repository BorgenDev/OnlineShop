//
//  SettingsServiceContainer.swift
//  OnlineShop
//
//  Created by Arseniy on 01.02.2021.
//

import Foundation

class SettingsServiceContainer: Containerable {
    var mainContainer: MainContainer
    
    required init(mainContainer: MainContainer) {
        self.mainContainer = mainContainer
    }
    
    func register() {
        rootContainer.register(SettingsService.self) { (resolver) -> SettingsService in
            let implementation = SettingsServiceImplementation()
            return implementation
        }.inObjectScope(.container)
    }
}
