import Foundation

// ARRAYS
var superheroes = ["Spider-Man", "Iron Man", "Black Panther"]

// Getting Spider-Man (he's at position 0)
print(superheroes[0])  // Shows: Spider-Man

// Adding a new superhero to the end of the list
superheroes.append("Thor")

// Now our list has 4 superheroes
print(superheroes.count)  // Shows: 4

superheroes.remove(at: 3)

// --- 1. For-In Loop ---
// Best for iterating over fixed ranges, arrays, or dictionaries.
let brands = ["Apple", "Nike", "Sony"]

for brand in brands {
    print("Brand: \(brand)")  // Runs once for every item in the list
}

for i in 1...3 {
    print("Count: \(i)")  // Runs for numbers 1, 2, and 3 (inclusive)
}

// --- 2. While Loop ---
// Best when you don't know how many times to loop; runs ONLY if condition is true.
var energy = 3
while energy > 0 {
    print("Running... Energy: \(energy)")
    energy -= 1  // Decrement is crucial to avoid infinite loops
}

// --- 3. Repeat-While Loop ---
// Similar to 'while', but ALWAYS runs the code block at least once before checking.
var attempts = 0
repeat {
    print("Attempt #\(attempts + 1)")
    attempts += 1
} while attempts < 1  // Condition is checked at the end

for row in 1...5 {
    for _ in 1...row {
        print("*", terminator: "")  // 'terminator: ""' keeps print on the same line
    }
    print("")  // Moves to the new line after the row is finished
}
