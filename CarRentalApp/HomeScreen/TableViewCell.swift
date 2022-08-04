
import Foundation
import UIKit

final class TableViewCell: UITableViewCell {
    
    private lazy var conteinerForCar: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(red: 0.961, green: 0.965, blue: 0.98, alpha: 1)
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var modelImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
         return image
    }()
    
    private lazy var modelCarLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        label.font = .boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var submodelCarLabel: UILabel = {
       let label = UILabel()
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = .boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        selectionStyle = .none
        
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        [conteinerForCar, modelImage, modelCarLabel, submodelCarLabel].forEach { subview in contentView.addSubview(subview) }
    }
    
    private func setupConstraints() {

        NSLayoutConstraint.activate([
            submodelCarLabel.topAnchor.constraint(equalTo: conteinerForCar.topAnchor, constant: 30),
            submodelCarLabel.leadingAnchor.constraint(equalTo: conteinerForCar.leadingAnchor, constant: 10),
            submodelCarLabel.heightAnchor.constraint(equalToConstant: 20),
            submodelCarLabel.widthAnchor.constraint(equalToConstant: 140)
        ])
        
        NSLayoutConstraint.activate([
            modelCarLabel.topAnchor.constraint(equalTo: conteinerForCar.topAnchor, constant: 15),
            modelCarLabel.leadingAnchor.constraint(equalTo: conteinerForCar.leadingAnchor, constant: 10),
            modelCarLabel.heightAnchor.constraint(equalToConstant: 18),
            modelCarLabel.widthAnchor.constraint(equalToConstant: 200)
        ])

        NSLayoutConstraint.activate([
            modelImage.topAnchor.constraint(equalTo: conteinerForCar.topAnchor, constant: 40),
            modelImage.leadingAnchor.constraint(equalTo: conteinerForCar.leadingAnchor, constant: 30),
            modelImage.trailingAnchor.constraint(equalTo: conteinerForCar.trailingAnchor, constant: -30),
            modelImage.heightAnchor.constraint(equalToConstant: 146),
            modelImage.widthAnchor.constraint(equalToConstant: 250)
        ])
        
        NSLayoutConstraint.activate([
            conteinerForCar.topAnchor.constraint(equalTo: contentView.topAnchor),
            conteinerForCar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            conteinerForCar.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            conteinerForCar.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            conteinerForCar.heightAnchor.constraint(equalToConstant: 200)
        ])
        
    }
    
    func update(dataModel: PopularCarsModel) {
        modelImage.image = dataModel.modelImage
        modelCarLabel.text = dataModel.modelLabel
        submodelCarLabel.text = dataModel.submodelLabel
    }
    
}
