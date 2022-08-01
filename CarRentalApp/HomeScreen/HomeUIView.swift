
import UIKit

final class HomeUIView: UIView {
    
    private lazy var backColorScreen: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        return view
    }()
    
    private lazy var brandsLabel: UILabel = {
       let label = UILabel()
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = .boldSystemFont(ofSize: 20)
        label.text = "Brands"
        return label
    }()
        
    lazy var brandsCollectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(switchToTheCarsScreen))
        collectionView.addGestureRecognizer(tapGesture)
        return collectionView
    }()
    
    private lazy var whiteCar: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "whiteCar")
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(whiteCarDidTap))
        image.addGestureRecognizer(tapGesture)
        image.isUserInteractionEnabled = true
        return image
    }()
    
    private lazy var hotLabel: UILabel = {
       let label = UILabel()
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = .systemFont(ofSize: 20)
        label.text = "Popular cars"
        return label
    }()
    
    private lazy var viewAll: UIButton = {
       let button = UIButton()
        button.setTitleColor(UIColor(red: 0.976, green: 0.706, blue: 0.004, alpha: 1), for: .normal)
        button.setTitle("View all...", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.addTarget(self, action: #selector(switchToTheCarsScreen), for: .touchUpInside)
        return button
    }()

    lazy var carsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = UIColor.clear
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(switchToTheCarsScreen))
        tableView.addGestureRecognizer(tapGesture)
        return tableView
    }()
    
    private lazy var whiteTopConstraint = whiteCar.topAnchor.constraint(equalTo: self.topAnchor, constant: 42)
    private lazy var whiteLeadingConstraint = whiteCar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40)
    
    weak var delegateHome: HomeScreenDelegate?
    
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
        [backColorScreen, brandsLabel, brandsCollectionView, whiteCar, hotLabel, viewAll, carsTableView].forEach{ subview in addSubview(subview) }
    }
    
    private func preconfigureSubviews() {
        subviews.forEach{ subview in subview.translatesAutoresizingMaskIntoConstraints = false }
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            carsTableView.topAnchor.constraint(equalTo: brandsCollectionView.bottomAnchor, constant: 110),
            carsTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            carsTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            carsTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100)
        ])
        
        NSLayoutConstraint.activate([
            viewAll.topAnchor.constraint(equalTo: brandsCollectionView.bottomAnchor, constant: 70),
            viewAll.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 275),
            viewAll.heightAnchor.constraint(equalToConstant: 30),
            viewAll.widthAnchor.constraint(equalToConstant: 93)
        ])
        
        NSLayoutConstraint.activate([
            hotLabel.topAnchor.constraint(equalTo: brandsCollectionView.bottomAnchor, constant: 70),
            hotLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            hotLabel.heightAnchor.constraint(equalToConstant: 30),
            hotLabel.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        NSLayoutConstraint.activate([
            backColorScreen.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            backColorScreen.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            backColorScreen.heightAnchor.constraint(equalToConstant: 402),
            backColorScreen.widthAnchor.constraint(equalToConstant: 428)
        ])
        
        NSLayoutConstraint.activate([
            brandsLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 324),
            brandsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            brandsLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            brandsCollectionView.topAnchor.constraint(equalTo: brandsLabel.bottomAnchor, constant: 9),
            brandsCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            brandsCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            brandsCollectionView.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        [whiteTopConstraint, whiteLeadingConstraint].forEach{ $0.isActive = true }
    }
    
    @objc private func whiteCarDidTap(_ gesture: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.5, delay: 0, animations: { self.whiteCar.transform = CGAffineTransform(rotationAngle: -0.5) }) {_ in
            self.layoutIfNeeded()
        }
        whiteLeadingConstraint.constant -= 160
        UIView.animate(withDuration: 0.5, delay: 0.5, options: [.transitionFlipFromRight]) {
            self.layoutIfNeeded()
        }
        UIView.animate(withDuration: 0.5, delay: 1, animations: { self.whiteCar.transform = CGAffineTransform(rotationAngle: 1.1) }) {_ in
            self.layoutIfNeeded()
        }
        whiteTopConstraint.constant -= 130
        UIView.animate(withDuration: 0.5, delay: 1.5, options: [.transitionFlipFromBottom]) {
            self.layoutIfNeeded()
        }
        UIView.animate(withDuration: 0.5, delay: 2, animations: { self.whiteCar.transform = CGAffineTransform(rotationAngle: 2.7) }) {_ in
            self.layoutIfNeeded()
        }
        whiteLeadingConstraint.constant += 270
        UIView.animate(withDuration: 1, delay: 2.5, options: .transitionFlipFromLeft) {
            self.layoutIfNeeded()
        }
        UIView.animate(withDuration: 0.5, delay: 3.5, animations: { self.whiteCar.transform = CGAffineTransform(rotationAngle: -2.05) }) {_ in
            self.layoutIfNeeded()
        }
        whiteTopConstraint.constant += 130
        UIView.animate(withDuration: 0.5, delay: 4, options: .transitionFlipFromTop) {
            self.layoutIfNeeded()
        }
        UIView.animate(withDuration: 0.5, delay: 4.5, animations: { self.whiteCar.transform = CGAffineTransform(rotationAngle: -0.5) }) {_ in
            self.layoutIfNeeded()
        }
        whiteLeadingConstraint.constant -= 110
        UIView.animate(withDuration: 0.5, delay: 5, options: .transitionFlipFromRight) {
            self.layoutIfNeeded()
        }
    }
    
    @objc private func switchToTheCarsScreen() {
        delegateHome?.switchingToTheCarScreenTapped()
    }
    
}
