//
//  CarsDataProvider.swift
//  CarRentalApp
//
//  Created by admin on 18.05.2022.
//

import Foundation
import UIKit

class CarsDataProvider {
    
    private let obtainer: ObteinerForDataModel
    private var dataModel: DataModelCarsInTable
    
    init(obtainer: ObteinerForDataModel) {
        self.obtainer = obtainer
        dataModel = self.obtainer.obtainCars()
    }
    
    func numberOfRowsInSection() -> Int {
        dataModel.carsInTable.count
    }
    
    func getCar(for indexPath: IndexPath) -> CarsTable {
        dataModel.carsInTable[indexPath.row]
    }
    
}
