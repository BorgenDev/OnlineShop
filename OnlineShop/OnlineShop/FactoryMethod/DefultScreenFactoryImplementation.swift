//
//  DefultScreenFactoryImplementation.swift
//  OnlineShop
//
//  Created by Arseniy on 01.02.2021.
//

import Foundation
import UIKit

enum Screens: String {
    case cart
    case catalog
    case settings
}

class DefultScreenFactoryImplementation: DefultScreenFactory {
    
    var mainContainer: MainContainer
    
    required init(mainContainer: MainContainer) {
        self.mainContainer = mainContainer
    }
    
    func setupeScreen(screen: Screens) -> UINavigationController {
        switch screen {
        
        case .cart          : return setupeCartScreen()
        case .catalog       : return setupeCatalogScreen()
        case .settings      : return setupeSettinsScreen()
            
        }
        
    }
    
    private func setupeCartScreen() -> UINavigationController {
        
        let cartAssembly = CartAssembly(container: mainContainer.rootContainer)
        
        guard let cartViewController = cartAssembly.assembly() else {
            return UINavigationController()
        }
        
        let cartNC = UINavigationController(rootViewController: cartViewController)
        cartNC.tabBarItem = UITabBarItem(title: "Корзина", image: UIImage(systemName: "cart.fill"), tag: 0)
        
        return cartNC
    }
    
    private func setupeCatalogScreen() -> UINavigationController {
        let catalogAssembly = CatalogAssembly(container: mainContainer.rootContainer)
        
        guard let catalogViewController = catalogAssembly.assembly() else {
            return UINavigationController()
        }
        
        let catalogNC = UINavigationController(rootViewController: catalogViewController)
        catalogNC.tabBarItem = UITabBarItem(title: "Каталог", image: UIImage(systemName: "bag.fill"), tag: 1)
        
        return catalogNC
        
    }
    
    private func setupeSettinsScreen() -> UINavigationController {
        let settingsAssembly = SettingsAssembly(container: mainContainer.rootContainer)
        
        guard let settingsViewController = settingsAssembly.assembly() else {
            return UINavigationController()
        }
        
        let settingsNC = UINavigationController(rootViewController: settingsViewController)
        settingsNC.tabBarItem = UITabBarItem(title: "Настройки", image: UIImage(systemName: "gearshape.fill"), tag: 2)
        
        return settingsNC
        
    }
    
}
