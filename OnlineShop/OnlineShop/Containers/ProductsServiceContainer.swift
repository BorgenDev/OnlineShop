//
//  ProductsServiceContainer.swift
//  OnlineShop
//
//  Created by Arseniy on 30.01.2021.
//

import Swinject

class ProductsServiceContainer: Containerable {
    let mainContainer: MainContainer
    required init(mainContainer: MainContainer) {
        self.mainContainer = mainContainer
    }
    
    func register() {
        rootContainer.register(ProductService.self) { (resolver) -> ProductService in
            return ProductsServiceImplementation()
        }
    }
}
