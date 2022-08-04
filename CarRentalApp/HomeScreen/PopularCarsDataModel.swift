
import Foundation
import UIKit

struct PopularCarsModel {
    
    let modelImage: UIImage
    let modelLabel: String
    let submodelLabel: String
    
}

struct PopularCarsModelExample {
    
    let popularCars: [PopularCarsModel] = [
        PopularCarsModel(modelImage: UIImage(named: "mersG-Class")!, modelLabel: "Mercedes-Benz", submodelLabel: "G-Class"),
        PopularCarsModel(modelImage: UIImage(named: "porsh9112")!, modelLabel: "Porsche", submodelLabel: "911"),
        PopularCarsModel(modelImage: UIImage(named: "bmwX5")!, modelLabel: "BMW", submodelLabel: "X5"),
        PopularCarsModel(modelImage: UIImage(named: "lexusNX2")!, modelLabel: "Lexus", submodelLabel: "NX"),
        PopularCarsModel(modelImage: UIImage(named: "ferrari4882")!, modelLabel: "Ferrari", submodelLabel: "488")
    ]
    
}
