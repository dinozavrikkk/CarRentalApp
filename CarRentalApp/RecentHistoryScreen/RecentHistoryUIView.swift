
import UIKit

final class RecentHistoryUIView: UIView {
    
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
    
    private var titlePlug: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.text = "Your order history will be displayed here"
        label.font = .boldSystemFont(ofSize: 40)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        [historyLabel, historyTableView, titlePlug].forEach{ subview in addSubview(subview) }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titlePlug.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titlePlug.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titlePlug.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            titlePlug.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50)
        ])
        
        NSLayoutConstraint.activate([
            historyTableView.topAnchor.constraint(equalTo: historyLabel.bottomAnchor, constant: 40),
            historyTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 33),
            historyTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            historyTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100)
        ])
        
        NSLayoutConstraint.activate([
            historyLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 54),
            historyLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 130),
            historyLabel.heightAnchor.constraint(equalToConstant: 30),
            historyLabel.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    func hidingSign() {
        titlePlug.isHidden = true
    }

}
