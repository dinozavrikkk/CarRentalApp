
import Foundation
import UIKit

protocol LoginScreenProtocol: AnyObject {
    
    func signUpButtonTapped(_ sender: UIButton, _ emailField: UITextField, _ passField: UITextField)
    func signInButtonTapped(_ sender: UIButton)
    
}
