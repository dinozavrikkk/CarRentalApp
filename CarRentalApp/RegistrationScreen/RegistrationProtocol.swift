//
//  RegistrationProtocol.swift
//  CarRentalApp
//
//  Created by admin on 10.05.2022.
//

import Foundation
import UIKit

protocol RegistrationProtocol: AnyObject {
    
    func signInButtonTapped(_ sender: UIButton, nickLabel: UILabel, emailLabel: UILabel, passLabel: UILabel, passField: UITextField, emailField: UITextField)
    
}
