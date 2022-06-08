//
//  PaymentUIView.swift
//  CarRentalApp
//
//  Created by admin on 15.05.2022.
//

import UIKit

final class PaymentUIView: UIView, UITextFieldDelegate {
    
    weak var delegatePayment: PaymentProtocol?
    
    private lazy var containerForCard: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.layer.cornerRadius = 40
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var carImage: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "whiteCar")
        image.translatesAutoresizingMaskIntoConstraints = false
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(carDidTap))
        image.addGestureRecognizer(tapGesture)
        image.isUserInteractionEnabled = true
        return image
    }()
    
    @objc private func carDidTap(_ gesture: UITapGestureRecognizer) {
        isFullSizeCar.toggle()
        activateCarPhotoConstraints(isFullSize: isFullSizeCar)
    }
    
    private lazy var containerForInfo: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1).cgColor
        view.layer.shadowColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 0
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var mastercardImage: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "mastercard")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var containerForCardNumber: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.layer.borderColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1).cgColor
        view.layer.borderWidth = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var containerForCardHolder: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.layer.borderColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1).cgColor
        view.layer.borderWidth = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var containerForCardData: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.layer.borderColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1).cgColor
        view.layer.borderWidth = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var containerForCardPass: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.layer.borderColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1).cgColor
        view.layer.borderWidth = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var containerForTotalPrice: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.layer.borderColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1).cgColor
        view.layer.borderWidth = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var payButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = UIColor(red: 0.976, green: 0.706, blue: 0.004, alpha: 1)
        button.layer.cornerRadius = 20
        button.setTitle("Pay now", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(payButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    
    private lazy var saveLabel: UILabel = {
       let label = UILabel()
        label.text = "Save Card Information"
        label.font = .systemFont(ofSize: 14)
        label.textColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var checkImage: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "saveData")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var checkView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.layer.borderColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1).cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 11
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var numberTextField: UITextField = {
       let field = UITextField()
        field.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        field.font = .systemFont(ofSize: 14)
        field.placeholder = "Card Number"
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private lazy var holderTextField: UITextField = {
       let field = UITextField()
        field.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        field.font = .systemFont(ofSize: 14)
        field.placeholder = "Card Holder’s Name"
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private lazy var dataTextField: UITextField = {
       let field = UITextField()
        field.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        field.font = .systemFont(ofSize: 14)
        field.placeholder = "MM/YY"
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private lazy var passTextField: UITextField = {
       let field = UITextField()
        field.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        field.font = .systemFont(ofSize: 14)
        field.placeholder = "CVV"
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    var number: String {
        return numberTextField.text!
    }
    
    var holder: String {
        return holderTextField.text!
    }
    
    var data: String {
        return dataTextField.text!
    }
    
    var pass: String {
        return passTextField.text!
    }
    
     lazy var totalPriceLabel: UILabel = {
       let field = UILabel()
        field.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        field.font = .boldSystemFont(ofSize: 15)
        field.text = "Total price: $"
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private lazy var executionLabel: UILabel = {
        let field = UILabel()
        field.font = .boldSystemFont(ofSize: 18)
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private var historyDataProvider: HistoryDataProvider
    
    init(historyDataProvider: HistoryDataProvider) {
        self.historyDataProvider = historyDataProvider
        super.init(frame: .zero)
        self.backgroundColor = .black
        
        addSubviews()
        setupConstraints()
        setupImageGesture()
        setupDefaultsFields()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        [containerForCard, carImage, containerForInfo, mastercardImage, containerForCardNumber, containerForCardHolder, containerForCardData, containerForCardPass, containerForTotalPrice, payButton, checkView, checkImage, saveLabel, numberTextField, holderTextField, dataTextField, passTextField, totalPriceLabel, executionLabel].forEach{ subview in addSubview(subview) }
    }
    
    private func setupConstraints() {
        containerForCardConstraints()
        carImageConstraints()
        containerForInfoConstraints()
        mastercardConstraints()
        containerForCardNumberConstraints()
        containerForCardHolderConstraints()
        containerForCardDataConstraints()
        containerForCardPassConstraints()
        containerForTotalPriceConstraints()
        payButtonConstraints()
        checkViewConstraints()
        checkImageConstraints()
        saveDataConstraints()
        numberTextFieldConstraints()
        holderTextFieldConstraints()
        dataTextFieldConstraints()
        passTextFieldConstraints()
        priceTextFieldConstraints()
        executionLabelConstrasints()
    }
    
    private func executionLabelConstrasints() {
        NSLayoutConstraint.activate([
            executionLabel.topAnchor.constraint(equalTo: containerForInfo.topAnchor, constant: 12),
            executionLabel.leadingAnchor.constraint(equalTo: mastercardImage.trailingAnchor, constant: 10),
            executionLabel.trailingAnchor.constraint(equalTo: containerForInfo.trailingAnchor, constant: -12),
            executionLabel.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    private func setupDefaultsFields() {
        passTextField.text = UserDefaults.standard.string(forKey: KeysDefaults.keyPass)
        dataTextField.text = UserDefaults.standard.string(forKey: KeysDefaults.keyData)
        holderTextField.text = UserDefaults.standard.string(forKey: KeysDefaults.keyHolder)
        numberTextField.text = UserDefaults.standard.string(forKey: KeysDefaults.keyNumber)
    }
    
    private func setupImageGesture() {
        checkImage.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageDidTap))
        checkImage.addGestureRecognizer(tapGesture)
    }
    
    @objc private func payButtonDidTap(_ sender: UIButton) {
        delegatePayment?.payButtonTapped(payButton, executionLabel, historyDataProvider: historyDataProvider)
    }

    
    @objc private func imageDidTap(_ gesture: UITapGestureRecognizer) {
        isCompleted.toggle()
    }
    
    var isCompleted: Bool = false {
        didSet {
            checkImage.image = isCompleted ? UIImage(named: "emptyCircle") : UIImage(named: "saveData")
        }
    }
    
    private var isFullSizeCar = true
    var fullSizeCarConstraints: [NSLayoutConstraint] = []
    var halfSizeCarConstraints: [NSLayoutConstraint] = []
    
    private func activateCarPhotoConstraints(isFullSize: Bool) {
        fullSizeCarConstraints.forEach{ $0.isActive = isFullSize }
        halfSizeCarConstraints.forEach{ $0.isActive = !isFullSize }
    }
    
    private func carImageConstraints() {
        
        let heightFullConstraints = carImage.heightAnchor.constraint(equalToConstant: 350)
        let widthFullConstraints = carImage.widthAnchor.constraint(equalToConstant: 350)
        
        fullSizeCarConstraints.append(heightFullConstraints)
        fullSizeCarConstraints.append(widthFullConstraints)
        
        let heightHalfConstraints = carImage.heightAnchor.constraint(equalToConstant: 150)
        let widthHalfConstraints = carImage.widthAnchor.constraint(equalToConstant: 150)
        
        halfSizeCarConstraints.append(heightHalfConstraints)
        halfSizeCarConstraints.append(widthHalfConstraints)
        
        NSLayoutConstraint.activate([
            carImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 45),
            carImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 35)
        ])
        
        activateCarPhotoConstraints(isFullSize: true)
        
    }
    
    private func priceTextFieldConstraints() {
        NSLayoutConstraint.activate([
            totalPriceLabel.topAnchor.constraint(equalTo: containerForTotalPrice.topAnchor, constant: 18),
            totalPriceLabel.leadingAnchor.constraint(equalTo: containerForTotalPrice.leadingAnchor, constant: 20),
            totalPriceLabel.heightAnchor.constraint(equalToConstant: 25),
            totalPriceLabel.widthAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    private func passTextFieldConstraints() {
        NSLayoutConstraint.activate([
            passTextField.topAnchor.constraint(equalTo: containerForCardPass.topAnchor, constant: 15),
            passTextField.leadingAnchor.constraint(equalTo: containerForCardPass.leadingAnchor, constant: 20),
            passTextField.heightAnchor.constraint(equalToConstant: 21),
            passTextField.widthAnchor.constraint(equalToConstant: 90)
        ])
    }
    
    private func dataTextFieldConstraints() {
        NSLayoutConstraint.activate([
            dataTextField.topAnchor.constraint(equalTo: containerForCardData.topAnchor, constant: 15),
            dataTextField.leadingAnchor.constraint(equalTo: containerForCardData.leadingAnchor, constant: 20),
            dataTextField.heightAnchor.constraint(equalToConstant: 21),
            dataTextField.widthAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    private func holderTextFieldConstraints() {
        NSLayoutConstraint.activate([
            holderTextField.topAnchor.constraint(equalTo: containerForCardHolder.topAnchor, constant: 15),
            holderTextField.leadingAnchor.constraint(equalTo: containerForCardHolder.leadingAnchor, constant: 20),
            holderTextField.heightAnchor.constraint(equalToConstant: 21),
            holderTextField.widthAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    private func numberTextFieldConstraints() {
        NSLayoutConstraint.activate([
            numberTextField.topAnchor.constraint(equalTo: containerForCardNumber.topAnchor, constant: 15),
            numberTextField.leadingAnchor.constraint(equalTo: containerForCardNumber.leadingAnchor, constant: 20),
            numberTextField.heightAnchor.constraint(equalToConstant: 21),
            numberTextField.widthAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    private func saveDataConstraints() {
        NSLayoutConstraint.activate([
            saveLabel.topAnchor.constraint(equalTo: containerForCardData.bottomAnchor, constant: 13),
            saveLabel.leadingAnchor.constraint(equalTo: checkView.trailingAnchor, constant: 10),
            saveLabel.heightAnchor.constraint(equalToConstant: 20),
            saveLabel.widthAnchor.constraint(equalToConstant: 160)
        ])
    }
    
    private func checkImageConstraints() {
        NSLayoutConstraint.activate([
            checkImage.topAnchor.constraint(equalTo: containerForCardData.bottomAnchor, constant: 12),
            checkImage.leadingAnchor.constraint(equalTo: containerForInfo.leadingAnchor, constant: 15),
            checkImage.heightAnchor.constraint(equalToConstant: 22),
            checkImage.widthAnchor.constraint(equalToConstant: 22)
        ])
    }
    
    private func checkViewConstraints() {
        NSLayoutConstraint.activate([
            checkView.topAnchor.constraint(equalTo: containerForCardData.bottomAnchor, constant: 12),
            checkView.leadingAnchor.constraint(equalTo: containerForInfo.leadingAnchor, constant: 15),
            checkView.heightAnchor.constraint(equalToConstant: 22),
            checkView.widthAnchor.constraint(equalToConstant: 22)
        ])
    }
    
    private func payButtonConstraints() {
        NSLayoutConstraint.activate([
            payButton.topAnchor.constraint(equalTo: containerForTotalPrice.bottomAnchor, constant: 16),
            payButton.leadingAnchor.constraint(equalTo: containerForCard.leadingAnchor, constant: 48),
            payButton.heightAnchor.constraint(equalToConstant: 50),
            payButton.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func containerForTotalPriceConstraints() {
        NSLayoutConstraint.activate([
            containerForTotalPrice.topAnchor.constraint(equalTo: containerForInfo.bottomAnchor, constant: 20),
            containerForTotalPrice.leadingAnchor.constraint(equalTo: containerForCard.leadingAnchor, constant: 47),
            containerForTotalPrice.heightAnchor.constraint(equalToConstant: 60),
            containerForTotalPrice.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func containerForCardPassConstraints() {
        NSLayoutConstraint.activate([
            containerForCardPass.topAnchor.constraint(equalTo: containerForCardHolder.bottomAnchor, constant: 8),
            containerForCardPass.leadingAnchor.constraint(equalTo: containerForInfo.leadingAnchor, constant: 180),
            containerForCardPass.heightAnchor.constraint(equalToConstant: 50),
            containerForCardPass.widthAnchor.constraint(equalToConstant: 135)
        ])
    }
    
    private func containerForCardDataConstraints() {
        NSLayoutConstraint.activate([
            containerForCardData.topAnchor.constraint(equalTo: containerForCardHolder.bottomAnchor, constant: 8),
            containerForCardData.leadingAnchor.constraint(equalTo: containerForInfo.leadingAnchor, constant: 15),
            containerForCardData.heightAnchor.constraint(equalToConstant: 50),
            containerForCardData.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func containerForCardHolderConstraints() {
        NSLayoutConstraint.activate([
            containerForCardHolder.topAnchor.constraint(equalTo: containerForCardNumber.bottomAnchor, constant: 8),
            containerForCardHolder.leadingAnchor.constraint(equalTo: containerForInfo.leadingAnchor, constant: 15),
            containerForCardHolder.heightAnchor.constraint(equalToConstant: 50),
            containerForCardHolder.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func containerForCardNumberConstraints() {
        NSLayoutConstraint.activate([
            containerForCardNumber.topAnchor.constraint(equalTo: containerForInfo.topAnchor, constant: 70),
            containerForCardNumber.leadingAnchor.constraint(equalTo: containerForInfo.leadingAnchor, constant: 15),
            containerForCardNumber.heightAnchor.constraint(equalToConstant: 50),
            containerForCardNumber.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func mastercardConstraints() {
        NSLayoutConstraint.activate([
            mastercardImage.topAnchor.constraint(equalTo: containerForInfo.topAnchor, constant: 12),
            mastercardImage.leadingAnchor.constraint(equalTo: containerForInfo.leadingAnchor, constant: 10),
            mastercardImage.heightAnchor.constraint(equalToConstant: 45),
            mastercardImage.widthAnchor.constraint(equalToConstant: 75)
        ])
    }
    
    private func containerForInfoConstraints() {
        NSLayoutConstraint.activate([
            containerForInfo.topAnchor.constraint(equalTo: containerForCard.topAnchor, constant: 40),
            containerForInfo.leadingAnchor.constraint(equalTo: containerForCard.leadingAnchor, constant: 32),
            containerForInfo.widthAnchor.constraint(equalToConstant: 330),
            containerForInfo.heightAnchor.constraint(equalToConstant: 285)
        ])
    }
    
    private func containerForCardConstraints() {
        NSLayoutConstraint.activate([
            containerForCard.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            containerForCard.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            containerForCard.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 50),
            containerForCard.heightAnchor.constraint(equalToConstant: 550)
        ])
    }
}
