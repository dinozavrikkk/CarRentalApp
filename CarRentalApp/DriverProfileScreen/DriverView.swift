
import Foundation
import UIKit

final class DriverView: UIView {
    
    private(set) lazy var userImage: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "emptyPhoto")
        image.clipsToBounds = true
        image.layer.cornerRadius = 75
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var editPhotoButton: UIButton = {
        let button = UIButton()
        button.alpha = 0.5
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitle("Edit photo", for: .normal)
        button.addTarget(self, action: #selector(editPhotoButtonDidTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
         return button
    }()
    
    private let containerForName: UIView = {
      let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1).cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let containerForSurname: UIView = {
      let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1).cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let containerForNumber: UIView = {
      let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1).cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var nameTextField: UITextField = {
       let field = UITextField()
        field.textColor = .black
        field.font = .systemFont(ofSize: 14)
        field.placeholder = "Enter your name"
        field.returnKeyType = .done
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private(set) lazy var surnameTextField: UITextField = {
       let field = UITextField()
        field.textColor = .black
        field.font = .systemFont(ofSize: 14)
        field.placeholder = "Enter your surname"
        field.returnKeyType = .done
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private(set) lazy var numberTextField: UITextField = {
       let field = UITextField()
        field.textColor = .black
        field.font = .systemFont(ofSize: 14)
        field.placeholder = "Enter your number"
        field.returnKeyType = .done
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private lazy var saveChangesButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.976, green: 0.706, blue: 0.004, alpha: 1)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0.976, green: 0.706, blue: 0.004, alpha: 1).cgColor
        button.setTitle("Save changes", for: .normal)
        button.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.addTarget(self, action: #selector(saveChangesButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let contentView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    weak var delegateSave: InfoAboutDriverDelegate?
    private let driverDatabase = DriverDatabaseStorage()
    private lazy var contentViewHeightConstraint = contentView.heightAnchor.constraint(equalTo: self.heightAnchor)
    private var keyboardIsVisible = false
    private let maxNumberCount = 11
    private let regex = try! NSRegularExpression(pattern: "[\\+\\s-\\(\\)]", options: .caseInsensitive)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        addSubview(contentView)
        addSubviews()
        setupConstraints()
        setupDelegate()
        updateTextFields()
        registerKeybordNotification()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        [userImage, editPhotoButton, containerForName, containerForSurname, containerForNumber, nameTextField, surnameTextField, numberTextField, saveChangesButton].forEach{ subview in contentView.addSubview(subview) }
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            editPhotoButton.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 5),
            editPhotoButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])

        NSLayoutConstraint.activate([
            userImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 134),
            userImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            userImage.heightAnchor.constraint(equalToConstant: 150),
            userImage.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        NSLayoutConstraint.activate([
            containerForName.topAnchor.constraint(equalTo: editPhotoButton.bottomAnchor, constant: 60),
            containerForName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            containerForName.heightAnchor.constraint(equalToConstant: 45),
            containerForName.widthAnchor.constraint(equalToConstant: 315)
        ])
        
        NSLayoutConstraint.activate([
            containerForSurname.topAnchor.constraint(equalTo: containerForName.bottomAnchor, constant: 30),
            containerForSurname.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            containerForSurname.heightAnchor.constraint(equalToConstant: 45),
            containerForSurname.widthAnchor.constraint(equalToConstant: 315)
        ])
        
        NSLayoutConstraint.activate([
            containerForNumber.topAnchor.constraint(equalTo: containerForSurname.bottomAnchor, constant: 30),
            containerForNumber.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            containerForNumber.heightAnchor.constraint(equalToConstant: 45),
            containerForNumber.widthAnchor.constraint(equalToConstant: 315)
        ])
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: containerForName.topAnchor, constant: 14),
            nameTextField.leadingAnchor.constraint(equalTo: containerForName.leadingAnchor, constant: 60),
            nameTextField.trailingAnchor.constraint(equalTo: containerForName.trailingAnchor, constant: -24),
            nameTextField.heightAnchor.constraint(equalToConstant: 18)
        ])
        
        NSLayoutConstraint.activate([
            surnameTextField.topAnchor.constraint(equalTo: containerForSurname.topAnchor, constant: 14),
            surnameTextField.leadingAnchor.constraint(equalTo: containerForSurname.leadingAnchor, constant: 60),
            surnameTextField.trailingAnchor.constraint(equalTo: containerForSurname.trailingAnchor, constant: -24),
            surnameTextField.heightAnchor.constraint(equalToConstant: 18)
        ])
        
        NSLayoutConstraint.activate([
            numberTextField.topAnchor.constraint(equalTo: containerForNumber.topAnchor, constant: 14),
            numberTextField.leadingAnchor.constraint(equalTo: containerForNumber.leadingAnchor, constant: 60),
            numberTextField.trailingAnchor.constraint(equalTo: containerForNumber.trailingAnchor, constant: -24),
            numberTextField.heightAnchor.constraint(equalToConstant: 18)
        ])
        
        NSLayoutConstraint.activate([
            saveChangesButton.topAnchor.constraint(equalTo: containerForNumber.bottomAnchor, constant: 60),
            saveChangesButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 70),
            saveChangesButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -70),
            saveChangesButton.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        NSLayoutConstraint.activate([
            contentView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            contentView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])
        
        contentViewHeightConstraint.isActive = true
    }
    
    private func setupDelegate() {
        nameTextField.delegate = self
        surnameTextField.delegate = self
        numberTextField.delegate = self
    }
    
    private func format(phoneNumber: String, shouldRemoveLastDigit: Bool) -> String {
        
        guard !(shouldRemoveLastDigit && phoneNumber.count <= 2) else { return "+" }
        
        let range = NSString(string: phoneNumber).range(of: phoneNumber)
        var number = regex.stringByReplacingMatches(in: phoneNumber, options: [], range: range, withTemplate: "")
        
        if number.count > maxNumberCount {
            let maxIndex = number.index(number.startIndex, offsetBy: maxNumberCount)
            number = String(number[number.startIndex..<maxIndex])
        }
        
        if shouldRemoveLastDigit {
            let maxIndex = number.index(number.startIndex, offsetBy: number.count - 1)
            number = String(number[number.startIndex..<maxIndex])
        }
        
        let maxIndex = number.index(number.startIndex, offsetBy: number.count)
        let regRange = number.startIndex..<maxIndex
        
        if number.count < 7 {
            let pattern = "(\\d)(\\d{3})(\\d+)"
            number = number.replacingOccurrences(of: pattern, with: "$1 ($2) $3", options: .regularExpression, range: regRange)
        } else {
            let pattern = "(\\d)(\\d{3})(\\d{3})(\\d{2})(\\d+)"
            number = number.replacingOccurrences(of: pattern, with: "$1 ($2) $3-$4-$5", options: .regularExpression, range: regRange)
        }
        
        return "+" + number
    }
    
    private func formatData(personalData: String, shouldRemoveLastDigit: Bool) -> String {

        let range = NSString(string: personalData).range(of: personalData)
        var number = regex.stringByReplacingMatches(in: personalData, options: [], range: range, withTemplate: "")
        
        if shouldRemoveLastDigit {
            let maxIndex = number.index(number.startIndex, offsetBy: number.count - 1)
            number = String(number[number.startIndex..<maxIndex])
        }
        
        return number
    }
    
    func updateTextFields() {
        driverDatabase.fetchDriverModel { [weak self] result in
            switch result {
            case .success(let driverModel):
                self?.nameTextField.text = driverModel.name
                self?.surnameTextField.text = driverModel.surname
                self?.numberTextField.text = driverModel.number
                guard let savedImage = UIImage(data: (driverModel.image ?? UIImage(named: "emptyPhoto")?.pngData())!) else { return }
                self?.userImage.image = savedImage
            case .failure: print("Warning, database don't have any models")
            }
        }
    }
    
    private func registerKeybordNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func removeKeyboardNotification() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
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
            keyboardIsVisible.toggle()
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
            keyboardIsVisible.toggle()
            contentViewHeightConstraint.constant -= keyboardHeight.height / 2
            UIView.animate(withDuration: duration, delay: .zero, options: UIView.AnimationOptions(rawValue: curve), animations: { self.layoutIfNeeded() }, completion: nil)
        }
    }
    
    @objc func editPhotoButtonDidTap() {
        delegateSave?.editPhotoDidTap()
    }
    
    @objc func saveChangesButtonTapped() {
        delegateSave?.saveChangesDidTap()
    }
    
}


//MARK: UITextFieldDelegate
extension DriverView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let fullString = (textField.text ?? "") + string
    
        if textField == numberTextField {
            numberTextField.text = format(phoneNumber: fullString, shouldRemoveLastDigit: range.length == 1)
        } else if textField == nameTextField {
            nameTextField.text = formatData(personalData: fullString, shouldRemoveLastDigit: range.length == 1)
        } else {
            surnameTextField.text = formatData(personalData: fullString, shouldRemoveLastDigit: range.length == 1)
        }
        return false
    }
    
}
