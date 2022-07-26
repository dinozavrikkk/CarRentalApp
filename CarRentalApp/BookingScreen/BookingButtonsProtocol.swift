
import Foundation
import UIKit

protocol BookingButtonsProtocol: AnyObject {
    
    func counterButtonTapped(_ sender: UIButton)
    func bookButtonTapped(_ sender: UIButton, historyDataProvider: HistoryDataProvider)
}
