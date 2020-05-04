import UIKit

/*
    Map
    Problem: [1, 2, 3, 4, 5] to [1, 4, 9, 16] in one line
*/

//: Imperative/Non-Functional
var squareNumbers: [Double] = []

var numbers = [1.0, 2.0, 3.0, 4.0, 5.0]
for number in numbers {
    squareNumbers.append(number * number)
}


squareNumbers

//: The Built-in 'Map' Function
numbers.map{ $0 * $0}

//: Non-Generic Map (Numbers)
func myMap(numbers: [Double], operation: (Double) -> Double) -> [Double] {
    var result: [Double] = []
    for number in numbers {
        let transformValue = operation(number)
        result.append(transformValue)
    }
    return result
}

myMap(numbers: [1, 2, 3, 4, 5]) { $0 * $0 }


func slightlyGenericMap<T>(_ items: [T], _ operation: (T) -> T) -> [T] {
    var result: [T] = []
    for item in items {
        result.append(operation(item))
    }
    return result
}

//: Ex 1) Lowercase Each Element
let upperLetters = ["SAMET", "YATMAZ", "IOS DEVELOPER"]

func lowercase(enterString: String) -> String {
    return enterString.lowercased()
}

//: Pass Closure ***InDirectly**
print(slightlyGenericMap(upperLetters, lowercase))

//: Pass Closure **Directly** (Longer Form)
print(slightlyGenericMap(upperLetters, { (name) -> String in return name.lowercased() }))

//: Pass Closure **Directly** (Shorter Form)
print(slightlyGenericMap(upperLetters, { $0.lowercased()}))

//: ### Extremely Generic 'Map'
func genericMap<T, U>(_ items: [T], _ operation: (T) -> U) -> [U] {
    var result = [U]()
    for item in items {
        result.append(operation(item))
    }
    return result
}

//: Ex 2) Manipulate 'Number' to 'String'

//: Pass Closure **Indirectly**
func convertNumberToString(number: Int) -> String {
    return "You are number \(String(number))"
}

let myNumbers = [1, 2, 3, 4, 5]
print(genericMap(myNumbers, convertNumberToString))


//: Pass Closure **Directly**
genericMap(myNumbers, {"You are number \(String($0))"})

//: The Purest Form
extension Array {
    func myMap<U>(_ operation: (Element) -> U) -> [U] {
        var result = [U]()
        for item in self {
            result.append(operation(item))
        }
        return result
    }
}


let result = Array(1...10).myMap({ $0 * 10})
print(result)
