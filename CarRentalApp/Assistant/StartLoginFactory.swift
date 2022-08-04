
import Foundation
import UIKit

struct StartLoginFactory {
    
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
    
}
