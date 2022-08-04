
import Foundation

enum UserDefaultsManager {
    
   static func saveUserData(userData: DataModelHistoryCarsTable) {
        UserDefaults.standard.setValue(encodable: userData, forKey: "SavedCarsHistoryArray")
    }
    
    static func receiveUserData() -> DataModelHistoryCarsTable? {
        guard let model = UserDefaults.standard.loadValue(DataModelHistoryCarsTable.self, forKey: "SavedCarsHistoryArray") else { return nil }
        return model
    }
    
}

