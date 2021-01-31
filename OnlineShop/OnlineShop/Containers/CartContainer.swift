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
            viewController.presenter = resolver.resolve(CartViewOutConnection.self)
            return viewController
        }.implements(CartViewInConnection.self)
        
        rootContainer.register(CartPresenter.self) { (resolver) -> CartPresenter in
            let presenter = CartPresenter()
            presenter.interactor = resolver.resolve(CartPresenterOutConnection.self)
            return presenter
        }
        .implements(CartViewOutConnection.self)
        .implements(CartPresenterInConnection.self)
        .initCompleted { (resolver, presenter) in
            presenter.view = resolver.resolve(CartViewInConnection.self)
        }
        
        rootContainer.register(CartInteractor.self) { (resolver) -> CartInteractor in
            let interactor = CartInteractor(cartService: resolver.resolve(CartService.self))
            return interactor
        }
        .implements(CartPresenterOutConnection.self)
        .initCompleted { (resolver, interactor) in
            interactor.presenter = resolver.resolve(CartPresenterInConnection.self)
        }
    }

    
    
}
