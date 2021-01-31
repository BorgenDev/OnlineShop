//
//  CartContainer.swift
//  OnlineShop
//
//  Created by Arseniy on 30.01.2021.
//

import Foundation

class CartContainer: Containerable {
    var mainContainer: MainContainer
    
    required init(mainContainer: MainContainer) {
        self.mainContainer = mainContainer
    }
    
    func register() {
        rootContainer.register(CartViewController.self) { (resolver) -> CartViewController in
            let viewController = CartViewController()
            viewController.presenter = resolver.resolve(CartPresenter.self)
            return viewController
        }
        
        rootContainer.register(CartPresenter.self) { (resolver) -> CartPresenter in
            let presenter = CartPresenter()
            presenter.interactor = resolver.resolve(CartInteractor.self)
            return presenter
        }.initCompleted { (resolver, presenter) in
            presenter.view = resolver.resolve(CartViewController.self)
        }
        
        rootContainer.register(CartInteractor.self) { (resolver) -> CartInteractor in
            let interactor = CartInteractor(cartService: resolver.resolve(CartService.self))
            return interactor
        }.initCompleted { (resolver, interactor) in
            interactor.presenter = resolver.resolve(CartPresenter.self)
        }
    }

    
    
}
