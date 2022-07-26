
import Foundation

final class JokesDataProvider {
    
    private let queue = DispatchQueue(label: "com.PaymentViewController.URLSession", qos: .userInteractive, attributes: .concurrent)
    
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
