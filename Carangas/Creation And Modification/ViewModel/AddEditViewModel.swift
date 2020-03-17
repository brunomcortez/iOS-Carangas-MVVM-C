//
//  AddEditViewModel.swift
//  Carangas
//
//  Created by Bruno Cortez on 3/16/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import Foundation

struct AddEditViewModel {
    
    var car: Car
    
    init(car: Car? = nil) {
        self.car = car ?? Car()
    }
    
    var title: String {
        return car._id == nil ? "Cadastro" : "Edição"
    }
    
    var brand: String {
        return car.brand
    }
    
    var name: String {
        return car.name
    }
    
    var price: String {
        return "\(car.price)"
    }
    
    var gasType: Int {
        return car.gasType
    }
    
    var buttonTitle: String {
        return car._id == nil ? "Cadastrar carro" : "Editar carro"
    }
    
    func refreshCar(name: String, brand: String, gasType: Int, price: Int, onComplete: @escaping (Result<Bool, APIError>) -> Void) {
        
        car.name = name
        car.brand = brand
        car.gasType = gasType
        car.price = price
        
        if car._id == nil {
            CarAPI.createCar(car) { (result) in
                onComplete(result)
            }
        } else {
            CarAPI.updateCar(car)  { (result) in
                onComplete(result)
            }
        }
    }
    
}
