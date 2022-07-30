
import Foundation
import UIKit

protocol BookingButtonsDelegate: AnyObject {
    
    func counterButtonTapped(_ sender: UIButton)
    func bookButtonTapped(_ sender: UIButton, historyDataProvider: HistoryDataProvider)
}
