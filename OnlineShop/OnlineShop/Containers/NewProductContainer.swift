//
//  NewProductContainer.swift
//  OnlineShop
//
//  Created by Arseniy on 31.01.2021.
//

import Foundation

class NewProductContainer: Containerable {
    var mainContainer: MainContainer
    
    required init(mainContainer: MainContainer) {
        self.mainContainer = mainContainer
    }
    
    func register() {
        rootContainer.register(NewProductViewController.self) { (resolver) -> NewProductViewController in
            let viewController = NewProductViewController()
            viewController.presenter = resolver.resolve(NewProductViewOutConnection.self)
            return viewController
        }.implements(NewProductViewInConnection.self)
        
        rootContainer.register(NewProductPresenter.self) { (resolver) -> NewProductPresenter in
            let presenter = NewProductPresenter()
            presenter.interactor = resolver.resolve(NewProductPresenterOutConnection.self)
            return presenter
        }
        .implements(NewProductViewOutConnection.self)
        .implements(NewProductPresenterInConnection.self)
        .initCompleted { (resolver, presenter) in
            presenter.view = resolver.resolve(NewProductViewInConnection.self)
        }
        
        rootContainer.register(NewProductInteractor.self) { (resolver) -> NewProductInteractor in
            let interactor = NewProductInteractor()
            return interactor
        }
        .implements(NewProductPresenterOutConnection.self)
        .initCompleted { (resolver, interactor) in
            interactor.presenter = resolver.resolve(NewProductPresenterInConnection.self)
        }
    }
}
