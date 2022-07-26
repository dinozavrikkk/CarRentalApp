
import UIKit

final class PaymentUIView: UIView {
    
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
    
    private(set) lazy var numberTextField: UITextField = {
       let field = UITextField()
        field.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        field.font = .systemFont(ofSize: 14)
        field.placeholder = "Card Number"
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private(set) lazy var holderTextField: UITextField = {
       let field = UITextField()
        field.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        field.font = .systemFont(ofSize: 14)
        field.placeholder = "Card Holder’s Name"
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private(set) lazy var dateTextField: UITextField = {
       let field = UITextField()
        field.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        field.font = .systemFont(ofSize: 14)
        field.placeholder = "MM/YY"
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private(set) lazy var passTextField: UITextField = {
       let field = UITextField()
        field.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        field.font = .systemFont(ofSize: 14)
        field.placeholder = "CVV"
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
     private(set) lazy var totalPriceLabel: UILabel = {
       let field = UILabel()
        field.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        field.font = .boldSystemFont(ofSize: 15)
        field.text = "Total price: $"
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private lazy var contentView: UIView = {
       let contentView = UIView()
        contentView.backgroundColor = .black
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private lazy var contentViewHeightConstraint = contentView.heightAnchor.constraint(equalTo: self.heightAnchor)
    
    weak var delegatePayment: PaymentProtocol?
    private let historyDataProvider: HistoryDataProvider
    
    private var keyboardIsVisible = false
    private let maxCardCount = 16
    private let maxDateCard = 4
    private let maxPassCard = 3
    private let regex = try! NSRegularExpression(pattern: "[\\+\\s-\\(\\)\\/]", options: .caseInsensitive)
    
    init(historyDataProvider: HistoryDataProvider) {
        self.historyDataProvider = historyDataProvider
        super.init(frame: .zero)
        self.backgroundColor = .black
        
        addSubview(contentView)
        addSubviewsToContentView()
        setupConstraints()
        setupImageGesture()
        setupDefaultsFields()
        setupDelegate()
        registerKeybordNotification()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviewsToContentView() {
        [containerForCard, carImage, containerForInfo, mastercardImage, containerForCardNumber, containerForCardHolder, containerForCardData, containerForCardPass, containerForTotalPrice, payButton, checkView, checkImage, saveLabel, numberTextField, holderTextField, dateTextField, passTextField, totalPriceLabel].forEach{ subview in contentView.addSubview(subview) }
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            contentView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            contentView.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            totalPriceLabel.topAnchor.constraint(equalTo: containerForTotalPrice.topAnchor, constant: 18),
            totalPriceLabel.leadingAnchor.constraint(equalTo: containerForTotalPrice.leadingAnchor, constant: 20),
            totalPriceLabel.heightAnchor.constraint(equalToConstant: 25),
            totalPriceLabel.widthAnchor.constraint(equalToConstant: 250)
        ])
        
        NSLayoutConstraint.activate([
            passTextField.topAnchor.constraint(equalTo: containerForCardPass.topAnchor, constant: 15),
            passTextField.leadingAnchor.constraint(equalTo: containerForCardPass.leadingAnchor, constant: 20),
            passTextField.heightAnchor.constraint(equalToConstant: 21),
            passTextField.widthAnchor.constraint(equalToConstant: 90)
        ])
        
        NSLayoutConstraint.activate([
            dateTextField.topAnchor.constraint(equalTo: containerForCardData.topAnchor, constant: 15),
            dateTextField.leadingAnchor.constraint(equalTo: containerForCardData.leadingAnchor, constant: 20),
            dateTextField.heightAnchor.constraint(equalToConstant: 21),
            dateTextField.widthAnchor.constraint(equalToConstant: 250)
        ])
        
        NSLayoutConstraint.activate([
            holderTextField.topAnchor.constraint(equalTo: containerForCardHolder.topAnchor, constant: 15),
            holderTextField.leadingAnchor.constraint(equalTo: containerForCardHolder.leadingAnchor, constant: 20),
            holderTextField.heightAnchor.constraint(equalToConstant: 21),
            holderTextField.widthAnchor.constraint(equalToConstant: 250)
        ])
        
        NSLayoutConstraint.activate([
            numberTextField.topAnchor.constraint(equalTo: containerForCardNumber.topAnchor, constant: 15),
            numberTextField.leadingAnchor.constraint(equalTo: containerForCardNumber.leadingAnchor, constant: 20),
            numberTextField.heightAnchor.constraint(equalToConstant: 21),
            numberTextField.widthAnchor.constraint(equalToConstant: 250)
        ])
        
        NSLayoutConstraint.activate([
            saveLabel.topAnchor.constraint(equalTo: containerForCardData.bottomAnchor, constant: 13),
            saveLabel.leadingAnchor.constraint(equalTo: checkView.trailingAnchor, constant: 10),
            saveLabel.heightAnchor.constraint(equalToConstant: 20),
            saveLabel.widthAnchor.constraint(equalToConstant: 160)
        ])
        
        NSLayoutConstraint.activate([
            checkImage.topAnchor.constraint(equalTo: containerForCardData.bottomAnchor, constant: 12),
            checkImage.leadingAnchor.constraint(equalTo: containerForInfo.leadingAnchor, constant: 15),
            checkImage.heightAnchor.constraint(equalToConstant: 22),
            checkImage.widthAnchor.constraint(equalToConstant: 22)
        ])
        
        NSLayoutConstraint.activate([
            checkView.topAnchor.constraint(equalTo: containerForCardData.bottomAnchor, constant: 12),
            checkView.leadingAnchor.constraint(equalTo: containerForInfo.leadingAnchor, constant: 15),
            checkView.heightAnchor.constraint(equalToConstant: 22),
            checkView.widthAnchor.constraint(equalToConstant: 22)
        ])
        
        NSLayoutConstraint.activate([
            payButton.topAnchor.constraint(equalTo: containerForTotalPrice.bottomAnchor, constant: 16),
            payButton.leadingAnchor.constraint(equalTo: containerForCard.leadingAnchor, constant: 48),
            payButton.heightAnchor.constraint(equalToConstant: 50),
            payButton.widthAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            containerForTotalPrice.topAnchor.constraint(equalTo: containerForInfo.bottomAnchor, constant: 20),
            containerForTotalPrice.leadingAnchor.constraint(equalTo: containerForCard.leadingAnchor, constant: 47),
            containerForTotalPrice.heightAnchor.constraint(equalToConstant: 60),
            containerForTotalPrice.widthAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            containerForCardPass.topAnchor.constraint(equalTo: containerForCardHolder.bottomAnchor, constant: 8),
            containerForCardPass.leadingAnchor.constraint(equalTo: containerForInfo.leadingAnchor, constant: 180),
            containerForCardPass.heightAnchor.constraint(equalToConstant: 50),
            containerForCardPass.widthAnchor.constraint(equalToConstant: 135)
        ])
        
        NSLayoutConstraint.activate([
            containerForCardData.topAnchor.constraint(equalTo: containerForCardHolder.bottomAnchor, constant: 8),
            containerForCardData.leadingAnchor.constraint(equalTo: containerForInfo.leadingAnchor, constant: 15),
            containerForCardData.heightAnchor.constraint(equalToConstant: 50),
            containerForCardData.widthAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            containerForCardHolder.topAnchor.constraint(equalTo: containerForCardNumber.bottomAnchor, constant: 8),
            containerForCardHolder.leadingAnchor.constraint(equalTo: containerForInfo.leadingAnchor, constant: 15),
            containerForCardHolder.heightAnchor.constraint(equalToConstant: 50),
            containerForCardHolder.widthAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            containerForCardNumber.topAnchor.constraint(equalTo: containerForInfo.topAnchor, constant: 70),
            containerForCardNumber.leadingAnchor.constraint(equalTo: containerForInfo.leadingAnchor, constant: 15),
            containerForCardNumber.heightAnchor.constraint(equalToConstant: 50),
            containerForCardNumber.widthAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            mastercardImage.topAnchor.constraint(equalTo: containerForInfo.topAnchor, constant: 12),
            mastercardImage.leadingAnchor.constraint(equalTo: containerForInfo.leadingAnchor, constant: 10),
            mastercardImage.heightAnchor.constraint(equalToConstant: 45),
            mastercardImage.widthAnchor.constraint(equalToConstant: 75)
        ])
        
        NSLayoutConstraint.activate([
            containerForInfo.topAnchor.constraint(equalTo: containerForCard.topAnchor, constant: 40),
            containerForInfo.leadingAnchor.constraint(equalTo: containerForCard.leadingAnchor, constant: 32),
            containerForInfo.widthAnchor.constraint(equalToConstant: 330),
            containerForInfo.heightAnchor.constraint(equalToConstant: 285)
        ])
        
        NSLayoutConstraint.activate([
            containerForCard.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 330),
            containerForCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            containerForCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            containerForCard.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 50),
            containerForCard.heightAnchor.constraint(equalToConstant: 550)
        ])
        
        let heightFullConstraints = carImage.heightAnchor.constraint(equalToConstant: 350)
        let widthFullConstraints = carImage.widthAnchor.constraint(equalToConstant: 350)
        
        fullSizeCarConstraints.append(heightFullConstraints)
        fullSizeCarConstraints.append(widthFullConstraints)
        
        let heightHalfConstraints = carImage.heightAnchor.constraint(equalToConstant: 150)
        let widthHalfConstraints = carImage.widthAnchor.constraint(equalToConstant: 150)
        
        halfSizeCarConstraints.append(heightHalfConstraints)
        halfSizeCarConstraints.append(widthHalfConstraints)
        
        NSLayoutConstraint.activate([
            carImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 45),
            carImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 35)
        ])
        
        activateCarPhotoConstraints(isFullSize: true)

        contentViewHeightConstraint.isActive = true
    }
    
    private func setupDelegate() {
        numberTextField.delegate = self
        holderTextField.delegate = self
        dateTextField.delegate = self
        passTextField.delegate = self
    }
    
    private func setupDefaultsFields() {
        passTextField.text = UserDefaults.standard.string(forKey: KeysDefaults.keyPass)
        dateTextField.text = UserDefaults.standard.string(forKey: KeysDefaults.keyData)
        holderTextField.text = UserDefaults.standard.string(forKey: KeysDefaults.keyHolder)
        numberTextField.text = UserDefaults.standard.string(forKey: KeysDefaults.keyNumber)
    }
    
    private func setupImageGesture() {
        checkImage.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageDidTap))
        checkImage.addGestureRecognizer(tapGesture)
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
    
    private func registerKeybordNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func removeKeyboardNotification() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func formatForCardNumber(cardNumber: String, shouldRemoveLastDigit: Bool) -> String {
        
        let range = NSString(string: cardNumber).range(of: cardNumber)
        var number = regex.stringByReplacingMatches(in: cardNumber, options: [], range: range, withTemplate: "")
        
        if number.count > maxCardCount {
            let maxIndex = number.index(number.startIndex, offsetBy: maxCardCount)
            number = String(number[number.startIndex..<maxIndex])
        }
        
        if shouldRemoveLastDigit {
            let maxIndex = number.index(number.startIndex, offsetBy: number.count - 1)
            number = String(number[number.startIndex..<maxIndex])
        }
        
        let maxIndex = number.index(number.startIndex, offsetBy: number.count)
        let regRange = number.startIndex..<maxIndex
        
        if number.count < 10 {
            let pattern = "(\\d{4})(\\d{4})(\\d+)"
            number = number.replacingOccurrences(of: pattern, with: "$1-$2-$3", options: .regularExpression, range: regRange)
        } else {
            let pattern = "(\\d{4})(\\d{4})(\\d{4})(\\d{4})"
            number = number.replacingOccurrences(of: pattern, with: "$1-$2-$3-$4", options: .regularExpression, range: regRange)
        }
        
        return number
    }
    
    private func formatForHolder(personalData: String, shouldRemoveLastDigit: Bool) -> String {

        let range = NSString(string: personalData).range(of: personalData)
        var number = regex.stringByReplacingMatches(in: personalData, options: [], range: range, withTemplate: "")
        
        if shouldRemoveLastDigit {
            let maxIndex = number.index(number.startIndex, offsetBy: number.count - 1)
            number = String(number[number.startIndex..<maxIndex])
        }
        
        return number.uppercased()
    }
    
    private func formatForDate(dateData: String, shouldRemoveLastDigit: Bool) -> String {
        
        let range = NSString(string: dateData).range(of: dateData)
        var number = regex.stringByReplacingMatches(in: dateData, options: [], range: range, withTemplate: "")
        
        if number.count > maxDateCard {
            let maxIndex = number.index(number.startIndex, offsetBy: maxDateCard)
            number = String(number[number.startIndex..<maxIndex])
        }
        
        if shouldRemoveLastDigit {
            let maxIndex = number.index(number.startIndex, offsetBy: number.count - 1)
            number = String(number[number.startIndex..<maxIndex])
        }
        
        let maxIndex = number.index(number.startIndex, offsetBy: number.count)
        let regRange = number.startIndex..<maxIndex
        
        if number.count < 4 {
            let pattern = "(\\d{2})(\\d+)"
            number = number.replacingOccurrences(of: pattern, with: "$1/$2", options: .regularExpression, range: regRange)
        } else {
            let pattern = "(\\d{2})(\\d{2})"
            number = number.replacingOccurrences(of: pattern, with: "$1/$2", options: .regularExpression, range: regRange)
        }
        
        return number
    }
    
    private func formatForPass(pass: String, shouldRemoveLastDigit: Bool) -> String {
        
        let range = NSString(string: pass).range(of: pass)
        var number = regex.stringByReplacingMatches(in: pass, options: [], range: range, withTemplate: "")
        
        if number.count > maxPassCard {
            let maxIndex = number.index(number.startIndex, offsetBy: maxPassCard)
            number = String(number[number.startIndex..<maxIndex])
        }
        
        if shouldRemoveLastDigit {
            let maxIndex = number.index(number.startIndex, offsetBy: number.count - 1)
            number = String(number[number.startIndex..<maxIndex])
        }
        
        return number
    }
    
    @objc private func keyboardWillShow(notification: Notification) {
        guard
            let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
            let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double,
            let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt
        else {
            return
        }

        if !keyboardIsVisible {
            keyboardIsVisible = !keyboardIsVisible
            contentViewHeightConstraint.constant += keyboardHeight.height / 2
            UIView.animate(withDuration: duration, delay: .zero, options: UIView.AnimationOptions(rawValue: curve), animations: { self.layoutIfNeeded() }, completion: nil)
        }
    }
    
    @objc private func keyboardWillHide(notification: Notification) {
        guard
            let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
            let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double,
            let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt
        else {
            return
        }
        
        if keyboardIsVisible {
            keyboardIsVisible = !keyboardIsVisible
            contentViewHeightConstraint.constant -= keyboardHeight.height / 2
            UIView.animate(withDuration: duration, delay: .zero, options: UIView.AnimationOptions(rawValue: curve), animations: { self.layoutIfNeeded() }, completion: nil)
        }
    }
    
    @objc private func payButtonDidTap(_ sender: UIButton) {
        delegatePayment?.payButtonTapped(payButton, historyDataProvider: historyDataProvider)
    }

    
    @objc private func imageDidTap(_ gesture: UITapGestureRecognizer) {
        isCompleted.toggle()
    }
    
    @objc private func carDidTap(_ gesture: UITapGestureRecognizer) {
        isFullSizeCar.toggle()
        activateCarPhotoConstraints(isFullSize: isFullSizeCar)
    }
    
}

extension PaymentUIView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let fullString = (textField.text ?? "") + string
        
        if textField == numberTextField {
            numberTextField.text = formatForCardNumber(cardNumber: fullString, shouldRemoveLastDigit: range.length == 1)
        } else if textField == holderTextField {
            holderTextField.text = formatForHolder(personalData: fullString, shouldRemoveLastDigit: range.length == 1)
        } else if textField == dateTextField {
            dateTextField.text = formatForDate(dateData: fullString, shouldRemoveLastDigit: range.length == 1)
        } else {
            passTextField.text = formatForPass(pass: fullString, shouldRemoveLastDigit: range.length == 1)
        }

        return false
    }
    
}
