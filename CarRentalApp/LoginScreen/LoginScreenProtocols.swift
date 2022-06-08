//
//  WelcomeScreenProtocols.swift
//  CarRentalApp
//
//  Created by admin on 08.05.2022.
//

import Foundation
import UIKit

protocol LoginScreenProtocol: AnyObject {
    func signUpButtonTapped(_ sender: UIButton, _ emailField: UITextField, _ passField: UITextField)
    func signInButtonTapped(_ sender: UIButton)
}
