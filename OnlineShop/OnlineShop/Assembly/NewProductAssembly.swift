//
//  NewProductAssembly.swift
//  OnlineShop
//
//  Created by Arseniy on 31.01.2021.
//

import Foundation
import Swinject

class NewProductAssembly {
    
    private let container: Container
    init(container: Container) {
        self.container = container
    }
    
    func assembly() -> UIViewController? {
        return container.resolve(NewProductViewController.self)
    }
}
