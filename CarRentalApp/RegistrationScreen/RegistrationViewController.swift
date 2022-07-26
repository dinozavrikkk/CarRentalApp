//
//  RegistrationViewController.swift
//  CarRentalApp
//
//  Created by admin on 10.05.2022.
//

import UIKit

final class RegistrationViewController: UIViewController {

    private let registration = RegistrationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view = registration
        registration.delegateRegistration = self
        
    }
    
    deinit {
        registration.removeKeyboardNotification()
    }
    
}

extension RegistrationViewController: RegistrationProtocol {
    
    func signInButtonTapped(_ sender: UIButton, nickLabel: UILabel, emailLabel: UILabel, passLabel: UILabel, passField: UITextField, emailField: UITextField) {
        
        if nickLabel.textColor == .green && emailLabel.textColor == .green && passLabel.textColor == .green {
            
            Service.shared.createNewUser(data: RegisterField(email: emailField.text!, password: passField.text!)) { code in
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
