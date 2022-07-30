
import UIKit

final class CarsUIView: UIView {

    private lazy var brandsLabel: UILabel = {
       let label = UILabel()
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.text = "Brands"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    lazy var brandsCollectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    lazy var carsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.layer.cornerRadius = 10
        tableView.backgroundColor = UIColor.clear
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        addSubviews()
        preconfigureSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        [brandsLabel, brandsCollectionView, carsTableView].forEach{ subview in addSubview(subview) }
    }
    
    private func preconfigureSubviews() {
        subviews.forEach{ subview in subview.translatesAutoresizingMaskIntoConstraints = false }
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            carsTableView.topAnchor.constraint(equalTo: brandsLabel.bottomAnchor, constant: 142),
            carsTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            carsTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            carsTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50)
        ])
        
        NSLayoutConstraint.activate([
            brandsCollectionView.topAnchor.constraint(equalTo: brandsLabel.bottomAnchor, constant: 9),
            brandsCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            brandsCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            brandsCollectionView.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        NSLayoutConstraint.activate([
            brandsLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 85),
            brandsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            brandsLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
    }

}
