//
//  CartAssembly.swift
//  OnlineShop
//
//  Created by Arseniy on 28.01.2021.
//

import Foundation
import UIKit

class CartAssembly {
    func assembly() -> UIViewController {
        let service: ProductService = ProductsServiceImplementation()
        let vc = CartViewController()
        let presenter = CartPresenter()
        let interactor = CartInteractor(service: service)

        vc.presenter = presenter
        presenter.view = vc
        presenter.interactor = interactor
        interactor.presenter = presenter
        return vc
    }
}
