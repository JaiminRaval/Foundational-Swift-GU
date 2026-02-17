import Foundation

// simple model to decode api response
struct User: Codable {
    let id: Int
    let name: String
    let email: String
}
class APIServiceWithAsync {

    // async means function can suspend and resume
    // throws means it can propagate errors up the call chain
    func fetchUser() async throws -> User {

        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users/1") else {
            throw NSError(domain: "invalid url", code: -1)
        }

        // await suspends until data arrives
        // this is one line vs the whole closure setup above
        let (data, _) = try await URLSession.shared.data(from: url)

        // decode and return - throws automatically if it fails
        let user = try JSONDecoder().decode(User.self, from: data)
        return user
    }
}

// using the async/await version
func exampleWithAsync() async {
    let service = APIServiceWithAsync()

    do {
        // code waits here until user is fetched
        let user = try await service.fetchUser()
        print("got user: \(user.name)")

        // can continue with sequential code
        // much easier to read and reason about

    } catch {
        print("error: \(error.localizedDescription)")
    }
}

// calling async function from non-async context
func callAsyncFromSync() {
    Task {
        await exampleWithAsync()
    }
}
