// simple class hierarchy to demonstrate type casting
class Animal {
    var name: String

    init(name: String) {
        self.name = name
    }

    func makeSound() {
        print("some sound")
    }
}

class Dog: Animal {
    func bark() {
        print("woof!")
    }
}

class Cat: Animal {
    func meow() {
        print("meow!")
    }
}

// create array of animals
let animals: [Animal] = [
    Dog(name: "buddy"),
    Cat(name: "whiskers"),
    Dog(name: "max"),
    Animal(name: "generic"),
]

// loop through and check types
for animal in animals {
    print("\nchecking: \(animal.name)")

    // 'is' operator - checks if instance is of a certain type
    if animal is Dog {
        print("this is a dog")
    }

    // 'as?' - conditional downcast, returns optional
    // safe way to try casting, returns nil if it fails
    if let dog = animal as? Dog {
        dog.bark()
    }

    if let cat = animal as? Cat {
        cat.meow()
    }

    // 'as!' - forced downcast, crashes if it fails
    // only use when you're 100% sure of the type
    // uncomment to see it crash on wrong type:
    // let dog = animal as! Dog
}

// 'as' - upcasting (always succeeds)
// going from specific type to more general type
let specificDog = Dog(name: "rover")
let generalAnimal: Animal = specificDog as Animal

// type casting with any and anyobject
let mixedArray: [Any] = [
    42,
    "hello",
    Dog(name: "fido"),
    3.14,
]

for item in mixedArray {
    switch item {
    case let number as Int:
        print("found integer: \(number)")
    case let text as String:
        print("found string: \(text)")
    case let dog as Dog:
        print("found dog: \(dog.name)")
    case let decimal as Double:
        print("found double: \(decimal)")
    default:
        print("unknown type")
    }
}
