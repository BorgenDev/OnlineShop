//
//  CatalogAssembly.swift
//  OnlineShop
//
//  Created by Arseniy on 27.01.2021.
//

import UIKit

class CatalogAssembly {
    func assembly() -> UIViewController {
        let service: ProductService = ProductsServiceImplementation()
        let vc = CatalogViewController()
        let presenter = CatalogPresenter()
        let interactor = CatalogInteractor(service: service)

        vc.presenter = presenter
        presenter.view = vc
        presenter.interactor = interactor
        interactor.presenter = presenter
        return vc
    }
}
