
import Foundation
import UIKit

struct Factory {
    
    func startLogin() -> UIViewController {
        
        let dataCars = BackendDataModels()
        let carsStorage = CarsStorage(cars: dataCars.dataBMW)
        let obtainer = ObteinerForDataModel(dataStorage: carsStorage)
        let dataProvider = CarsDataProvider(obtainer: obtainer)
        
        let rentalStorageCollection = DataModelExample()
        
        let dataCarsHistory = PatternDataModel()
        let dataModelHistoryCarsTable = DataModelHistoryCarsTable(carHistoryTable: dataCarsHistory.dataPattern) 
        let historyDataProvider = HistoryDataProvider(dataModelHistory: dataModelHistoryCarsTable)
        
        let loginVC = LoginViewController(dataProvider: dataProvider, rentalModel: rentalStorageCollection, historyDataProvider: historyDataProvider)
        return loginVC
    }
    
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
        
        let homeVC = HomeScreenViewController(dataProvider: dataProvider, rentalModel: rentalStorageCollection, historyDataProvider: historyDataProvider, userDefaultProvider: userDefaultProvider)
        let recentVC = RecentHistoryViewController(dataProviderHistory: historyDataProvider)
        let mapVC = MapViewController()
        let containerVC = ContainerViewController()
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
