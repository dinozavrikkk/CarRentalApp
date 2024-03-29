
import UIKit

final class RecentHistoryViewController: UIViewController {

    private let historyView = RecentHistoryUIView()
    private var dataProviderHistory: HistoryDataProvider
    private var historyClass: DataModelHistoryCarsTable?
    
    init(dataProviderHistory: HistoryDataProvider) {
        self.dataProviderHistory = dataProviderHistory
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = historyView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        historyClass = UserDefaultsManager.receiveUserData()
        historyView.historyTableView.reloadData()
        
        if historyView.historyTableView.numberOfRows(inSection: 0) > 0 {
            historyView.hidingSign()
        }
    }
    
}

//MARK: UITableViewDelegate, UITableViewDataSource
extension RecentHistoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyClass?.carHistoryTable.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecentHistoryTableViewCell", for: indexPath) as? RecentHistoryTableViewCell,
              let carsTableForHistory = historyClass?.carHistoryTable[indexPath.row] else { return UITableViewCell() }
        cell.update(dataModelHistory: carsTableForHistory)
        return cell
    }
}

//MARK: Configure TableView
private extension RecentHistoryViewController {
    
    func configureTableView() {
        historyView.historyTableView.delegate = self
        historyView.historyTableView.dataSource = self
        historyView.historyTableView.register(RecentHistoryTableViewCell.self, forCellReuseIdentifier: "RecentHistoryTableViewCell")
        historyView.historyTableView.rowHeight = UITableView.automaticDimension
        historyView.historyTableView.separatorStyle = .none
    }
}
