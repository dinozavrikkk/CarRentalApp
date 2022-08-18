
import UIKit

final class RegistrationViewController: UIViewController {

    private let registration = RegistrationView()
    private let service: ServiceProtocol
    
    init(service: ServiceProtocol = Service.shared) {
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = registration
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registration.delegateRegistration = self
        registration.addTapGestureToHideKeyboard()
    }
    
    deinit {
        registration.removeKeyboardNotification()
    }
    
}

//MARK: RegistrationDelegate
extension RegistrationViewController: RegistrationDelegate {
    
    func signInButtonTapped(_ sender: UIButton, nickLabel: UILabel, emailLabel: UILabel, passLabel: UILabel, passField: UITextField, emailField: UITextField) {
        
        if nickLabel.textColor == .green && emailLabel.textColor == .green && passLabel.textColor == .green {
            
            service.createNewUser(data: RegisterField(email: emailField.text!, password: passField.text!)) { code in
                switch code.code {
                case 0: print("warning register")
                case 1: Alerts.getSignInDoneAlert {
                    self.dismiss(animated: true)
                }
                default: print("warning")
                }
            }
        } else {
            Alerts.getSignInErrorFieldsAlert()
        }
        
    }
    
}
