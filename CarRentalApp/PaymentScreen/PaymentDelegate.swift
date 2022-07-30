
import Foundation
import UIKit

protocol PaymentDelegate: AnyObject {
    
    func payButtonTapped(_ sender: UIButton, historyDataProvider: HistoryDataProvider)
    
}
