//
//  ObteinerForDataModel.swift
//  CarRentalApp
//
//  Created by admin on 18.05.2022.
//

import Foundation

struct ObteinerForDataModel {
    
    private let dataStorage: CarsStorage
    
    init(dataStorage: CarsStorage) {
        self.dataStorage = dataStorage
    }
    
    func obtainCars() -> DataModelCarsInTable {
        var cars: [CarsTable] = []
        
        for car in dataStorage.cars {
            let model = CarsTable(stamp: car.stamp, model: car.model, price: car.price, infoAboutCar: car.infoAboutCar, carPhoto: car.carPhoto, miniPhoto: car.miniPhoto, rentalDays: car.rentalDays)
            cars.append(model)
        }
        return DataModelCarsInTable(carsInTable: cars)
    }
    
//    func transform(backendCar: BackendCarsModel) -> CarsTable {
//        return CarsTable(stamp: backendCar.stamp, model: backendCar.model, price: backendCar.price, infoAboutCar: backendCar.infoAboutCar, carPhoto: backendCar.carPhoto)
//    }
    
}
