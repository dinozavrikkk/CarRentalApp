
import Foundation
import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

final class Service {
    
    static let shared = Service()
    
    private init() { }
    
}

//MARK: ServiceProtocol
extension Service: ServiceProtocol {
    
    func createNewUser(data: RegisterField, complection: @escaping (ResponceCode) -> ()) {
        Auth.auth().createUser(withEmail: data.email, password: data.password) { result, error in
            if error == nil {
                if result != nil {
                    let userId = result?.user.uid
                    let email = data.email
                    let data: [String: Any] = ["email" : email]
                    
                    Firestore.firestore().collection("users").document(userId!).setData(data)
                    complection(ResponceCode(code: 1))
                }
            } else {
                complection(ResponceCode(code: 0))
            }
        }
    }
    
    func authInApp(_ data: RegisterField, complection: @escaping (AuthResponce) -> ()) {
        Auth.auth().signIn(withEmail: data.email, password: data.password) { result, error in
            if error != nil {
                complection(.error)
            } else {
                if result != nil {
                    complection(.success)
                }
            }
        }
    }
    
}
