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
            CatalogContainer(mainContainer: mainContainer),
            ProductsServiceContainer(mainContainer: mainContainer)
        ]
        mainContainer.register(containers: containers)
    }
}
