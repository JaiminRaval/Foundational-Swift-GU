import Foundation

// MARK: - basic closure syntax

// closures are self-contained blocks of code that can be passed around

// regular function for comparison
func addNumbers(a: Int, b: Int) -> Int {
    return a + b
}

// same thing as a closure stored in a variable
let addClosure: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in
    return a + b
}

// swift can infer types, so we can simplify
let addSimple = { (a: Int, b: Int) in
    return a + b
}

// even simpler - single expression returns automatically
let addShorter = { (a: Int, b: Int) in a + b }

// shortest - using shorthand argument names $0, $1, etc
let addShortest: (Int, Int) -> Int = { $0 + $1 }

print(addClosure(5, 3))  // 8

// MARK: - closures as function parameters

// function that takes a closure
func performOperation(a: Int, b: Int, operation: (Int, Int) -> Int) -> Int {
    return operation(a, b)
}

// pass closure inline
let result1 = performOperation(a: 10, b: 5, operation: { $0 - $1 })
print(result1)  // 5

// trailing closure syntax - if closure is last parameter
// you can write it outside the parentheses
let result2 = performOperation(a: 10, b: 5) { $0 * $1 }
print(result2)  // 50

// MARK: - capturing values

// closures can capture and store references to variables from surrounding context
func makeIncrementer(incrementAmount: Int) -> () -> Int {
    var total = 0

    // this closure captures 'total' and 'incrementAmount'
    let incrementer: () -> Int = {
        total += incrementAmount  // modifies captured variable
        return total
    }

    return incrementer
}
