import Foundation

// MARK: - defining errors

// errors must conform to Error protocol
enum NetworkError: Error {
    case badUrl
    case noConnection
    case timeout
    case serverError(code: Int)
}

enum ValidationError: Error {
    case emptyName
    case invalidEmail
    case ageTooYoung
}
// MARK: - throwing functions
// 'throws' keyword means function can throw errors
func validateAge(_ age: Int) throws -> Bool {
    if age < 18 {
        throw ValidationError.ageTooYoung
    }
    return true
}
func fetchData(from urlString: String) throws -> String {
    guard !urlString.isEmpty else {
        throw NetworkError.badUrl
    }

    // simulate random failure
    if Bool.random() {
        throw NetworkError.serverError(code: 500)
    }

    return "data from server"
}

// MARK: - handling errors with do-catch

func basicTryCatch() {
    do {
        // 'try' is required before calling throwing function
        let isValid = try validateAge(25)
        print("validation passed: \(isValid)")

    } catch {
        // 'error' is automatically available in catch block
        print("error occurred: \(error)")
    }
}

// multiple catch blocks for specific errors
func specificCatchBlocks() {
    do {
        let data = try fetchData(from: "")
        print("received: \(data)")

    } catch NetworkError.badUrl {
        print("fix your url")

    } catch NetworkError.serverError(let code) {
        print("server returned error code: \(code)")

    } catch {
        // catch-all for any other errors
        print("something else went wrong: \(error)")
    }
}

// MARK: - try? (optional try)

// converts error to nil, returns optional
// good when you don't care about the specific error
func optionalTry() {

    // if it throws, result is nil
    let result = try? validateAge(15)

    if let validAge = result {
        print("age is valid")
    } else {
        print("age check failed, but we don't know why")
    }

    // useful for quick checks
    if try? validateAge(20) != nil {
        print("proceed with registration")
    }
}

// MARK: - try! (forced try)

// crashes app if error is thrown
// only use when you're 100% sure it won't fail
func forcedTry() {
    // dangerous! only use when error is impossible
    let result = try! validateAge(30)
    print("guaranteed valid: \(result)")

    // this would crash the app:
    // let bad = try! validateAge(10)  // crash!
}

// MARK: - rethrowing functions

// function that takes throwing closure and can rethrow its errors
func performOperation<T>(_ operation: () throws -> T) rethrows -> T {
    // if operation throws, this function rethrows it
    return try operation()
}

func usingRethrow() {
    do {
        let result = try performOperation {
            try validateAge(15)
        }
        print(result)
    } catch {
        print("caught rethrown error: \(error)")
    }
}

// MARK: - real-world example: user registration

struct User {
    let name: String
    let email: String
    let age: Int
}

func registerUser(name: String, email: String, age: Int) throws -> User {

    // validate each field
    guard !name.isEmpty else {
        throw ValidationError.emptyName
    }

    guard email.contains("@") else {
        throw ValidationError.invalidEmail
    }

    try validateAge(age)

    // all validations passed
    return User(name: name, email: email, age: age)
}

func registrationFlow() {
    do {
        let user = try registerUser(name: "john", email: "john@email.com", age: 25)
        print("user registered: \(user.name)")

        // continue with more operations that can throw
        let data = try fetchData(from: "api.example.com/users")
        print("saved to server: \(data)")

    } catch ValidationError.emptyName {
        print("please enter your name")

    } catch ValidationError.invalidEmail {
        print("please enter valid email")

    } catch ValidationError.ageTooYoung {
        print("must be 18 or older")

    } catch NetworkError.serverError(let code) {
        print("server error \(code), try again later")

    } catch {
        print("unexpected error: \(error)")
    }
}

// MARK: - defer statement

// defer runs when exiting current scope, no matter how (success/error/return)
// useful for cleanup
func readFile() throws {
    print("opening file")

    defer {
        // runs when function exits, even if error is thrown
        print("closing file")
    }

    // simulate error
    throw NetworkError.timeout

    // defer still executes!
}

func testDefer() {
    do {
        try readFile()
    } catch {
        print("caught error: \(error)")
    }
    // output:
    // opening file
    // closing file
    // caught error: timeout
}

// MARK: - chaining multiple throwing calls

func processUserData() throws -> String {
    // multiple try calls in sequence
    // if any throws, execution stops and error propagates up
    let user = try registerUser(name: "alice", email: "alice@test.com", age: 22)
    let userData = try fetchData(from: "api.com/profile")

    return "processed \(user.name): \(userData)"
}

// MARK: - run examples

print("=== basic try-catch ===")
basicTryCatch()

print("\n=== specific catches ===")
specificCatchBlocks()

print("\n=== optional try ===")
optionalTry()

print("\n=== registration flow ===")
registrationFlow()

print("\n=== defer test ===")
testDefer()

// int a = 123445
// int ld = a/10

// 544321
