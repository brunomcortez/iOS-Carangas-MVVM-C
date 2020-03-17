//
//  CarCoordinator.swift
//  Carangas
//
//  Created by Bruno Cortez on 3/16/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import Foundation
import UIKit

class CarCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var parentCoordinator: Coordinator?
    var car: Car
    
    init(navigationController: UINavigationController, car: Car) {
        self.navigationController = navigationController
        self.car = car
    }
    
    deinit {
        print("CarCoordinator - deinit")
    }

    func start() {
        let viewController = CarViewController.instantiateFromStoryboard(.main)
        viewController.viewModel = CarViewModel(car: car)
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func childDidFinish(_ child: Coordinator) {
        parentCoordinator?.childDidFinish(self)
    }
}
