//
//  AppCoordinator.swift
//  Carangas
//
//  Created by Bruno Cortez on 3/16/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var parentCoordinator: Coordinator?
    var window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
        navigationController = UINavigationController()
        navigationController.navigationBar.prefersLargeTitles = true
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    func start() {
        let childCoordinator = CarsCoordinator(navigationController: navigationController)
        childCoordinator.parentCoordinator = childCoordinator
        childCoordinator.parentCoordinator = self
        add(childCoordinator: childCoordinator)
        childCoordinator.start()
    }
    
    
    
}
