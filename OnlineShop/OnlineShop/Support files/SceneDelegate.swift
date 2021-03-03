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
    var ggg = true
    private lazy var containersController = ContainerController(mainContainer: mainContainer)
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        containersController.setupe()
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        
        let cartService = mainContainer.rootContainer.resolve(CartService.self)
        let settingsService = mainContainer.rootContainer.resolve(SettingsService.self)
        let factory = mainContainer.rootContainer.resolve(DefultScreenFactory.self)

        let cartScreen = factory?.setupeScreen(screen: .cart)
        let catalogScreen = factory?.setupeScreen(screen: .catalog)
        let settingsScreen = factory?.setupeScreen(screen: .settings)
        
        let screenArray: [UINavigationController?] = [catalogScreen, cartScreen, settingsScreen]
        let veriflyArray = screenArray.compactMap{ $0 }
    
        let tabBarController = setupeTabBarController(cartScreen: cartScreen, cartService: cartService, settingsService: settingsService, controllersArray: veriflyArray)

        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
    
    fileprivate func setupeTabBarController(cartScreen: UINavigationController?, cartService: CartService?, settingsService: SettingsService?, controllersArray: [UINavigationController]) -> UITabBarController {
        let cartTabBarItem = cartScreen?.tabBarItem
        self.setupeBadgeValue(cartService: cartService, cartTabBarItem: cartTabBarItem)
        
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers(controllersArray, animated: true)
        var localSettingsService = settingsService
        
        localSettingsService?.hideCartScreena = { indicator in
            if indicator {
                tabBarController.viewControllers?.insert(cartScreen ?? UINavigationController(), at: 1)
            } else {
                tabBarController.viewControllers?.remove(at: 1)
            }
        }
        
        return tabBarController
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

