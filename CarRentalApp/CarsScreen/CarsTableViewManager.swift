
import Foundation
import UIKit

final class CarsTableViewManager: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var dataProvider: CarsDataProvider
    var historyDataProvider: HistoryDataProvider
    weak var delegatePushBooking: PushToBookingDelegate?
    
    init(dataProvider: CarsDataProvider, historyDataProvider: HistoryDataProvider) {
        self.dataProvider = dataProvider
        self.historyDataProvider = historyDataProvider
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataProvider.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarsTableViewCell", for: indexPath) as? CarsTableViewCell
        cell?.update(dataModel: dataProvider.getCar(for: indexPath))
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cars = dataProvider.getCar(for: indexPath)
        delegatePushBooking?.cellDidTap(cars: cars, historyDataProvider: historyDataProvider)
    }
    
    
}
