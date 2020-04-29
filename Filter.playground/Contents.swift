import UIKit

/*
    Filter
    Problem: How to get things done with one line of code?
 */

/*
    Note: Most people use Swift functions without knowing the behind implementation
 */

//: Imperative/Non-Functional Programming
// Get even numbers
var evens = [Int]()

for i in 1...10 {
    if i % 2 == 0 {
        evens.append(i)
    }
}

//: Declarative/Functional
Array(1...10).filter{(number) in number % 2 == 0}
Array(1...10).filter{ $0 % 2 == 0 }

// Become an A student
let recentGrade = ["A", "A", "A", "A", "B", "D"] // It can be any data

//: Imperative/Non-Functional
var happyGrade: [String] = []

for grade in recentGrade {
    if grade == "A" {
        happyGrade.append(grade)
    } else {
        print("My mama not happy")
    }
}

print(happyGrade)

/*
    Functional Way
    Create closure block that returns true/false
*/

var isMomHappy: (String) -> Bool = { (grade) in
    return grade == "A"
}

isMomHappy = { $0 == "A" }
isMomHappy("A")
isMomHappy("B")

//: Create function that takes the closure
func simpleStringFilter(grades: [String], operation: (String) -> Bool) -> [String] {
    var happyGrade: [String] = []
    for grade in grades {
        if operation(grade) {
            happyGrade.append(grade)
        } else
        {
            print("Not the grade I want")
        }
    }
    return happyGrade
}

//: Pass the closure block indirectly
print(simpleStringFilter(grades: recentGrade, operation: isMomHappy))

//: Pass the closure block directly
print(simpleStringFilter(grades: recentGrade, operation: { (grade) in return grade == "A"}))

//: Generic Function
func myFilter<T>(array: [T], operation: (T) -> Bool) ->[T] {
    var result: [T] = []
    for element in array {
        if operation(element) {
            result.append(element)
        }
    }
    return result
}

//: Ex 1) Filter Numbers
let aStudent = myFilter(array: Array(1...100), operation: { $0 > 93 && $0 <= 100})
print(aStudent)

//: Ex 2) Vote Counting
let answer = [true, false, true, false, false, false, false]
let trueAnswer = myFilter(array: answer, operation: { $0 == true })
print(trueAnswer)

//: Trailing Closure
let falseAnswer = myFilter(array: answer, operation: { $0 == false })

//: The Built-in Filter Functional
let zeroToHund = Array(1...100)
zeroToHund.filter{$0 % 2 == 0}.filter{ $0 <= 50 }

//: The Purest Form
extension Array {
    func myFilter(_ operation: (Element) -> Bool) -> [Element] {
        var result: [Element] = []
        for item in self {
            if operation(item) {
                result.append(item)
            }
        }
        return result
    }
}

let result = Array(1...100).myFilter({ $0 % 2 == 0 })
print(result)




