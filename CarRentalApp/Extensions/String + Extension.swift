
import Foundation
import UIKit

extension String {
    
    enum ValidTypes {
        case nickname
        case email
        case password
        case cardNumber
        case cardHolder
        case cardPass
        case cardData
    }
    
    enum RegEx: String {
        case nickname = "[a-zA-Z0-9]{1,8}"
        case email = "[a-zA-Z0-9._-]+@[a-zA-Z0-9]+\\.[a-zA-Z]{2,}"
        case password = "(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{6,}"
        case cardNumber = "^[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}$"
        case cardHolder = "123"
        case cardPass = "^\\d{3}"
        case cardData = "^\\d{2}/\\d{4}"
    }
    
    func isValid(validType: ValidTypes) -> Bool {
        let format = "SELF MATCHES %@"
        var regEx = ""
        
        switch validType {
        case .nickname: regEx = RegEx.nickname.rawValue
        case .email: regEx = RegEx.email.rawValue
        case .password: regEx = RegEx.password.rawValue
        case .cardNumber: regEx = RegEx.cardNumber.rawValue
        case .cardHolder: regEx = RegEx.cardHolder.rawValue
        case .cardPass: regEx = RegEx.cardPass.rawValue
        case .cardData: regEx = RegEx.cardData.rawValue
        }
        
        return NSPredicate(format: format, regEx).evaluate(with: self)
    }
    
}

