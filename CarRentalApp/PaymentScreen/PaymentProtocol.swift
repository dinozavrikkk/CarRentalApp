//
//  PaymentProtocol.swift
//  CarRentalApp
//
//  Created by admin on 24.05.2022.
//

import Foundation
import UIKit

protocol PaymentProtocol: AnyObject {
    
    func payButtonTapped(_ sender: UIButton, _ label: UILabel, historyDataProvider: HistoryDataProvider)
    
}
