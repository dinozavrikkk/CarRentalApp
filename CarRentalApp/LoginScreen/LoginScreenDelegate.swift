
import Foundation
import UIKit

protocol LoginScreenDelegate: AnyObject {
    
    func signUpButtonTapped(_ sender: UIButton, _ emailField: UITextField, _ passField: UITextField)
    func signInButtonTapped(_ sender: UIButton)
    
}
