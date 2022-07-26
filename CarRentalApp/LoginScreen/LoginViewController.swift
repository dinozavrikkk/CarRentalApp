
import UIKit

class LoginViewController: UIViewController {
    
    private let loginView = LoginUIView()
    private let dataProvider: CarsDataProvider
    private let rentalModel: DataModelExample
    private let historyDataProvider: HistoryDataProvider
    private let userDefault = UserDefaults.standard
    
    init(dataProvider: CarsDataProvider, rentalModel: DataModelExample, historyDataProvider: HistoryDataProvider) {
        self.dataProvider = dataProvider
        self.rentalModel = rentalModel
        self.historyDataProvider = historyDataProvider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = loginView
        loginView.delegateWelcome = self
    }

    deinit {
        loginView.removeKeyboardNotification()
    }
    
}

extension LoginViewController: LoginScreenProtocol {
    
    func signInButtonTapped(_ sender: UIButton) {
        present(RegistrationViewController(), animated: true)
    }
    
    func signUpButtonTapped(_ sender: UIButton, _ emailField: UITextField, _ passField: UITextField) {
        if !emailField.text!.isEmpty && !passField.text!.isEmpty {
            let authData = RegisterField(email: emailField.text!, password: passField.text!)
            
            Service.shared.authInApp(authData) { [weak self] response in
                switch response {
                case .success:
                    let factory = Factory()
                    self?.userDefault.setValue(true, forKey: "isLogin")
                    self?.navigationController?.pushViewController(factory.startApp(), animated: true)
                    self?.navigationController?.viewControllers.remove(at: .zero)
                case .error:
                    Alerts.getSignUpErrorAlert()
                }
            }
        } else {
            Alerts.getSignUpErrorFieldsAlert()
        }
    }
    
}
