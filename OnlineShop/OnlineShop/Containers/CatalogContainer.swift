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
            viewController.presenter = resolver.resolve(CatalogViewOutConnection.self)
            return viewController
        }.implements(CatalogViewInConnection.self)
        
        rootContainer.register(CatalogPresenter.self) { (resolver) -> CatalogPresenter in
            let presenter = CatalogPresenter()
            presenter.interactor = resolver.resolve(CatalogPresenterOutConnection.self)
            return presenter
        }
        .implements(CatalogViewOutConnection.self)
        .implements(CatalogPresenterInConnection.self)
        .initCompleted { (resolver, presenter) in
            presenter.view = resolver.resolve(CatalogViewInConnection.self)
        }
        
        rootContainer.register(CatalogInteractor.self) { (resolver) -> CatalogInteractor in
            let interactor = CatalogInteractor(productService: resolver
                                                .resolve(ProductService.self),
                                               cartService: resolver
                                                .resolve(CartService.self))
            return interactor
        }
        .implements(CatalogPresenterOutConnection.self)
        .initCompleted { (resolver, interactor) in
            interactor.presenter = resolver.resolve(CatalogPresenterInConnection.self)
        }
    }
}
