//
//  ContainersController.swift
//  OnlineShop
//
//  Created by Arseniy on 30.01.2021.
//

import Foundation

class ContainerController {
    private let mainContainer: MainContainer
    
    init(mainContainer: MainContainer) {
        self.mainContainer = mainContainer
    }
    
    func setupe() {
        let containers: [Containerable] = [
            
            ProductsServiceContainer(mainContainer: mainContainer),
            CartServiceContainer(mainContainer: mainContainer),
            CartContainer(mainContainer: mainContainer),
            NewProductContainer(mainContainer: mainContainer),
            CatalogContainer(mainContainer: mainContainer),
            DatabaseServiceContainer(mainContainer: mainContainer)
            
        ]
        mainContainer.register(containers: containers)
    }
}
