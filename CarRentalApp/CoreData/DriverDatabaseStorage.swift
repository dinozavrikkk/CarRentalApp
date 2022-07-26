
import CoreData
import Foundation

struct DriverDatabaseStorage {
    
    private let context = AppDataController.shared.context
    
    func save(id: UUID, name: String, surname: String, number: String, imageData: Data) {
        context.perform {
            let product = DriverInfo(context: context)
            product.id = id
            product.name = name
            product.surname = surname
            product.number = number
            product.image = imageData
            try! context.save()
        }
    }
    
    func driverDatabaseIsEmpty(completion: ((Bool) -> Void)?) {
         context.perform {
            let request = DriverInfo.fetchRequest()
            let models = try! context.fetch(request)
            if models.isEmpty {
                completion?(true)
            } else {
                completion?(false)
            }
        }
    }
    
    func editDriverModel(name: String, surname: String, number: String, imageData: Data) {
        context.perform {
            let request = DriverInfo.fetchRequest()
            let models = try! context.fetch(request)
            let model = models[0]
            model.name = name
            model.surname = surname
            model.number = number
            model.image = imageData
            try! context.save()
        }
    }
    
    func fetchDriverModel(completion: ((DriverInfo) -> Void)?) {
        context.perform {
            let request = DriverInfo.fetchRequest()
            let models = try! context.fetch(request)
            let model = models[0]
            completion?(model)
        }
    }
    
    func fetchAllDriverModels(completion: (([DriverInfo]) -> Void)?) {
        context.perform {
            let request = DriverInfo.fetchRequest()
            let models = try! context.fetch(request)
            completion?(models)
        }
    }
    
}
