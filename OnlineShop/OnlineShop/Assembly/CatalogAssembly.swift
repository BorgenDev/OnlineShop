//
//  CatalogAssembly.swift
//  OnlineShop
//
//  Created by Arseniy on 27.01.2021.
//

import UIKit
import Swinject

class CatalogAssembly {
    
    private let container: Container
    init(container: Container) {
        self.container = container
    }
    
    func assembly() -> UIViewController? {
        return container.resolve(CatalogViewController.self)
    }
}
