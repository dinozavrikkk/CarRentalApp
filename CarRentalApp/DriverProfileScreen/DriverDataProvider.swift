
import Foundation

final class DriverDataProvider {
    
    let driverDatabase: DriverDatabaseStorage
    
    init(driverDatabase: DriverDatabaseStorage) {
        self.driverDatabase = driverDatabase
    }
    
    func changingTheData(name: String, surname: String, number: String, imageData: Data) {
        driverDatabase.driverDatabaseIsEmpty { [weak self] result in
            switch result {
            case .success(true):
                self?.driverDatabase.save(id: UUID(), name: name, surname: surname, number: number, imageData: imageData)
            case .success(false):
                self?.driverDatabase.editDriverModel(name: name, surname: surname, number: number, imageData: imageData)
            case .failure(_):
                print("Warning, database don't have any models")
            }
        }
    }
    
}

