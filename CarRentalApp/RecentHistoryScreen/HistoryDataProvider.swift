//
//  HistoryDataProvider.swift
//  CarRentalApp
//
//  Created by admin on 02.06.2022.
//

import Foundation
import UIKit

class HistoryDataProvider {
    
    private var dataModelHistory: DataModelHistoryCarsTable
    private let todayDate = Date()
    private lazy var dateFormatter: DateFormatter = {
       let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        formatter.locale = Locale(identifier: "ru_RU")
        return formatter
    }()
    
    init(dataModelHistory: DataModelHistoryCarsTable) {
        self.dataModelHistory = dataModelHistory
    }
    
    func numberOfRowsInSection() -> Int {
        dataModelHistory.carHistoryTable.count
    }
    
    func getCar(for indexPath: IndexPath) -> CarsTableForHistory {
        dataModelHistory.carHistoryTable[indexPath.row]
    }
    
    func addCarToTable(carInfo: CarsTable) {
        dataModelHistory.carHistoryTable.insert(.init(carImage: carInfo.miniPhoto, carModel: "\(carInfo.stamp) \(carInfo.model)", carPrice: carInfo.price, carCountDays: "\(carInfo.rentalDays) DAYS", carDate: "\(dateFormatter.string(from: todayDate))"), at: 0)
    }
}
