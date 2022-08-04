
import Foundation
import UIKit

protocol RegistrationDelegate: AnyObject {
    
    func signInButtonTapped(_ sender: UIButton, nickLabel: UILabel, emailLabel: UILabel, passLabel: UILabel, passField: UITextField, emailField: UITextField)
    
}
