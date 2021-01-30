//
//  MainContainer.swift
//  OnlineShop
//
//  Created by Arseniy on 30.01.2021.
//

import Foundation
import Swinject

class MainContainer {
    private var containers: [Containerable] = []
    let rootContainer: Container = Container()
    
    func register(containers: [Containerable]) {
        self.containers = containers
        containers.forEach { (container) in
            container.register()
        }
    }
    
    func setup() {
        containers.forEach { (container) in
            container.register()
        }
    }
}
