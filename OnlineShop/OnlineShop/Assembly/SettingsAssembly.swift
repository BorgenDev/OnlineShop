//
//  SettingsAssembly.swift
//  OnlineShop
//
//  Created by Arseniy on 31.01.2021.
//

import UIKit
import Swinject

class SettingsAssembly {
    
    private let container: Container
    init(container: Container) {
        self.container = container
    }
    
    func assembly() -> UIViewController? {
        return container.resolve(SettingsViewController.self)
    }
}
