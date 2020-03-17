//
//  Coordinator.swift
//  Carangas
//
//  Created by Bruno Cortez on 3/16/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator: class {
    
    var childCoordinators: [Coordinator] {get set}
    var navigationController: UINavigationController {get set}
    var parentCoordinator: Coordinator? {get set}
    
    func start()
    func add(childCoordinator coordinator: Coordinator)
    func remove(childCoordinator coordinator: Coordinator)
    func back()
    func childDidFinish(_ child: Coordinator)
}

extension Coordinator {
    func add(childCoordinator coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }
    func remove(childCoordinator coordinator: Coordinator) {
        childCoordinators = childCoordinators.filter{ $0 !== coordinator }
    }
    func back() {
        
    }
    func childDidFinish(_ child: Coordinator) {
        remove(childCoordinator: child)
    }
}
