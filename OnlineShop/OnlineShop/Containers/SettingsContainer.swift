//
//  SettingsContainer.swift
//  OnlineShop
//
//  Created by Arseniy on 31.01.2021.
//

import Foundation
import Swinject

class SettingsContainer: Containerable {
    let mainContainer: MainContainer
    
    required init(mainContainer: MainContainer) {
        self.mainContainer = mainContainer
    }
    
    func register() {
        rootContainer.register(SettingsViewController.self) { (resolver) -> SettingsViewController in
            let viewController = SettingsViewController()
            viewController.presenter = resolver.resolve(SettingsViewOutConnection.self)
            return viewController
        }.implements(SettingsViewInConnection.self)
        
        rootContainer.register(SettingsPresenter.self) { (resolver) -> SettingsPresenter in
            let presenter = SettingsPresenter()
            presenter.interactor = resolver.resolve(SettingsPresenterOutConnection.self)
            return presenter
        }
        .implements(SettingsViewOutConnection.self)
        .implements(SettingsPresenterInConnection.self)
        .initCompleted { (resolver, presenter) in
            presenter.view = resolver.resolve(SettingsViewInConnection.self)
        }
        
        rootContainer.register(SettingsInteractor.self) { (resolver) -> SettingsInteractor in
            let interactor = SettingsInteractor()
            return interactor
        }
        .implements(SettingsPresenterOutConnection.self)
        .initCompleted { (resolver, interactor) in
            interactor.presenter = resolver.resolve(SettingsPresenterInConnection.self)
        }
    }
}
