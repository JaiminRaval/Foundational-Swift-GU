import Foundation

// 1. The Data Model
struct JokeModel: Codable {
    var id: Int
    var type: String
    var setup: String
    var punchline: String
}

// 2. The Service
final class JsonServices {
    public static let shared = JsonServices()

    func readJSON(filename: String) -> [JokeModel] {
        var arr: [JokeModel] = []

        let currentDirectory = FileManager.default.currentDirectoryPath
        let fileURL = URL(fileURLWithPath: currentDirectory)
            .appendingPathComponent("\(filename).json")

        guard FileManager.default.fileExists(atPath: fileURL.path) else {
            print("Error: Could not find \(filename).json at \(fileURL.path)")
            return arr
        }

        do {
            let data = try Data(contentsOf: fileURL)
            arr = try JSONDecoder().decode([JokeModel].self, from: data)
        } catch {
            print("Error decoding JSON file: \(error)")
        }

        return arr
    }
}

// 3. Execution
// Notice we pass "JokesData" to match your JokesData.json file
let jokes: [JokeModel] = JsonServices.shared.readJSON(filename: "JokesData")

print("Loaded \(jokes.count) jokes!\n")

// Let's print the first couple of jokes to prove it works
for joke in jokes.prefix(3) {
    print("[\(joke.type.uppercased())]")
    print("Setup: \(joke.setup)")
    print("Punchline: \(joke.punchline)\n")
}
