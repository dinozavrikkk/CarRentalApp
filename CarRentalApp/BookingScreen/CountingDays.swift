
import Foundation
import UIKit

enum CountingDays {
    
    static func counting(sender: UIButton, counter: inout Int, defaultPrice: inout String, carPrice: String) {
        switch counter {
        case 1:
            defaultPrice = carPrice
            sender.setTitle("1", for: .normal)
            defaultPrice = "\(Int(defaultPrice)! * 1)"
        case 2:
            defaultPrice = carPrice
            sender.setTitle("2", for: .normal)
            defaultPrice = "\(Int(defaultPrice)! * 2)"
        case 3:
            defaultPrice = carPrice
            sender.setTitle("3", for: .normal)
            defaultPrice = "\(Int(defaultPrice)! * 3)"
        case 4:
            defaultPrice = carPrice
            sender.setTitle("4", for: .normal)
            defaultPrice = "\(Int(defaultPrice)! * 4)"
        case 5:
            defaultPrice = carPrice
            sender.setTitle("5", for: .normal)
            defaultPrice = "\(Int(defaultPrice)! * 5)"
        case 6:
            defaultPrice = carPrice
            sender.setTitle("6", for: .normal)
            defaultPrice = "\(Int(defaultPrice)! * 6)"
        case 7:
            defaultPrice = carPrice
            sender.setTitle("7", for: .normal)
            defaultPrice = "\(Int(defaultPrice)! * 7)"
        case 8:
            defaultPrice = carPrice
            sender.setTitle("8", for: .normal)
            defaultPrice = "\(Int(defaultPrice)! * 8)"
        case 9:
            defaultPrice = carPrice
            sender.setTitle("9", for: .normal)
            defaultPrice = "\(Int(defaultPrice)! * 9)"
        case 10:
            defaultPrice = carPrice
            sender.setTitle("10", for: .normal)
            defaultPrice = "\(Int(defaultPrice)! * 10)"
        default:
            counter = 0
        }
        counter += 1
    }
    
}

