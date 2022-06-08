//
//  BookingButtonsProtocol.swift
//  CarRentalApp
//
//  Created by admin on 14.05.2022.
//

import Foundation
import UIKit


protocol BookingButtonsProtocol: AnyObject {
    
    func counterButtonTapped(_ sender: UIButton)
    func bookButtonTapped(_ sender: UIButton, historyDataProvider: HistoryDataProvider)
}
