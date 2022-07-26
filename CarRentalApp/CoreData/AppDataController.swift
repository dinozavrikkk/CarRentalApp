
import Foundation
import CoreData

final class AppDataController {
    
    static let shared = AppDataController()
    
    let container = NSPersistentContainer(name: "Store")
    
    var context: NSManagedObjectContext {
        container.viewContext
    }
    
    private init () {
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Core data failed to load \(error)")
            }
        }
    }
    
}
