
import Foundation
import UIKit

final class UserDefaultProvider {
    
    private let queue = DispatchQueue(label: "com.PaymentViewController.URLSession", qos: .userInteractive, attributes: .concurrent)

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
    
    func fetchJoke() {
        queue.async {
            guard let url = URL(string: "https://v2.jokeapi.dev/joke/Any") else { return }
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else { return }
                guard let joke = try? JSONDecoder().decode(Joke.self, from: data) else { return }
                print("Joke:\n\(joke.setup)\n\(joke.delivery)")
            }
            task.resume()
        }
    }
    
}
