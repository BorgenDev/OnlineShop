//
//  Containerable.swift
//  OnlineShop
//
//  Created by Arseniy on 30.01.2021.
//

import Foundation
import Swinject

protocol Containerable {
    var mainContainer: MainContainer { get }
    init(mainContainer: MainContainer)
    func register()
}

extension Containerable {
    var rootContainer: Container {
        return mainContainer.rootContainer
    }
}
