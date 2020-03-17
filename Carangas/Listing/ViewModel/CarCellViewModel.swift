//
//  CarCellViewModel.swift
//  Carangas
//
//  Created by Bruno Cortez on 3/16/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import Foundation

struct CarCellViewModel {
    
    var car: Car
    
    var name: String {
        return car.name
    }
    
    var brand: String {
        return car.brand
    }
    
    init(car: Car) {
        self.car = car
    }
}
