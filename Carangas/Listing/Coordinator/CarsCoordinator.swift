//
//  CarsCoordinator.swift
//  Carangas
//
//  Created by Bruno Cortez on 3/16/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import Foundation
import UIKit

class CarsCoordinator: Coordinator {
    
     var childCoordinators: [Coordinator] = []
     var navigationController: UINavigationController
     var parentCoordinator: Coordinator?
     
     init(navigationController: UINavigationController) {
        self.navigationController = navigationController
     }
    
     func start() {
        let viewController = CarsTableViewController.instantiateFromStoryboard(.main)
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: false)
     }
    
    func showCar(_ car: Car) {
        let childCoordinator = CarCoordinator(navigationController: navigationController, car: car)
        childCoordinator.parentCoordinator = self
        add(childCoordinator: childCoordinator)
        childCoordinator.start()
    }
}
