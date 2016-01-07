import UIKit

/*:
Below is the beginning of making the map function
*/

// Here's a dictionary of numbers

let digits = ["zero": 0, "one": 1, "two": 2, "three": 3, "four": 4, "five": 5, "six": 6, "seven": 7, "eight": 8, "nine": 9]


// create a function named add() that takes an array of Strings as its argument. It sums the Int values of the entries.


// call the add function passing in an array of the english words for a couple numbers example:["one", "three"]


/*: more functions */

var numbers = [5,2,8,3,9,4]

// create a function that takes an array of int's, returns an array of int's. It changes the values of the ints in the array by multiplying them by 100

// Now do it by returning a different array

// call our func passing in our numbers array

// do so again but assign the result back to numbers


/*: variadic parameters */

// create the same array but set the parameter array to be a var


// Just a second array we can use
var numbers2 = [6,2,8,7,9,1]

/*: inout parameters */

// create the same function but set the parameter array to be if type inout

// call previous func with our number2 array then check array values

// call new inout version and do the same

// Simple function that takes a number and multiplies it by 100 then returns the result
func times100(number: Int) -> Int {
    return number * 100
}

// reset our numbers array as the values are getting pretty large
numbers = [5,2,8,3,9,4]


/*: function as the second parameter */

// create the same func but add a second param that is a closure: modificationOf:(Int) -> Int
// in the for loop we want to call that closure with the current loops value

// call our new func passing in our numbers array and the times100 func

// It's really just doing this right? But the difference is we get to let the modification be dynamic rather than static
func func5(inout array: [Int]) {
    for i in 0..<array.count {
        array[i] = array[i] * 100
    }
}

func5(&numbers)


/*: closure */

// try calling our latest func passing in a trainling closure

// Can be shortened


/*: generics */

// But what if we wanted to do the same thing with doubles and not ints?
var doubles = [5.0, 2.0, 8.0, 3.0, 9.0, 4.0]

// create a version of our most recent func but use doubles instead of ints


// Wouldn't it be nice to have one function that could handle both?
// This is where generics come in

// create the same function but use generics

// call the function twice, once with the numbers and once with the doubles array


/*: Mutating functions

The type of a Swift array is written in full as Array<Element>, where Element is the type of values the array is allowed to store.
*/

// here's an extension of Array with a mutating function
extension Array {
    // mutating keyword allows the function to change the values of the properties
    mutating func ourFunc(modificationOf:(Element) -> Element) {
        for i in 0..<self.count {
            self[i] = modificationOf(self[i])
        }
    }
}

numbers = [5,2,8,3,9,4]
numbers.ourFunc{number in number * 100}
numbers

extension Array {
    func ourFunc2(modificationOf:(Element) -> Element) -> [Element] {
        var tempArray = [Element]()
        for element in self {
            tempArray += [modificationOf(element)]
        }
        return tempArray
    }
}

numbers = [5,2,8,3,9,4]
numbers.ourFunc2{number in number * 100}
numbers
var changedNumbers = numbers.ourFunc2{number in number * 100}
changedNumbers



