//
//  CarViewModel.swift
//  Carangas
//
//  Created by Bruno Cortez on 3/16/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import Foundation

struct CarViewModel {
    
    var car: Car
    let formatter: NumberFormatter = {
       let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
        return formatter
    }()
    
    var name: String {
        return car.name
    }
    var brand: String {
        return car.brand
    }
    var gas: String {
        return "Combustível: \(car.gas)"
    }
    
    var price: String {
        return formatter.string(from: NSNumber(value: car.price)) ?? "R$ 0,00"
    }
    
    
    init(car: Car) {
        self.car = car
    }
}
