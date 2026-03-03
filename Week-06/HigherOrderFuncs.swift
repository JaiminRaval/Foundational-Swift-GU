// what is Higher order functions:
//

let numbers = [1, 2, 3, 4, 5]

// --- MAP ---
// Goal: Multiply every number by 10
let multiplied = numbers.map { $0 * 10 }
print(multiplied)  // Output: [10, 20, 30, 40, 50]

// --- FILTER ---
// Goal: Keep only the even numbers
let evens = numbers.filter { $0 % 2 == 0 }
print(evens)  // Output: [2, 4]

// --- REDUCE ---
// Goal: Add all the numbers together.
// The '0' is the starting value. $0 is the running total, $1 is the current number.
let sum = numbers.reduce(0) { $0 + $1 }
print(sum)  // Output: 15

let bills = [
    "Diet Coke 12.99",
    "20.50 for Cookie",
    " 52.78 for 4 slice of pizza",
]
