
import Foundation
import UIKit

class UserDefaultProvider {

    func setUserDataToUserDefaults(pass: String, date: String, holder: String, number: String) {
        UserDefaults.standard.set(pass, forKey: KeysDefaults.keyPass)
        UserDefaults.standard.set(date, forKey: KeysDefaults.keyData)
        UserDefaults.standard.set(holder, forKey: KeysDefaults.keyHolder)
        UserDefaults.standard.set(number, forKey: KeysDefaults.keyNumber)
    }

    func deleteUserDataFromUserDefaults() {
        UserDefaults.standard.removeObject(forKey: KeysDefaults.keyPass)
        UserDefaults.standard.removeObject(forKey: KeysDefaults.keyData)
        UserDefaults.standard.removeObject(forKey: KeysDefaults.keyHolder)
        UserDefaults.standard.removeObject(forKey: KeysDefaults.keyNumber)
    }
    
}
