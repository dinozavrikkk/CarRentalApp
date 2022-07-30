
import Foundation
import UIKit

enum Alerts {
    
    static func getSaveChangeAlert() {
        
        let alert = UIAlertController(title: nil, message: "Changes saved!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        UIApplication.topViewController()?.present(alert, animated: true)
        
    }
    
    static func getGoOutAlert(completion: (() -> Void)?) {
        
        let alert = UIAlertController(title: nil, message: "Log out of your account?", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Go out", style: .destructive, handler: { _ in
            completion?()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        UIApplication.topViewController()?.present(alert, animated: true)
        
    }
    
    static func getPhotoAlert(galleryCompletion: (() -> Void)?, cameraCompletion: (() -> Void)?) {
        
        let alert = UIAlertController(title: "Select an image", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Open gallery", style: .default, handler: { _ in
            galleryCompletion?()
        }))
        alert.addAction(UIAlertAction(title: "Take a photo", style: .default, handler: { _ in
            cameraCompletion?()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        UIApplication.topViewController()?.present(alert, animated: true)
        
    }
    
    static func getPayNowAlert(completion: (() -> Void)?) {
        
        let alert = UIAlertController(title: nil, message: "Successfully done", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
            completion?()
        }))
        UIApplication.topViewController()?.present(alert, animated: true)
        
    }
    
    static func getPayNowWithEmptyAlert() {
        
        let alert = UIAlertController(title: nil, message: "Check the entered data!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        UIApplication.topViewController()?.present(alert, animated: true)
        
    }
    
    static func getSignUpErrorAlert() {
        
        let alert = UIAlertController(title: nil, message: "Error, check the entered data", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Back", style: .cancel))
        UIApplication.topViewController()?.present(alert, animated: true)
        
    }
    
    static func getSignUpErrorFieldsAlert() {
        
        let alert = UIAlertController(title: nil, message: "Error, fill in the input field", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Back", style: .cancel))
        UIApplication.topViewController()?.present(alert, animated: true)
        
    }
    
    static func getSignInDoneAlert(completion: (() -> Void)?) {
        
        let alert = UIAlertController(title: nil, message: "Succesfully  Done", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Back", style: .default, handler: { _ in
            completion?()
        }))
        UIApplication.topViewController()?.present(alert, animated: true)
        
    }
    
    static func getSignInErrorFieldsAlert() {
        
        let alert = UIAlertController(title: nil, message: "Registration error, check the required fields", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Back", style: .cancel))
        UIApplication.topViewController()?.present(alert, animated: true)
        
    }
    
    static func getMessageAboutCarsAlert() {
        
        let alert = UIAlertController(title: nil, message: "We apologize, at the moment our cars are geographically located only in the city of Kazan", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close alert", style: .cancel))
        UIApplication.topViewController()?.present(alert, animated: true)
        
    }
    
    static func getLocationIsDisabledAlert() {
        
        let alert = UIAlertController(title: nil, message: "GPS access is restricted. In order to use tracking, please enable GPS in the Settings app under Privacy, Location Services.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close alert", style: .cancel))
        alert.addAction(UIAlertAction(title: "Settings", style: .default, handler: { _ in
            UIApplication.shared.open(NSURL(string: UIApplication.openSettingsURLString)! as URL)
        }))
        UIApplication.topViewController()?.present(alert, animated: true)
        
    }
    
}
