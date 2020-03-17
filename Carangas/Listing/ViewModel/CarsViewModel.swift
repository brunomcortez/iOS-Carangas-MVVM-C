//
//  CarsViewModel.swift
//  Carangas
//
//  Created by Bruno Cortez on 3/16/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import Foundation

class CarsViewModel {
    
    var carsLoaded: (() -> Void)?
    
    private var cars: [Car] = [] {
        didSet {
            carsLoaded?()
        }
    }
    
    var count: Int {
        return cars.count
    }
    
    func loadCars() {
        CarAPI.loadCars { [weak self] (result) in
            guard let self = self else {return}
            
            switch result {
            case .success(let cars):
                self.cars = cars
                
            case .failure(let apiError):
                switch apiError {
                case .badResponse:
                    print("Response inválido")
                default:
                    print("Outro erro!")
                }
            }
        }
    }
    
    func getCarAt(indexPath: IndexPath) -> Car {
        return cars[indexPath.row]
    }
    
    func viewModelFor(indexPath: IndexPath) -> CarCellViewModel {
        let car = getCarAt(indexPath: indexPath)
        return CarCellViewModel(car: car)
    }
    
    func deleteCar(at indexPath: IndexPath, onComplete: @escaping (Result<Bool, APIError>) -> Void) {
        let car = getCarAt(indexPath: indexPath)
        CarAPI.deleteCar(car) { [weak self] (result) in
            switch result {
            case .success:
                self?.cars.remove(at: indexPath.row)
            case .failure:
                print("Falhou!")
            }
            onComplete(result)
        }
    }
}
