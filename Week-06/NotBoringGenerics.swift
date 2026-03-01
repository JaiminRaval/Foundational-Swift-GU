// For Integers
func printInts(a: Int, b: Int) {
    print("Value 1: \(a), Value 2: \(b)")
}

// For Strings
func printStrings(a: String, b: String) {
    print("Value 1: \(a), Value 2: \(b)")
}

// For Doubles... you'd have to write a third function!

// The <T> tells Swift "T is a placeholder type".
func printValues<T>(a: T, b: T) {
    print("Value 1: \(a), Value 2: \(b)")
}

// Now look how easy it is to use:
printValues(a: 10, b: 20)  // Swift automatically knows T is Int
printValues(a: "Apple", b: "Pear")  // Swift automatically knows T is String
printValues(a: 99.9, b: 1.1)  // Swift automatically knows T is Double

// This will fail to compile, which is good! a and b must be the SAME type T.
// printValues(a: 10, b: "Apple")
