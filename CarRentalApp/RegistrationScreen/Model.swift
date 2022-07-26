
import Foundation

struct RegisterField {
    var email: String
    var password: String
}

struct ResponceCode {
    var code: Int
}

enum AuthResponce {
    case success, error
}
