class User {
    var profile: Profile?
}

class Profile {
    // Strong reference - Profile keeps User alive
    var user: User
    init(user: User) {
        self.user = user
    }
}
// Three Keywords: weak, strong & unowned.

// Correct way to create User referecne in Profile class
class CorrectProfile {
    weak var user: User?  // Doesn't keep User alive
    init(user: User) {
        self.user = user
    }
}

class CreditCard {
    unowned let owner: Customer
    init(owner: Customer) {
        self.owner = owner
    }  // Customer will always outlive the card
}

class Customer {
    var card: CreditCard?
}

// ARC(Automatic Reference Counting) in action:
class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}
var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "John Appleseed")
// Prints "John Appleseed is being initialized".

reference2 = reference1
reference3 = reference1  // There are now three strong references to this single Person instance.

reference1 = nil
reference2 = nil  // No effect till here
reference3 = nil  // Prints "John Appleseed is being deinitialized".
