//
//  CatalogAssembly.swift
//  OnlineShop
//
//  Created by Arseniy on 27.01.2021.
//

import UIKit

class CatalogAssembly {
    func assembly() -> UIViewController {
        let vc = CatalogViewController()
        let presenter = CatalogPresenter()
        let interactor = CatalogInteractor()

        vc.presenter = presenter
        presenter.view = vc
        presenter.interactor = interactor
        interactor.presenter = presenter
        return vc
    }
}
