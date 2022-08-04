
import UIKit

final class LoginUIView: UIView {
      
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
    
    private lazy var signUpLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1)
        label.font = .boldSystemFont(ofSize: 24)
        label.text = "Sign up to join"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
       let conteiner = UIView()
        conteiner.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        conteiner.layer.cornerRadius = 20
        conteiner.layer.borderWidth = 1
        conteiner.layer.borderColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1).cgColor
        conteiner.translatesAutoresizingMaskIntoConstraints = false
        return conteiner
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
        field.placeholder = "Email Address"
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
        field.placeholder = "Password"
//        field.isSecureTextEntry = true
        field.returnKeyType = .done
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.976, green: 0.706, blue: 0.004, alpha: 1)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0.976, green: 0.706, blue: 0.004, alpha: 1).cgColor
        button.setTitle("Sign up", for: .normal)
        button.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.addTarget(self, action: #selector(signButtonDidTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var haveAccLabel: UILabel = {
       let label = UILabel()
        label.textColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1)
        label.text = "Have an account?"
        label.font = .systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var signInButton: UIButton = {
       let button = UIButton()
        button.setTitle("Sign in", for: .normal)
        button.setTitleColor(UIColor(red: 0.976, green: 0.706, blue: 0.004, alpha: 1), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.addTarget(self, action: #selector(signInButtonDidTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var contentView: UIView = {
       let contentView = UIView()
        contentView.backgroundColor = .white
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private lazy var contentViewHeightConstraint = contentView.heightAnchor.constraint(equalTo: self.heightAnchor)
    
    weak var delegateWelcome: LoginScreenDelegate?
    private var keyboardIsVisible = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        addSubview(contentView)
        addSubviewsToContentView()
        setupConstraints()
        setupDelegate()
        registerKeybordNotification()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviewsToContentView() {
        [ellipse, whiteCar, conteinerView, signUpLabel, conteinerForEmail, conteinerForPassword, emailImage, emailTextField, passwordImage, passwordTextField, signUpButton, haveAccLabel, signInButton].forEach{ subview in contentView.addSubview(subview) }
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            contentView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            contentView.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalTo: haveAccLabel.bottomAnchor, constant: 5),
            signInButton.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: 140),
            signInButton.heightAnchor.constraint(equalToConstant: 18)
        ])
        
        NSLayoutConstraint.activate([
            haveAccLabel.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 55),
            haveAccLabel.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: 105),
            haveAccLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
        
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: conteinerView.topAnchor, constant: 250),
            signUpButton.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: 24),
            signUpButton.trailingAnchor.constraint(equalTo: conteinerView.trailingAnchor, constant: -24),
            signUpButton.heightAnchor.constraint(equalToConstant: 45),
            signUpButton.widthAnchor.constraint(equalToConstant: 315)
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
            ellipse.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -99),
            ellipse.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -100),
            ellipse.heightAnchor.constraint(equalToConstant: 600),
            ellipse.widthAnchor.constraint(equalToConstant: 600)
        ])
        
        NSLayoutConstraint.activate([
            whiteCar.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 42),
            whiteCar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40)
        ])
        
        NSLayoutConstraint.activate([
            conteinerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 361),
            conteinerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 33),
            conteinerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            conteinerView.heightAnchor.constraint(equalToConstant: 442),
            conteinerView.widthAnchor.constraint(equalToConstant: 363)
        ])
        
        NSLayoutConstraint.activate([
            conteinerForPassword.topAnchor.constraint(equalTo: conteinerView.topAnchor, constant: 175),
            conteinerForPassword.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: 24),
            conteinerForPassword.trailingAnchor.constraint(equalTo: conteinerView.trailingAnchor, constant: -24),
            conteinerForPassword.heightAnchor.constraint(equalToConstant: 45),
            conteinerForPassword.widthAnchor.constraint(equalToConstant: 315)
        ])
        
        NSLayoutConstraint.activate([
            conteinerForEmail.topAnchor.constraint(equalTo: conteinerView.topAnchor, constant: 111),
            conteinerForEmail.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: 24),
            conteinerForEmail.trailingAnchor.constraint(equalTo: conteinerView.trailingAnchor, constant: -24),
            conteinerForEmail.heightAnchor.constraint(equalToConstant: 45),
            conteinerForEmail.widthAnchor.constraint(equalToConstant: 315)
        ])
        
        NSLayoutConstraint.activate([
            signUpLabel.topAnchor.constraint(equalTo: conteinerView.topAnchor, constant: 34),
            signUpLabel.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: 90),
            signUpLabel.heightAnchor.constraint(equalToConstant: 36)
        ])

        contentViewHeightConstraint.isActive = true
    }
    
    private func setupDelegate() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
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

    @objc private func signButtonDidTap(_ sender: UIButton) {
        delegateWelcome?.signUpButtonTapped(signUpButton, emailTextField, passwordTextField)
    }
    
    @objc private func signInButtonDidTap(_ sender: UIButton) {
        delegateWelcome?.signInButtonTapped(signInButton)
    }

}

//MARK: UITextFieldDelegate
extension LoginUIView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
