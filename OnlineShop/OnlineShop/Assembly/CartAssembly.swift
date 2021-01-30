//
//  CartAssembly.swift
//  OnlineShop
//
//  Created by Arseniy on 28.01.2021.
//

import Foundation
import UIKit
import Swinject

class CartAssembly {
    private let container: Container
    init(container: Container) {
        self.container = container
    }
    
    func assembly() -> UIViewController? {
        return container.resolve(CartViewController.self)
    }
}
