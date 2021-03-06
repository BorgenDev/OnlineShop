//
//  CartServiceContainer.swift
//  OnlineShop
//
//  Created by Arseniy on 30.01.2021.
//

import Foundation

class CartServiceContainer: Containerable {
    var mainContainer: MainContainer
    
    required init(mainContainer: MainContainer) {
        self.mainContainer = mainContainer
    }
    
    func register() {
        rootContainer.register(CartService.self) { (resolver) -> CartService in
            let implementation = CartServiceImplementation(databaseService: resolver.resolve(DatabaseService.self))
            return implementation
        }.inObjectScope(.container)
    }
}
