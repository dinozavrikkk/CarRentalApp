//
//  DataModelCarsInTable.swift
//  CarRentalApp
//
//  Created by admin on 11.05.2022.
//

import Foundation
import UIKit

struct CarsTable {
    
    var stamp: String
    var model: String
    var price: String
    var infoAboutCar: String
    var carPhoto: UIImage
    var miniPhoto: UIImage
    var rentalDays: String
}

struct DataModelCarsInTable {
    
    var carsInTable: [CarsTable]    
    
}
