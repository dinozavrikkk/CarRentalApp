//
//  RegistrationViewController.swift
//  CarRentalApp
//
//  Created by admin on 10.05.2022.
//

import UIKit

class RegistrationViewController: UIViewController {

    private let registration = RegistrationView()
    private let service = Service.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registration.delegateRegistration = self
        view = registration
        
    }
    
    deinit {
        registration.removeKeyboardNotification()
    }
    
}

extension RegistrationViewController: RegistrationProtocol {
    func signInButtonTapped(_ sender: UIButton, nickLabel: UILabel, emailLabel: UILabel, passLabel: UILabel, passField: UITextField, emailField: UITextField) {
        if nickLabel.textColor == .green && emailLabel.textColor == .green && passLabel.textColor == .green {
            service.createNewUser(data: RegisterField(email: emailField.text!, password: passField.text!)) { code in
                switch code.code {
                case 0: print("warning register")
                case 1:
                    let alert = UIAlertController(title: nil, message: "Succesfully  Done", preferredStyle: .alert)
                    let backButton = UIAlertAction(title: "Back", style: .default) { _ in
                        self.dismiss(animated: true)
                    }
                    alert.addAction(backButton)
                    self.present(alert, animated: true)
                default: print("warning")
                }
            }
        } else {
            let alert = UIAlertController(title: nil, message: "Registration error, check the required fields", preferredStyle: .alert)
            let registrationErrorButton = UIAlertAction(title: "Back", style: .default)
            alert.addAction(registrationErrorButton)
            self.present(alert, animated: true)
        }
    }
    
}
