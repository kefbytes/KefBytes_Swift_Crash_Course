import UIKit

/*:
Below is the beginning of making the map function
*/

// create a dictionary named digits that uses the String "zero", "one", "two", ... "nine" as the keys and the Ints 0,1,...9 as values

let digits = ["zero": 0, "one": 1, "two": 2, "three": 3, "four": 4, "five": 5, "six": 6, "seven": 7, "eight": 8, "nine": 9]


// create a function named add() that takes an array of Strings as its argument. It sums the Int values of the entries.

func add(numbers: [String]) -> Int {
    var sum = 0
    for number in numbers {
        // getting the value for the key we passed in
        if let convertedInt = digits[number] {
            sum += convertedInt
        }
    }
    return sum
}

add(["one", "three"])
add(["two", "nine"])



// more functions

var numbers = [5,2,8,3,9,4]

// Can't do this
//func func1(array: [Int]) -> [Int] {
//    for element in array {
//        element *= 100
//    }
//    return array
//}

// But you can do this

func func1(array: [Int]) -> [Int] {
    var tempArray = [Int]()
    for element in array {
        tempArray += [element * 100]
    }
    return tempArray
}


func1(numbers)
numbers
numbers = func1(numbers)
numbers

// var parameters

func func2(var array: [Int]) -> [Int] {
    for i in 0..<array.count {
        array[i] *= 100
    }
    return array
}

var numbers2 = [6,2,8,7,9,1]

// inout parameters

func func3(inout array: [Int]) {
    for i in 0..<array.count {
        array[i] *= 100
    }
}
func2(numbers2)
numbers2

func3(&numbers)
numbers

// Simple function that takes a number and multiplies it by 100 then returns the result
func times100(number: Int) -> Int {
    return number * 100
}

// reset our numbers array as the values are getting pretty large
numbers = [5,2,8,3,9,4]


func func4(inout array: [Int], modificationOf:(Int) -> Int) {
    for i in 0..<array.count {
        array[i] = modificationOf(array[i])
    }
}


func4(&numbers, modificationOf: times100)

// It's really just doing this right? But the difference is we get to let the modification be dynamic rather than static
func func5(inout array: [Int]) {
    for i in 0..<array.count {
        array[i] = array[i] * 100
    }
}

func5(&numbers)


// closure
func4(&numbers){(number: Int) -> Int in number * 100}

// Can be shortened to, we're inferring the type of the parameter and the type of returned value so we omitted them
func4(&numbers){number in number * 100}


// But what if we wanted to do the same thing with doubles and not ints?
var doubles = [5.0, 2.0, 8.0, 3.0, 9.0, 4.0]

func func4(inout array: [Double], modificationOf:(Double) -> Double) {
    for i in 0..<array.count {
        array[i] = modificationOf(array[i])
    }
}


// Wouldn't it be nice to have one function that could handle both?
// This is where generics come in

func func4<T>(inout array: [T], modificationOf:(T) -> T) {
    for i in 0..<array.count {
        array[i] = modificationOf(array[i])
    }
}

func4(&numbers){number in number * 100}
func4(&doubles){number in number * 100}


// here's an extension of Array with a mutating function
extension Array {
    // mutating keyword allows the function to change the values of the properties
    mutating func mutatingFunc(modificationOf:(Element) -> Element) {
        for i in 0..<self.count {
            self[i] = modificationOf(self[i])
        }
    }
}
// The type of a Swift array is written in full as Array<Element>, where Element is the type of values the array is allowed to store.

numbers = [5,2,8,3,9,4]
numbers.mutatingFunc{number in number * 100}
numbers

extension Array {
    func mutatingFunc2(modificationOf:(Element) -> Element) -> [Element] {
        var tempArray = [Element]()
        for element in self {
            tempArray += [modificationOf(element)]
        }
        return tempArray
    }
}

numbers = [5,2,8,3,9,4]
numbers.mutatingFunc2{number in number * 100}
numbers
var changedNumbers = numbers.mutatingFunc2{number in number * 100}
changedNumbers



