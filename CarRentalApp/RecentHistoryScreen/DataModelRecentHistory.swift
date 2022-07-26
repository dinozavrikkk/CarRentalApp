
import Foundation
import UIKit
    
class CarsTableForHistory: Codable {
    
    var carImageFileName: String?
    var carModel: String?
    var carPrice: String?
    var carCountDays: String?
    var carDate: String?
    
    init(carImageFileName: String?, carModel: String?, carPrice: String?, carCountDays: String?, carDate: String?) {
        self.carImageFileName = carImageFileName
        self.carModel = carModel
        self.carPrice = carPrice
        self.carCountDays = carCountDays
        self.carDate = carDate
    }
}

class DataModelHistoryCarsTable: Codable {
    
    var carHistoryTable: [CarsTableForHistory]
    
    init(carHistoryTable: [CarsTableForHistory]) {
        self.carHistoryTable = carHistoryTable
    }
    
    private enum CodingKeys: String, CodingKey {
        case carHistoryTable
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(carHistoryTable, forKey: .carHistoryTable)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.carHistoryTable = try container.decode(Array.self, forKey: .carHistoryTable)
    }
    
}

    

