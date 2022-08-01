
import Foundation
import UIKit

struct StartAppFactory {
    
    func startApp() -> UITabBarController {
        
        let dataCars = BackendDataModels()
        let carsStorage = CarsStorage(cars: dataCars.dataBMW)
        let obtainer = ObteinerForDataModel(dataStorage: carsStorage)
        let dataProvider = CarsDataProvider(obtainer: obtainer)
        
        let rentalStorageCollection = DataModelExample()
        
        let dataCarsHistory = PatternDataModel()
        let dataModelHistoryCarsTable = DataModelHistoryCarsTable(carHistoryTable: dataCarsHistory.dataPattern)
        let historyDataProvider = HistoryDataProvider(dataModelHistory: dataModelHistoryCarsTable)
        let userDefaultProvider = UserDefaultProvider()
        
        let driverDatabaseStorage = DriverDatabaseStorage()
        let driverDataProvider = DriverDataProvider(driverDatabase: driverDatabaseStorage)
        
        let popularCarsModelExample = PopularCarsModelExample()
        let popularCarsDataProvider = PopularCarsDataProvider(popularCarsDataModel: popularCarsModelExample)
        
        let homeVC = HomeScreenViewController(dataProvider: dataProvider, rentalModel: rentalStorageCollection, historyDataProvider: historyDataProvider, userDefaultProvider: userDefaultProvider, popularCarsProvider: popularCarsDataProvider)
        let recentVC = RecentHistoryViewController(dataProviderHistory: historyDataProvider)
        let mapVC = MapViewController()
        let containerVC = ContainerViewController(driverDataProvider: driverDataProvider)
        let tabBarVC = UITabBarController()
        tabBarVC.viewControllers = [homeVC, recentVC, mapVC, containerVC]
        
        tabBarVC.tabBar.tintColor = UIColor(red: 0.976, green: 0.706, blue: 0.004, alpha: 1)
        if let items = tabBarVC.tabBar.items {
        let images = ["square.grid.2x2.fill", "bell.fill", "mappin.circle.fill", "gearshape.fill"]
        
        for element in 0..<items.count {
            items[element].image = UIImage(systemName: images[element])
            }
        }
        return tabBarVC
    }
    
}
