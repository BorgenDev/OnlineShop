//
//  SceneDelegate.swift
//  OnlineShop
//
//  Created by Arseniy on 27.01.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    let mainContainer = MainContainer()
    private lazy var containersController = ContainerController(mainContainer: mainContainer)
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        containersController.setupe()
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        
        let cartService = mainContainer.rootContainer.resolve(CartService.self)
        let cartVC = setupeCartScreen()
        let catalogVC = setupeCatalogScreen()
        let cartTabBarItem = cartVC.tabBarItem
        self.setupeBadgeValue(cartService: cartService, cartTabBarItem: cartTabBarItem)
        
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers([catalogVC, cartVC], animated: true)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
    
    private func setupeBadgeValue(cartService: CartService?, cartTabBarItem: UITabBarItem?) {
        let productsCount = cartService?.fetchProducts().count ?? 0
        if productsCount > 0 {
            cartTabBarItem?.badgeValue = "\(productsCount)"
        } else {
            cartTabBarItem?.badgeValue = nil
        }
        cartService?.productsCountUpdated = { productsCount in
            let newValue = productsCount
            cartTabBarItem?.badgeValue = "\(newValue)"
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
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    
}

