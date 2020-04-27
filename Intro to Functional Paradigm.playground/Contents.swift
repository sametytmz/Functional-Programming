import UIKit

/*
    Problem: What is functional programming
    Note: "functional Programming is a paradigm that allows you to make your code explicit.
            There is no state and no mutality"
 */


// Non-functional Programing

// Somewhere in ViewController
let numbers = [1,2,3]
var sum = 0
for number in numbers {
    sum += number
}

print(sum)

// Somewhere in NextViewController
let newNumbers = [4,5,6]
var newSum = 0
for newNumber in newNumbers {
    newSum += newNumber
}

print(sum)

/*
    Note: My Definition: Functional programming is nothing more than using functions to derive results
 */

///: ###Functional Programming
func saveMeFromMadnes(elements: [Int]) -> Int {
    var sum = 0
    for element in elements {
        sum += element
    }
    return sum
}

// Somewhere in ViewController
saveMeFromMadnes(elements: [1, 2, 3])
// Somewhere in NextViewController
saveMeFromMadnes(elements: [4, 5, 6])

/*
    Declarative: functional
    The user does not care about the process
    
 Ex) Jump off from an airplane vs climb
 
    Imperative: Non-Functional
    It tells you got the answer from A -> B.
 
 Ex) The 'for-in' loop
 */

/*
    ###Benefits of Functional Programming
    A functional paradigm ensures no mutability or no change in state when used/No explicit state management
    - Modularity
    - Fewer lines
    - Conventional communication
 */

















