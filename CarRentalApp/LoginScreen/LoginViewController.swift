
import UIKit

class LoginViewController: UIViewController {
    
    private let loginView = LoginUIView()
    private let dataProvider: CarsDataProvider
    private let rentalModel: DataModelExample
    private let historyDataProvider: HistoryDataProvider
    private var service = Service.shared
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
            
            service.authInApp(authData) { [weak self] responce in
                switch responce {
                case .success:
                    let homeVC = HomeScreenViewController(dataProvider: self!.dataProvider, rentalModel: self!.rentalModel, historyDataProvider: self!.historyDataProvider)
                    let recentVC = RecentHistoryViewController(dataProviderHistory: self!.historyDataProvider)
                    let mapVC = MapViewController()
                    let driverVC = DriverProfileViewController()
                    let tabBarVC = UITabBarController()
                    tabBarVC.viewControllers = [homeVC, recentVC, mapVC, driverVC]
                    
                    tabBarVC.tabBar.tintColor = UIColor(red: 0.976, green: 0.706, blue: 0.004, alpha: 1)
                    guard let items = tabBarVC.tabBar.items else {
                        return
                    }
                    
                    let images = ["square.grid.2x2.fill", "bell.fill", "mappin.circle.fill", "gearshape.fill"]
                    
                    for element in 0..<items.count {
                        items[element].image = UIImage(systemName: images[element])
                    }
                    
                    self?.userDefault.setValue(true, forKey: "isLogin")
                    self?.navigationController?.pushViewController(tabBarVC, animated: true)
                    self?.navigationController?.viewControllers.remove(at: .zero)
                case .error:
                    let alert = UIAlertController(title: nil, message: "Error, check the entered data", preferredStyle: .alert)
                    let registrationErrorButton = UIAlertAction(title: "Back", style: .default)
                    alert.addAction(registrationErrorButton)
                    self?.present(alert, animated: true)
                }
            }
        } else {
            let alert = UIAlertController(title: nil, message: "Error, fill in the input field", preferredStyle: .alert)
            let registrationErrorButton = UIAlertAction(title: "Back", style: .default)
            alert.addAction(registrationErrorButton)
            present(alert, animated: true)
        }
    }
    
}
