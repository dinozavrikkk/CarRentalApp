//
//  RecentHistoryViewController.swift
//  CarRentalApp
//
//  Created by admin on 09.05.2022.
//

import UIKit

class RecentHistoryViewController: UIViewController {

    private let historyView = RecentHistoryUIView()
    private var dataProviderHistory: HistoryDataProvider
    
    init(dataProviderHistory: HistoryDataProvider) {
        self.dataProviderHistory = dataProviderHistory
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = historyView
        historyView.historyTableView.delegate = self
        historyView.historyTableView.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyView.historyTableView.register(RecentHistoryTableViewCell.self, forCellReuseIdentifier: "RecentHistoryTableViewCell")
        historyView.historyTableView.rowHeight = UITableView.automaticDimension
        historyView.historyTableView.separatorStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        historyView.historyTableView.reloadData()
    }
    
}

extension RecentHistoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataProviderHistory.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecentHistoryTableViewCell", for: indexPath) as? RecentHistoryTableViewCell
        cell?.update(dataModelHistory: dataProviderHistory.getCar(for: indexPath))
        return cell!
    }
}
