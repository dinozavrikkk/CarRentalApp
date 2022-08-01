
import UIKit

final class RecentHistoryTableViewCell: UITableViewCell {
    
    private lazy var containerForImage: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1).cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var modelImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "bmw")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var conteiner: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1).cgColor
        view.layer.borderWidth = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var modelLabel: UILabel = {
       let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.text = "Mercedes  AMG"
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dollarLabel: UILabel = {
       let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.text = "$"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceLabel: UILabel = {
       let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.text = "100"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var priceStackView: UIStackView = {
        let stack = UIStackView()
        [dollarLabel, priceLabel].forEach { stack.addArrangedSubview($0) }
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var daysLabel: UILabel = {
       let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1)
        label.text = "2 DAYS"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
       let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1)
        label.text = "Dec 14,2021"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        self.backgroundColor = .clear
        
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        [conteiner, containerForImage, modelImage, modelLabel, priceStackView, daysLabel, dateLabel].forEach{ subview in contentView.addSubview(subview) }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: modelLabel.bottomAnchor, constant: 6),
            dateLabel.leadingAnchor.constraint(equalTo: containerForImage.trailingAnchor, constant: 15),
            dateLabel.trailingAnchor.constraint(equalTo: daysLabel.leadingAnchor, constant: -6),
            dateLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            daysLabel.topAnchor.constraint(equalTo: priceStackView.bottomAnchor, constant: 6),
            daysLabel.leadingAnchor.constraint(equalTo: containerForImage.trailingAnchor, constant: 190),
            daysLabel.heightAnchor.constraint(equalToConstant: 25),
            daysLabel.widthAnchor.constraint(equalToConstant: 55)
        ])
        
        NSLayoutConstraint.activate([
            priceStackView.topAnchor.constraint(equalTo: conteiner.topAnchor, constant: 15),
            priceStackView.leadingAnchor.constraint(equalTo: containerForImage.trailingAnchor, constant: 190),
            priceStackView.heightAnchor.constraint(equalToConstant: 30),
            priceStackView.widthAnchor.constraint(equalToConstant: 60)
        ])

        NSLayoutConstraint.activate([
            modelLabel.topAnchor.constraint(equalTo: conteiner.topAnchor, constant: 15),
            modelLabel.leadingAnchor.constraint(equalTo: containerForImage.trailingAnchor, constant: 15),
            modelLabel.heightAnchor.constraint(equalToConstant: 30),
            modelLabel.widthAnchor.constraint(equalToConstant: 175)
        ])
        
        NSLayoutConstraint.activate([
            conteiner.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            conteiner.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            conteiner.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            conteiner.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            conteiner.heightAnchor.constraint(equalToConstant: 90)
        ])
        
        NSLayoutConstraint.activate([
            modelImage.topAnchor.constraint(equalTo: containerForImage.topAnchor, constant: 10),
            modelImage.leadingAnchor.constraint(equalTo: containerForImage.leadingAnchor, constant: 10),
            modelImage.heightAnchor.constraint(equalToConstant: 40),
            modelImage.widthAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            containerForImage.topAnchor.constraint(equalTo: conteiner.topAnchor, constant: 15),
            containerForImage.leadingAnchor.constraint(equalTo: conteiner.leadingAnchor, constant: 10),
            containerForImage.heightAnchor.constraint(equalToConstant: 60),
            containerForImage.widthAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    func update(dataModelHistory: CarsTableForHistory) {
//        modelImage.image = dataModelHistory.carImageFileName
        modelImage.image = FileManager.loadImage(fileName: dataModelHistory.carImageFileName!)
        modelLabel.text = dataModelHistory.carModel
        priceLabel.text = dataModelHistory.carPrice
        daysLabel.text = dataModelHistory.carCountDays
        dateLabel.text = dataModelHistory.carDate
    }
 
}
