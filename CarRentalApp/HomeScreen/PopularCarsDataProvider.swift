
import Foundation

final class PopularCarsDataProvider {
    
    private let popularCarsDataModel: PopularCarsModelExample
    
    init(popularCarsDataModel: PopularCarsModelExample) {
        self.popularCarsDataModel = popularCarsDataModel
    }
    
    func numberOfRowsInSection() -> Int {
        popularCarsDataModel.popularCars.count
    }
    
    func getCar(for indexPath: IndexPath) -> PopularCarsModel {
        popularCarsDataModel.popularCars[indexPath.row]
    }
    
}
