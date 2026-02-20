func TakeCliInputs(placeHolder: String) -> String {
    print("\n\(placeHolder)", terminator: "")
    return readLine() ?? "Something went wrong"
}
func performOperation(sign operation: String, a: Int, b: Int) -> Int {

    switch operation {
    case "+":
        return a + b

    case "-":
        return a - b
    case "x":
        return a * b

    case "/":
        return a / b
    default:
        return 0
    }
}
func BasicCalc() {
    let operation = TakeCliInputs(placeHolder: "Enter the operation (+, -, x, /): ")
    let n = TakeCliInputs(placeHolder: "Enter number 1: ")
    let m = TakeCliInputs(placeHolder: "Enter number 2: ")

    let a = Int(n) ?? 0
    let b = Int(m) ?? 0

    let output = performOperation(sign: operation, a: a, b: b)
    print("\n\n\(a) \(operation) \(b) = \(output)")
}

BasicCalc()
