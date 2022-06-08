//
//  Extension + String.swift
//  CarRentalApp
//
//  Created by admin on 05.06.2022.
//

import Foundation

extension String {
    enum ValidTypes {
        case nickname
        case email
        case password
    }
    
    enum RegEx: String {
        case nickname = "[a-zA-Z0-9]{1,8}"
        case email = "[a-zA-Z0-9._-]+@[a-zA-Z0-9]+\\.[a-zA-Z]{2,}"
        case password = "(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{6,}"
    }
    
    func isValid(validType: ValidTypes) -> Bool {
        let format = "SELF MATCHES %@"
        var regEx = ""
        
        switch validType {
        case .nickname: regEx = RegEx.nickname.rawValue
        case .email: regEx = RegEx.email.rawValue
        case .password: regEx = RegEx.password.rawValue
        }
        
        return NSPredicate(format: format, regEx).evaluate(with: self)
    }
}
