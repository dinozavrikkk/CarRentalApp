
import UIKit

final class LoginViewController: UIViewController {
    
    private let loginView = LoginUIView()
    private let dataProvider: CarsDataProvider
    private let rentalModel: DataModelExample
    private let historyDataProvider: HistoryDataProvider
    private let service: ServiceProtocol
    private let userDefault = UserDefaults.standard
    
    init(dataProvider: CarsDataProvider, rentalModel: DataModelExample, historyDataProvider: HistoryDataProvider, service: ServiceProtocol = Service.shared) {
        self.dataProvider = dataProvider
        self.rentalModel = rentalModel
        self.historyDataProvider = historyDataProvider
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.delegateWelcome = self
        loginView.addTapGestureToHideKeyboard()
    }

    deinit {
        loginView.removeKeyboardNotification()
    }
    
}

//MARK: Extension LoginScreenDelegate
extension LoginViewController: LoginScreenDelegate {
    
    func signInButtonTapped(_ sender: UIButton) {
        present(RegistrationViewController(), animated: true)
    }
    
    func signUpButtonTapped(_ sender: UIButton, _ emailField: UITextField, _ passField: UITextField) {
        if !emailField.text!.isEmpty && !passField.text!.isEmpty {
            let authData = RegisterField(email: emailField.text!, password: passField.text!)
            
            service.authInApp(authData) { [weak self] response in
                switch response {
                case .success:
                    let startAppFactory = StartAppFactory()
                    self?.userDefault.setValue(true, forKey: "isLogin")
                    self?.navigationController?.pushViewController(startAppFactory.startApp(), animated: true)
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
