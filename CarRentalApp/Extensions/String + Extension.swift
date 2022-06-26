//
//  Extension + String.swift
//  CarRentalApp
//
//  Created by admin on 05.06.2022.
//

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
    //5555 5555 5555 5555 nomer carti
    //03/2023 god
    //333 pass
    //SABITOV AYAZ
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

extension UIViewController {
    func pushModule(withViewController viewController: UIViewController, animated: Bool = true, hidesTabBarWhenPushed: Bool = true) {
        viewController.hidesBottomBarWhenPushed = hidesTabBarWhenPushed
        navigationController?.pushViewController(viewController, animated: animated)
    }
}
