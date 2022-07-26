
import Foundation
import UIKit

protocol RegistrationProtocol: AnyObject {
    
    func signInButtonTapped(_ sender: UIButton, nickLabel: UILabel, emailLabel: UILabel, passLabel: UILabel, passField: UITextField, emailField: UITextField)
    
}
