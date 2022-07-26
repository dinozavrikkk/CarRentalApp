
import Foundation
import UIKit

class HistoryDataProvider {
    
    private let queue = DispatchQueue(label: "com.PaymentViewController.URLSession", qos: .userInteractive, attributes: .concurrent)
    private let defaults = UserDefaults.standard
    private var dataModelHistory: DataModelHistoryCarsTable
    private let todayDate = Date()
    private lazy var dateFormatter: DateFormatter = {
       let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        formatter.locale = Locale(identifier: "ru_RU")
        return formatter
    }()
    
    init(dataModelHistory: DataModelHistoryCarsTable) {
        self.dataModelHistory = dataModelHistory
    }
    
    func numberOfRowsInSection() -> Int {
        dataModelHistory.carHistoryTable.count
    }
    
    func getCar(for indexPath: IndexPath) -> CarsTableForHistory {
        dataModelHistory.carHistoryTable[indexPath.row]
    }
    
    func addCarToTable(carInfo: CarsTable) {
        if let historyClass = UserDefaultsManager.receiveUserData() {
            let carImageFileName = FileManager.saveImage(carInfo.miniPhoto)
            let cars = CarsTableForHistory(carImageFileName: carImageFileName, carModel: "\(carInfo.stamp) \(carInfo.model)", carPrice: carInfo.price, carCountDays: "\(carInfo.rentalDays) DAYS", carDate: "\(dateFormatter.string(from: todayDate))")
            historyClass.carHistoryTable.insert(cars, at: 0)
            UserDefaultsManager.saveUserData(userData: historyClass)
        } else {
            let carImageFileName = FileManager.saveImage(carInfo.miniPhoto)
            let cars = CarsTableForHistory(carImageFileName: carImageFileName, carModel: "\(carInfo.stamp) \(carInfo.model)", carPrice: carInfo.price, carCountDays: "\(carInfo.rentalDays) DAYS", carDate: "\(dateFormatter.string(from: todayDate))")
            dataModelHistory.carHistoryTable.insert(cars, at: 0)
            let dataModelHistoryCarsTable = DataModelHistoryCarsTable(carHistoryTable: dataModelHistory.carHistoryTable)
            UserDefaultsManager.saveUserData(userData: dataModelHistoryCarsTable)
        }
//        dataModelHistory.carHistoryTable.insert(contentsOf: .init(carImageFileName: nil, carModel: "\(carInfo.stamp) \(carInfo.model)", carPrice: carInfo.price, carCountDays: "\(carInfo.rentalDays) DAYS", carDate: "\(dateFormatter.string(from: todayDate))"), at: 0)
    }
    
    func fetchJokee() {
        queue.async {
            guard let url = URL(string: "https://v2.jokeapi.dev/joke/Any") else { return }
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else { return }
                guard let joke = try? JSONDecoder().decode(Joke.self, from: data) else { return }
                print("Joke:\n\(joke.setup)\n\(joke.delivery)")
            }
            task.resume()
        }
    }

}
