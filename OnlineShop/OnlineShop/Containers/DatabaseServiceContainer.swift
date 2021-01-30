//
//  DatabaseServiceContainer.swift
//  OnlineShop
//
//  Created by Arseniy on 30.01.2021.
//

import Foundation

class DatabaseServiceContainer: Containerable {
    var mainContainer: MainContainer
    
    required init(mainContainer: MainContainer) {
        self.mainContainer = mainContainer
    }
    
    func register() {
        rootContainer.register(DatabaseService.self) { (resolver) -> DatabaseService in
            let implementation = DatabaseServiceImplementation()
            return implementation
        }.inObjectScope(.container)
    }
}
