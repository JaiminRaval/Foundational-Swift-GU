import Foundation

// simple model to decode api response
struct User: Codable {
    let id: Int
    let name: String
    let email: String
}

// MARK: - approach 1: closure-based (@escaping)

class APIServiceWithClosures {

    // @escaping means closure will be called after function returns
    // Result type handles success/failure elegantly
    func fetchUser(completion: @escaping (Result<User, Error>) -> Void) {

        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users/1") else {
            completion(.failure(NSError(domain: "invalid url", code: -1)))
            return
        }

        // create and start the network request
        let task = URLSession.shared.dataTask(with: url) { data, response, error in

            // check for network errors first
            if let error = error {
                completion(.failure(error))
                return
            }

            // ensure we got data back
            guard let data = data else {
                completion(.failure(NSError(domain: "no data", code: -1)))
                return
            }

            // try to decode json into our model
            do {
                let user = try JSONDecoder().decode(User.self, from: data)
                completion(.success(user))
            } catch {
                completion(.failure(error))
            }
        }

        task.resume()
    }
}

// MARK: - approach 2: async/await

// MARK: - usage examples

// using the closure version
func exampleWithClosures() {
    let service = APIServiceWithClosures()

    service.fetchUser { result in
        switch result {
        case .success(let user):
            print("got user: \(user.name)")
        // remember: this runs on background thread
        // update ui on main thread:
        // DispatchQueue.main.async { updateUI(user) }
        case .failure(let error):
            print("error: \(error.localizedDescription)")
        }
    }

    // function continues immediately, doesn't wait for response
    print("request sent, waiting for response...")
}
