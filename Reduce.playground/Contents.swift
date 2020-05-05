import UIKit

/*
    Reduce
    Problem: Combine all into one
 */


//: ### Imperative/Non-Functional

//: Addition
var numberOne = Int()
for number in Array(1...10) {
    numberOne += number
}

numberOne

//: Subraction
var numberTwo = Int()
for number in Array(1...10) {
    numberTwo -= number
}

numberTwo


//: ### Declarative/Functional Programming
let added = Array(1...10).reduce(0) { $0 + $1 }
let subtracted = Array(1...10).reduce(0) { $0 - $1 }
print(added)
print(subtracted)

//: Let's Find Out
func myReduce(_ seed: Int, numbers: [Int], operation: (Int, Int) -> Int) {
    var current = seed
    for number in numbers {
        current = operation(current, number)
    }
}

myReduce(0, numbers: Array(1...10), operation: { $0 + $1 })

//: Max Number
let maxNumber = Array(1...10).reduce(0) { (current, number) in max(current, number) }
let bigNumber = Array(1...10).reduce(0) { max($0, $1) }

//: The Purest Form
extension Array {
    func reduce(_ seed: Element, operation: (Element, Element) -> Element) -> Element {
        var current = seed
        for item in self {
            current = operation(current, item)
        }
        return current
    }
}


//: Example
let names = ["Samet", "iOS", "Developer"]
let description = names.reduce("Names: ") { "\($0) " + $1 }

print(description)

//: Multiple Functions
let lowerNames = names.map{ $0.lowercased() }.reduce("Names: ") { "\($0) " + $1 }
print(lowerNames)
