//
//  CarsUIView.swift
//  CarRentalApp
//
//  Created by admin on 09.05.2022.
//

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
    
    private lazy var conteinerForStatusBar: UIView = {
       let view = UIView()
        view.backgroundColor = .black
        return view
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
        addSubview(brandsLabel)
        addSubview(brandsCollectionView)
        addSubview(carsTableView)
        addSubview(conteinerForStatusBar)
        
    }
    
    private func preconfigureSubviews() {
        subviews.forEach{ subview in subview.translatesAutoresizingMaskIntoConstraints = false }
    }
    
    private func setupConstraints() {
        brandsLabelConstraints()
        brandsCollectionViewConstraints()
        carsTableViewConstraints()
        conteinerForStatusBarConstraints()
    }
    
    private func conteinerForStatusBarConstraints() {
        NSLayoutConstraint.activate([
            conteinerForStatusBar.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            conteinerForStatusBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            conteinerForStatusBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            conteinerForStatusBar.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    private func carsTableViewConstraints() {
        NSLayoutConstraint.activate([
            carsTableView.topAnchor.constraint(equalTo: brandsLabel.bottomAnchor, constant: 142),
            carsTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            carsTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            carsTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50)
        ])
    }
    
    private func brandsCollectionViewConstraints() {
        NSLayoutConstraint.activate([
            brandsCollectionView.topAnchor.constraint(equalTo: brandsLabel.bottomAnchor, constant: 9),
            brandsCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            brandsCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            brandsCollectionView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    private func brandsLabelConstraints() {
        NSLayoutConstraint.activate([
            brandsLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 85),
            brandsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            brandsLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    
}
