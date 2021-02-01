//
//  FactoryScreenContainer.swift
//  OnlineShop
//
//  Created by Arseniy on 01.02.2021.
//

import Foundation

class FactoryScreenContainer: Containerable {
    let mainContainer: MainContainer
    required init(mainContainer: MainContainer) {
        self.mainContainer = mainContainer
    }
    
    func register() {
        rootContainer.register(DefultScreenFactory.self) { (resolver) -> DefultScreenFactory in
            let implementation = DefultScreenFactoryImplementation(mainContainer: self.mainContainer)
            return implementation
        }.inObjectScope(.container)
    }
}

