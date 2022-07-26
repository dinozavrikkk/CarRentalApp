
import Foundation
import UIKit

final class VCAnimation {
    
    static func animationShowMenu(completion: () -> () -> Void) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: completion())
    }
    
    static func animationHideMenu(completion: () -> () -> Void) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: completion())
    }
    
}
