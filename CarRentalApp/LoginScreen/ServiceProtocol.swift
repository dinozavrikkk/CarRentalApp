

import Foundation

protocol ServiceProtocol {
    
    func createNewUser(data: RegisterField, complection: @escaping (ResponceCode) -> ())
    func authInApp(_ data: RegisterField, complection: @escaping (AuthResponce) -> ())
    
}
