
import Foundation
import UIKit

enum VCAnimation {
    
    static func animationShowMenu(completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: completion)
    }
    
    static func animationHideMenu(completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: completion)
    }
    
}
