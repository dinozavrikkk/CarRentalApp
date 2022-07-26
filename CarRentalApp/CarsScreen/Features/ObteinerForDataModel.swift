
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
    
}
