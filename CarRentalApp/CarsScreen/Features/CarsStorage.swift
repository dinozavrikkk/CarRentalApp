
import Foundation
import UIKit


struct BackendCarsModel {
    
    let stamp: String
    let model: String
    let price: String
    let infoAboutCar: String
    let carPhoto: UIImage
    let miniPhoto: UIImage
    let rentalDays: String
}

struct CarsStorage {
    
    private(set) var cars: [BackendCarsModel]
    
}
