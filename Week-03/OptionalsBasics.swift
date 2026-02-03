//MARK: -   Optionals in swift
var data: Int?
var myData: Int

func convertToInt(input: String) -> Int? {
    // Returns nil if string can't be converted to integer
    return Int(input)
}

data = convertToInt(input: "22")  //  will NOT give error but will print: Optional(22)
print(data)

data = convertToInt(input: "1")  //  will NOT give error and just print 1
print(data!)

//  un-comment this code and try to read & understand error; it will help you in future
// data = convertToInt(input: "qwertyu")  //    WILL give error
// print(data)

myData = data!  //using '!' you can unwrap optionals
print(myData)

//More ways to unwrap optionals:
