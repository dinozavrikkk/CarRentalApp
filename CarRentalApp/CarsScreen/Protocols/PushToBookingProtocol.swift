//
//  PushToBookingProtocol.swift
//  CarRentalApp
//
//  Created by admin on 13.05.2022.
//

import Foundation

protocol PushToBookingProtocol: AnyObject {
    
    func cellDidTap(cars: CarsTable, historyDataProvider: HistoryDataProvider)
    
}
