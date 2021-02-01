//
//  DefultScreenFactory.swift
//  OnlineShop
//
//  Created by Arseniy on 01.02.2021.
//

import Foundation
import UIKit

protocol DefultScreenFactory: class {
    func setupeScreen(screen: Screens) -> UINavigationController
}
