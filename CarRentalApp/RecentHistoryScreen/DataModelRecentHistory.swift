//
//  DataModelRecentHistory.swift
//  CarRentalApp
//
//  Created by admin on 01.06.2022.
//

import Foundation
import UIKit
    
struct CarsTableForHistory {
    var carImage: UIImage?
    var carModel: String?
    var carPrice: String?
    var carCountDays: String?
    var carDate: String?
}

struct DataModelHistoryCarsTable {
    var carHistoryTable: [CarsTableForHistory]
}
