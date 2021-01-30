//
//  CatalogContainer.swift
//  OnlineShop
//
//  Created by Arseniy on 30.01.2021.
//

import Foundation
import Swinject

class CatalogContainer: Containerable {
    let mainContainer: MainContainer
    
    required init(mainContainer: MainContainer) {
        self.mainContainer = mainContainer
    }
    
    func register() {
        rootContainer.register(CatalogViewController.self) { (resolver) -> CatalogViewController in
            let viewController = CatalogViewController()
            viewController.presenter = resolver.resolve(CatalogPresenter.self)
            return viewController
        }
        
        rootContainer.register(CatalogPresenter.self) { (resolver) -> CatalogPresenter in
            let presenter = CatalogPresenter()
            presenter.interactor = resolver.resolve(CatalogInteractor.self)
            return presenter
        }.initCompleted { (resolver, presenter) in
            presenter.view = resolver.resolve(CatalogViewController.self)
        }
        
        rootContainer.register(CatalogInteractor.self) { (resolver) -> CatalogInteractor in
            let interactor = CatalogInteractor(service: resolver.resolve(ProductService.self))
            return interactor
        }.initCompleted { (resolver, interactor) in
            interactor.presenter = resolver.resolve(CatalogPresenter.self)
        }
    }
}
