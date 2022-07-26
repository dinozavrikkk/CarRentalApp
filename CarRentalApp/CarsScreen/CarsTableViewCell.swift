
import UIKit

final class CarsTableViewCell: UITableViewCell {
    
    private lazy var conteiner: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.961, green: 0.965, blue: 0.98, alpha: 1)
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var carPrice: UILabel = {
       let label = UILabel()
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = .boldSystemFont(ofSize: 14)
        label.text = "$14.99"
        return label
    }()
    
    private lazy var modelCar: UILabel = {
       let label = UILabel()
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        label.text = "BMW"
        label.font = .boldSystemFont(ofSize: 14)
        return label
    }()
    
    private lazy var submodelCar: UILabel = {
       let label = UILabel()
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.text = "X5"
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()
    
    private lazy var carImage: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "bmwx5")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var dollarLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = .boldSystemFont(ofSize: 14)
        label.text = "$"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        addSubviews()
        preconfigureSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        [conteiner, carPrice, carImage, modelCar, submodelCar, dollarLabel].forEach{ subview in contentView.addSubview(subview) }
    }
    
    private func preconfigureSubviews() {
        contentView.subviews.forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            dollarLabel.topAnchor.constraint(equalTo: conteiner.topAnchor, constant: 15),
            dollarLabel.leadingAnchor.constraint(equalTo: conteiner.leadingAnchor, constant: 245),
            dollarLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
        
        NSLayoutConstraint.activate([
            carImage.topAnchor.constraint(equalTo: conteiner.topAnchor, constant: 40),
            carImage.leadingAnchor.constraint(equalTo: conteiner.leadingAnchor, constant: 30),
            carImage.trailingAnchor.constraint(equalTo: conteiner.trailingAnchor, constant: -30),
            carImage.widthAnchor.constraint(equalToConstant: 250),
            carImage.heightAnchor.constraint(equalToConstant: 146)
        ])
        
        NSLayoutConstraint.activate([
            submodelCar.topAnchor.constraint(equalTo: conteiner.topAnchor, constant: 30),
            submodelCar.leadingAnchor.constraint(equalTo: conteiner.leadingAnchor, constant: 10),
            submodelCar.heightAnchor.constraint(equalToConstant: 20),
            submodelCar.widthAnchor.constraint(equalToConstant: 140)
        ])
        
        NSLayoutConstraint.activate([
            modelCar.topAnchor.constraint(equalTo: conteiner.topAnchor, constant: 15),
            modelCar.leadingAnchor.constraint(equalTo: conteiner.leadingAnchor, constant: 10),
            modelCar.heightAnchor.constraint(equalToConstant: 18),
            modelCar.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            carPrice.topAnchor.constraint(equalTo: conteiner.topAnchor, constant: 15),
            carPrice.leadingAnchor.constraint(equalTo: dollarLabel.trailingAnchor, constant: 5),
            carPrice.trailingAnchor.constraint(equalTo: conteiner.trailingAnchor, constant: -5),
            carPrice.heightAnchor.constraint(equalToConstant: 18)
        ])
        
        NSLayoutConstraint.activate([
            conteiner.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            conteiner.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            conteiner.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            conteiner.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            conteiner.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func update(dataModel: CarsTable) {
        carImage.image = dataModel.carPhoto
        modelCar.text = dataModel.model
        submodelCar.text = dataModel.stamp
        carPrice.text = dataModel.price
    }

}
