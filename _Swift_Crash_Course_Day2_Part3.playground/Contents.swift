import UIKit

/*:
# Swift Crash Course
*A fast paced intro to Swift*

## Function Exercise
*/


// Create a function named hello that takes no parameters

func hello() {
    print("Hello, World!")
}

//hello()

// Create the same function that takes one parameter

func hello(name: String) {
    print("Hello, \(name)!")
}

//hello("my friend")

// Create the same function that takes multiple parameters

func hello(name: String, numberOfTimes: Int) {
    for _ in 1 ... numberOfTimes {
        hello(name)
    }
}

//hello("Hannah", numberOfTimes: 7)

// We now have the first basic hello function and then two overloaded versions.

// Create a function with a default value

func hi(name: String = "World") {
    hello(name)
}

//hi()
//hi("Noah")

func hey(name: String = "World", numberOfTimes: Int = 1) {
    for _ in 1 ... numberOfTimes {
        hi(name)
    }
}

//hey()
//hey("Rosie")
//hey("Rosalita", numberOfTimes: 3)
//hey(numberOfTimes: 5)

// functions can have external names

func hello(personWithName name: String, numberOfTimes: Int) {
    for _ in 1 ... numberOfTimes {
        hello(name)
    }
}

//hello(personWithName: "external", numberOfTimes: 4)

// functions can have Variadic Parameters

func welcome(people: String...) {
    for person in people {
        hello(person)
    }
}

welcome()

//welcome("Hannah", "Noah", "Rosie")

// functions can return values

func whatsUp(name: String) -> String {
    return "Hello \(name)"
}

whatsUp("There")

// functions work with Tuples

func helloFriends(people: String...) -> (numberOfFriends: Int, greeting: String) {
    var tempGreeting = "Hello, "
    for person in people {
        tempGreeting += person + " "
    }
    return (people.count, tempGreeting)
}

let result = helloFriends("Hannah", "Noah", "Rosie")

//reference by index
result.0
result.1

// reference by name
result.numberOfFriends
result.greeting

let (numberOfPeople, finalGreeting) = helloFriends("Hannah", "Noah", "Rosie")
numberOfPeople
finalGreeting


// Create a function named display() that takes a single String parameter named char and returns a String. char should have a default value of "\u[2615]".
//
//func display(char: String = "\u{2615}") -> String {
//    return "Hello, \(char)"
//}



// call the function without any arguments.
//display()


// call the function with the argument "\u{266C}".
//display("\u{266C}")


// demonstrating function results

//let person = "Hannah"

//func charlotteWelcome(name: String) -> String {
//    let greeting = "\(name), welcome to Charlotte."
//    return greeting
//}

//let greeting = charlotteWelcome(person)
//
//func carolinasWelcome(name: String) -> String {
//    let greeting = "\(name), welcome to the Carolinas."
//    return greeting
//}

//let greeting2 = carolinasWelcome(person)

//var place = "Pinehurst"

//func welcome(personWithName name: String, toLocation location: String) -> String {
//    let greeting = "\(name), welcome to \(location)"
//    return greeting
//}

//welcome(personWithName: person, toLocation: "Kiawa")

// function as a constant
//let greeting3 = carolinasWelcome

//greeting3(person)

// function can also be a variable

//var greeting4 = carolinasWelcome
//greeting4 = charlotteWelcome
//greeting4(person)

// functions can return functions

//func greetingForLocation(location: String) -> (String) -> String {
//    func locationWelcome(name: String) -> String {
//        return "\(name), welcome to \(location)"
//    }
//    return locationWelcome
//}

//let charlotte = greetingForLocation("Charlotte")
//let pinehurst = greetingForLocation("Pinehurst")
//charlotte(person)
//
//
//// currying 
//
//greetingForLocation("Kiawa")(person)
//
//// functions that accept functions
//
//func welcome(personNamed name: String, withMessage greeting: (String) -> String) -> String {
//    return greeting(name)
//}
//
//welcome(personNamed: person, withMessage: charlotte)
//
//charlotte
//
//// create constants for the coffeeCup and sixteenthNotes
//let coffeeCup = "\u{2615}"
//let sixteenthNotes = "\u{266C}"
//
//// Revise display() so that theCharacter doesn't have a default value and the character is followed by a \t
//
//func display(theCharacter: String) -> String {
//    return theCharacter + "\t"
//}
//
//display("e")
//
//// create displayLine() that takes an int as a second argument and returns a String with that character that manay times
//
//func displayLines(theCharacter: String, numberOfTimes: Int) -> String {
//    var ourString:String = ""
//    for _ in 1...numberOfTimes {
//        ourString += display(theCharacter)
//    }
//    return ourString
//}
//
//// create displayLine() that takes an int as a second argument and returns a String with that character once in the first row, twice in the second row, ... n times in the nth row.
//
//func displayLines2(theCharacter: String, numberOfTimes: Int) -> String {
//    var ourString:String = ""
//    for index in 1...numberOfTimes {
//        ourString += displayLines(theCharacter, numberOfTimes: index) + "\n"
//    }
//    return ourString
//}
//
//displayLines(sixteenthNotes, numberOfTimes: 5)
//displayLines2(coffeeCup, numberOfTimes: 10)
//
//
//// You can have an array of functions
//
//var places = ["Charlotte", "Pinehurst", "Kiawa"]
//
//var greetings = [greetingForLocation(places[0]),
//                greetingForLocation(places[1]),
//                greetingForLocation(places[2])]
//
//greetings[1]("Noah")
//
//// The map function
//
//let simplerGreetings = places.map{place in greetingForLocation(place)}
//simplerGreetings[1]("Rosie")
//
//let simplerGreetings2 = places.map{(greetingForLocation($0))}
//simplerGreetings2[1]("Rosie")
//
//
//// dictionary
//
//var tourStops = ["August": "Columbus",
//                "September": "Las Vegas",
//                "October": "Seattle"]
//
//tourStops["November"] = "Boston"
//
//let theKeys = tourStops.keys
//let theValues = tourStops.values
//
//for key in theKeys {
//    print(key)
//}
//
//var month = "August"
//var stop = tourStops[month]
//
//// optionals
//
//month = "July"
//stop = tourStops[month]
//
//let possibleStop = tourStops[month]
//
//month = "July"
//if possibleStop != nil {
//    let stop = possibleStop!
//    print(stop)
//} else {
//    print("no stop then")
//}
//
//if let stop = tourStops["August"] {
//    print(stop)
//} else {
//    print("no stop then")
//}

/*:
Below is the beginning of making the map function
*/

// create a dictionary named digits that uses the String "zero", "one", "two", ... "nine" as the keys and the Ints 0,1,...9 as values
//
//let numbersDict = ["zero": 0, "one": 1, "two": 2, "three": 3, "four": 4, "five": 5, "six": 6, "seven": 7, "eight": 8, "nine": 9]
//
//// create a function named add() that takes an array of Strings as its argument. It sums the Int values of the entries.
//
//func add(numbers: [String]) -> Int {
//    var sum = 0
//    for number in numbers {
//        if let convertedInt = numbersDict[number] {
//            sum += convertedInt
//        }
//    }
//    return sum
//}
//
//add(["one", "three"])
//add(["two", "nine"])
//
//
//// more functions
//
//var moreNumbers = [5,2,8,3,9,4]
//
//// Can't do this
////func emphasize(array: [Int]) -> [Int] {
////    for element in array {
////        element *= 100
////    }
////    return array
////}
//
//// But you can do this
//
//func emphasize(array: [Int]) -> [Int] {
//    var tempArray = [Int]()
//    for element in array {
//        tempArray += [element * 100]
//    }
//    return tempArray
//}
//
//
//emphasize(moreNumbers)
//moreNumbers
//moreNumbers = emphasize(moreNumbers)
//
//// var parameters
//
//func emphasize2(var array: [Int]) -> [Int] {
//    for i in 0..<array.count {
//        array[i] *= 100
//    }
//    return array
//}
//
//// inout parameters
//
//func emphasize3(inout array: [Int]) {
//    for i in 0..<array.count {
//        array[i] *= 100
//    }
//}
//
//emphasize3(&moreNumbers)
//moreNumbers
//
//
//func emphasize4(inout array: [Int], modificationOf:(Int) -> Int) {
//    for i in 0..<array.count {
//        array[i] = modificationOf(array[i])
//    }
//}
//
//func times100(number: Int) -> Int {
//    return number * 100
//}
//
//emphasize4(&moreNumbers, modificationOf: times100)
//
//
//// closure ******* Not sure I get this one *******
//
//emphasize4(&moreNumbers){number in number * 100}
//// is really the same thing as
//emphasize4(&moreNumbers){(number: Int) -> Int in number * 100}
//// we're really just infering the type of the parameter and the type of returned value so we omitted them
//
//var doubles = [5.0, 2.0, 8.0, 3.0, 9.0, 4.0]
//
//// Then if you want to do the same thing with a double you need to do this
//
//func emphasize4(inout array: [Double], modificationOf:(Double) -> Double) {
//    for i in 0..<array.count {
//        array[i] = modificationOf(array[i])
//    }
//}
//
//
//// But why not have one function that could handle both?
//// This is where generics come in
//
//func emphasize4<T>(inout array: [T], modificationOf:(T) -> T) {
//    for i in 0..<array.count {
//        array[i] = modificationOf(array[i])
//    }
//}
//
//emphasize4(&moreNumbers){number in number * 100}
//emphasize4(&doubles){number in number * 100}
//
//
//// here's an extension of Array with a mutating function
//extension Array {
//    mutating func emphasize(modificationOf:(Element) -> Element) {
//        for i in 0..<self.count {
//            self[i] = modificationOf(self[i])
//        }
//    }
//}
//
//moreNumbers = [5,2,8,3,9,4]
//moreNumbers.emphasize{number in number * 100}
//moreNumbers
//
//extension Array {
//    func emphasize2(modificationOf:(Element) -> Element) -> [Element] {
//        var tempArray = [Element]()
//        for element in self {
//            tempArray += [modificationOf(element)]
//        }
//        return tempArray
//    }
//}
//
//var numbers = [5,2,8,3,9,4]
//numbers.emphasize2{number in number * 100}
//numbers
//numbers = numbers.emphasize2{number in number * 100}
//numbers
//
//
//
//// create a function named sigma that accepts an Int for the start and ending numbers and an operation to perform on each number.
//
//// sigma should return the sum of the operation applied to each number between start and end.
//
//// provide a default identity for the operation
//
//func sigma(start start: Int, end: Int, operation: (Int) -> Int = {a in a} ) -> Int {
//    
//    var sum = 0
//    for i in start...end {
//        sum += operation(i)
//    }
//    return sum
//}
//
//let resultOfSigma = sigma(start: 0, end: 4){a in a * a}
//result
//
//let identity = sigma(start: 0, end: 5)
//identity

