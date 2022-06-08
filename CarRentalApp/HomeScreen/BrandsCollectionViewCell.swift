//
//  BrandsCollectionViewCell.swift
//  CarRentalApp
//
//  Created by admin on 08.05.2022.
//

import UIKit

final class BrandsCollectionViewCell: UICollectionViewCell {
    
    private lazy var conteinerForImage: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.layer.cornerRadius = 10
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 1)
        return view
    }()
    
     private lazy var mainImage: UIImageView = {
       let image = UIImageView()
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        preconfigureSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(dataModel: BrandModel) {
        mainImage.image = dataModel.modelImage
    }
    
    private func addSubviews() {
        contentView.addSubview(conteinerForImage)
        contentView.addSubview(mainImage)
    }

    private func preconfigureSubviews() {
        contentView.subviews.forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
    }
    
    private func setupConstraints() {
        conteinerForImageConstraints()
        mainImageConstraints()
    }
    
    private func conteinerForImageConstraints() {
        NSLayoutConstraint.activate([
            conteinerForImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            conteinerForImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            conteinerForImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            conteinerForImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
        ])
    }
    
    private func mainImageConstraints() {
        NSLayoutConstraint.activate([
            mainImage.topAnchor.constraint(equalTo: conteinerForImage.topAnchor, constant: 15),
            mainImage.leadingAnchor.constraint(equalTo: conteinerForImage.leadingAnchor, constant: 15),
            mainImage.heightAnchor.constraint(equalToConstant: 50),
            mainImage.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}
