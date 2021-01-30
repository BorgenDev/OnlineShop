//
//  MainContainer.swift
//  OnlineShop
//
//  Created by Arseniy on 30.01.2021.
//

import Foundation
import Swinject

class MainContainer {
    private let containers: [Containerable]
    
    init(containers: [Containerable]) {
        self.containers = containers
    }
    
    func setup() {
        containers.forEach { (container) in
            container.register()
        }
    }
}
