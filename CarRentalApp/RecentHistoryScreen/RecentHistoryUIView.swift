//
//  RecentHistoryUIView.swift
//  CarRentalApp
//
//  Created by admin on 01.06.2022.
//

import UIKit

class RecentHistoryUIView: UIView {

    private lazy var conteinerForStatusBar: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var historyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Recent History"
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var historyTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.layer.cornerRadius = 10
        tableView.backgroundColor = UIColor.clear
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        [conteinerForStatusBar, historyLabel, historyTableView].forEach{ subview in addSubview(subview) }
    }
    
    private func setupConstraints() {
        conteinerForStatusBarConstraints()
        historyLabelConstraints()
        historyTableViewConstraints()
    }
    
    private func historyTableViewConstraints() {
        NSLayoutConstraint.activate([
            historyTableView.topAnchor.constraint(equalTo: historyLabel.bottomAnchor, constant: 40),
            historyTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 33),
            historyTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            historyTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100)
        ])
    }
    
    private func historyLabelConstraints() {
        NSLayoutConstraint.activate([
            historyLabel.topAnchor.constraint(equalTo: conteinerForStatusBar.bottomAnchor, constant: 20),
            historyLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 130),
            historyLabel.heightAnchor.constraint(equalToConstant: 30),
            historyLabel.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func conteinerForStatusBarConstraints() {
        NSLayoutConstraint.activate([
            conteinerForStatusBar.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            conteinerForStatusBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            conteinerForStatusBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            conteinerForStatusBar.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
}
