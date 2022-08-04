
import Foundation

protocol PushToBookingDelegate: AnyObject {
    
    func cellDidTap(cars: CarsTable, historyDataProvider: HistoryDataProvider)
    
}
