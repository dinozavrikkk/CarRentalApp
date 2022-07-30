
import UIKit

final class RegistrationView: UIView {
    
    private lazy var signInLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1)
        label.font = .boldSystemFont(ofSize: 24)
        label.text = "Sign in to join"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var ellipse: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        view.layer.cornerRadius = 300
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var whiteCar: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "whiteCar")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var conteinerView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.layer.cornerRadius = 10
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 1)
        view.layer.shadowRadius = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var conteinerForEmail: UIView = {
      let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1).cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var conteinerForPassword: UIView = {
      let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1).cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var conteinerForNickname: UIView = {
      let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1).cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var emailImage: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "pochta")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var emailTextField: UITextField = {
       let field = UITextField()
        field.textColor = .black
        field.font = .systemFont(ofSize: 14)
        field.placeholder = "Write your email Address"
        field.returnKeyType = .done
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private lazy var passwordImage: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "password")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var passwordTextField: UITextField = {
       let field = UITextField()
        field.textColor = .black
        field.font = .systemFont(ofSize: 14)
        field.placeholder = "Write your password"
        field.isSecureTextEntry = true
        field.returnKeyType = .done
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private lazy var nicknameTextField: UITextField = {
       let field = UITextField()
        field.textColor = .black
        field.font = .systemFont(ofSize: 14)
        field.placeholder = "Write your nickname"
        field.returnKeyType = .done
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private lazy var signInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.976, green: 0.706, blue: 0.004, alpha: 1)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0.976, green: 0.706, blue: 0.004, alpha: 1).cgColor
        button.setTitle("Sign in", for: .normal)
        button.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.addTarget(self, action: #selector(signInButtonDidTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let requiredNicknameLabel: UILabel = {
       let label = UILabel()
        label.text = "Required field"
        label.textColor = .black
        label.font = .systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let requiredEmailLabel: UILabel = {
       let label = UILabel()
        label.text = "Required field"
        label.textColor = .black
        label.font = .systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let requiredPasswordLabel: UILabel = {
       let label = UILabel()
        label.text = "Required field"
        label.textColor = .black
        label.font = .systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var scrollView: UIScrollView = {
       let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private let contentView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    weak var delegateRegistration: RegistrationDelegate?
    
    private let nicknameValidType: String.ValidTypes = .nickname
    private let emailValidType: String.ValidTypes = .email
    private let passwordValidType: String.ValidTypes = .password
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        addSubviewsToContentView()
        setupConstraints()
        setupDelegate()
        registerKeybordNotification()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviewsToContentView() {
        [ellipse, whiteCar, conteinerView, signInLabel, conteinerForNickname, conteinerForEmail, conteinerForPassword, emailImage, emailTextField, passwordImage, passwordTextField, nicknameTextField, signInButton, requiredNicknameLabel, requiredEmailLabel, requiredPasswordLabel].forEach{ subview in contentView.addSubview(subview) }
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            requiredPasswordLabel.topAnchor.constraint(equalTo: conteinerForPassword.bottomAnchor, constant: 10),
            requiredPasswordLabel.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: 24),
            requiredPasswordLabel.trailingAnchor.constraint(equalTo: conteinerView.trailingAnchor, constant: -24)
        ])
        
        NSLayoutConstraint.activate([
            requiredEmailLabel.topAnchor.constraint(equalTo: conteinerForEmail.bottomAnchor, constant: 10),
            requiredEmailLabel.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: 24),
            requiredEmailLabel.trailingAnchor.constraint(equalTo: conteinerView.trailingAnchor, constant: -24)
        ])
        
        NSLayoutConstraint.activate([
            requiredNicknameLabel.topAnchor.constraint(equalTo: conteinerForNickname.bottomAnchor, constant: 10),
            requiredNicknameLabel.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: 24),
            requiredNicknameLabel.trailingAnchor.constraint(equalTo: conteinerView.trailingAnchor, constant: -24)
        ])
        
        NSLayoutConstraint.activate([
            signInLabel.topAnchor.constraint(equalTo: conteinerView.topAnchor, constant: 20),
            signInLabel.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: 90),
            signInLabel.heightAnchor.constraint(equalToConstant: 36)
        ])
        
        NSLayoutConstraint.activate([
            whiteCar.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            whiteCar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25)
        ])
        
        NSLayoutConstraint.activate([
            ellipse.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -200),
            ellipse.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -100),
            ellipse.heightAnchor.constraint(equalToConstant: 600),
            ellipse.widthAnchor.constraint(equalToConstant: 600)
        ])
        
        NSLayoutConstraint.activate([
            conteinerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 270),
            conteinerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 33),
            conteinerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            conteinerView.heightAnchor.constraint(equalToConstant: 442),
            conteinerView.widthAnchor.constraint(equalToConstant: 363)
        ])
        
        NSLayoutConstraint.activate([
            conteinerForPassword.topAnchor.constraint(equalTo: conteinerView.topAnchor, constant: 270),
            conteinerForPassword.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: 24),
            conteinerForPassword.trailingAnchor.constraint(equalTo: conteinerView.trailingAnchor, constant: -24),
            conteinerForPassword.heightAnchor.constraint(equalToConstant: 45),
            conteinerForPassword.widthAnchor.constraint(equalToConstant: 315)
        ])
        
        NSLayoutConstraint.activate([
            conteinerForEmail.topAnchor.constraint(equalTo: conteinerView.topAnchor, constant: 175),
            conteinerForEmail.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: 24),
            conteinerForEmail.trailingAnchor.constraint(equalTo: conteinerView.trailingAnchor, constant: -24),
            conteinerForEmail.heightAnchor.constraint(equalToConstant: 45),
            conteinerForEmail.widthAnchor.constraint(equalToConstant: 315)
        ])
        
        NSLayoutConstraint.activate([
            conteinerForNickname.topAnchor.constraint(equalTo: conteinerView.topAnchor, constant: 80),
            conteinerForNickname.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: 24),
            conteinerForNickname.trailingAnchor.constraint(equalTo: conteinerView.trailingAnchor, constant: -24),
            conteinerForNickname.heightAnchor.constraint(equalToConstant: 45),
            conteinerForNickname.widthAnchor.constraint(equalToConstant: 315)
        ])
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: conteinerForPassword.topAnchor, constant: 14),
            passwordTextField.leadingAnchor.constraint(equalTo: conteinerForPassword.leadingAnchor, constant: 60),
            passwordTextField.trailingAnchor.constraint(equalTo: conteinerForPassword.trailingAnchor, constant: -24),
            passwordTextField.heightAnchor.constraint(equalToConstant: 18)
        ])
        
        NSLayoutConstraint.activate([
            passwordImage.topAnchor.constraint(equalTo: conteinerForPassword.topAnchor, constant: 11),
            passwordImage.leadingAnchor.constraint(equalTo: conteinerForPassword.leadingAnchor, constant: 23)
        ])
        
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: conteinerForEmail.topAnchor, constant: 14),
            emailTextField.leadingAnchor.constraint(equalTo: conteinerForEmail.leadingAnchor, constant: 60),
            emailTextField.trailingAnchor.constraint(equalTo: conteinerForEmail.trailingAnchor, constant: -24),
            emailTextField.heightAnchor.constraint(equalToConstant: 18)
        ])
        
        NSLayoutConstraint.activate([
            emailImage.topAnchor.constraint(equalTo: conteinerForEmail.topAnchor, constant: 11),
            emailImage.leadingAnchor.constraint(equalTo: conteinerForEmail.leadingAnchor, constant: 23),
        ])
        
        NSLayoutConstraint.activate([
            nicknameTextField.topAnchor.constraint(equalTo: conteinerForNickname.topAnchor, constant: 14),
            nicknameTextField.leadingAnchor.constraint(equalTo: conteinerForNickname.leadingAnchor, constant: 20),
            nicknameTextField.trailingAnchor.constraint(equalTo: conteinerForNickname.trailingAnchor, constant: -24),
            nicknameTextField.heightAnchor.constraint(equalToConstant: 18)
        ])
        
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalTo: conteinerView.topAnchor, constant: 370),
            signInButton.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: 24),
            signInButton.trailingAnchor.constraint(equalTo: conteinerView.trailingAnchor, constant: -24),
            signInButton.heightAnchor.constraint(equalToConstant: 45),
            signInButton.widthAnchor.constraint(equalToConstant: 315)
        ])

    }
    
    private func setupDelegate() {
        nicknameTextField.delegate = self
        passwordTextField.delegate = self
        emailTextField.delegate = self
    }
    
    private func setTextField(textField: UITextField, label: UILabel, validType: String.ValidTypes, validMessage: String, wrongMessage: String, string: String, range: NSRange) {
        
        let text = (textField.text ?? "") + string
        let result: String
        
        if range.length == 1 {
            let end = text.index(text.startIndex, offsetBy: text.count - 1)
            result = String(text[text.startIndex..<end])
        } else {
            result = text
        }
        
        textField.text = result
        if result.isValid(validType: validType) {
            label.text = validMessage
            label.textColor = .green
        } else {
            label.text = wrongMessage
            label.textColor = .red
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
        let userInfo = notification.userInfo
        let keyboardHeight = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        scrollView.contentOffset = CGPoint(x: 0, y: keyboardHeight.height / 2)
    }
    
    @objc private func keyboardWillHide(notification: Notification) {
        scrollView.contentOffset = CGPoint.zero
    }
    
    @objc private func signInButtonDidTap(_ sender: UIButton) {
        delegateRegistration?.signInButtonTapped(signInButton, nickLabel: requiredNicknameLabel, emailLabel: requiredEmailLabel, passLabel: requiredPasswordLabel, passField: passwordTextField, emailField: emailTextField)
    }
    
}

//MARK: UITextFieldDelegate
extension RegistrationView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField {
        case nicknameTextField: setTextField(textField: nicknameTextField,
                                             label: requiredNicknameLabel,
                                             validType: nicknameValidType,
                                             validMessage: "Nickname is valid",
                                             wrongMessage: "Only A-Z characters, max 8 characters",
                                             string: string,
                                             range: range)
        case emailTextField: setTextField(textField: emailTextField,
                                             label: requiredEmailLabel,
                                             validType: emailValidType,
                                             validMessage: "Email is valid",
                                             wrongMessage: "Email is not valid",
                                             string: string,
                                             range: range)
        case passwordTextField: setTextField(textField: passwordTextField,
                                             label: requiredPasswordLabel,
                                             validType: passwordValidType,
                                             validMessage: "Password is valid",
                                             wrongMessage: "Password is not valid, min 6 characters",
                                             string: string,
                                             range: range)
        default: break
        }
        
        return false
    }
    
}
