import UIKit

/*:
# Swift Crash Course
*A fast paced intro to Swift*

## Function Exercise
*/


/*: Create a function named hello that takes no parameters */

//func hello() {
//    print("Hello, World!")
//}
//
//hello()

/*: Create the same function that takes one parameter */

//func hello(name: String) {
//    print("Hello, \(name)!")
//}
//
//hello("my friend")

/*: Create the same function that takes multiple parameters */

//func hello(name: String, numberOfTimes: Int) {
//    for _ in 1 ... numberOfTimes {
//        hello(name)
//    }
//}
//
//hello("Hannah", numberOfTimes: 7)

/*: We now have the first basic hello function and then two overloaded versions */

/*: Create a function with a default value */

//func hi(name: String = "World") {
//    hello(name)
//}
//
//hi()
//hi("Noah")
//
//func hey(name: String = "World", numberOfTimes: Int = 1) {
//    for _ in 1 ... numberOfTimes {
//        hi(name)
//    }
//}
//
//hey()
//hey("Rosie")
//hey("Rosalita", numberOfTimes: 3)
//hey(numberOfTimes: 5)

/*: functions can have external names */

//func hello(personWithName name: String, numberOfTimes: Int) {
//    for _ in 1 ... numberOfTimes {
//        hello(name)
//    }
//}
//
//hello(personWithName: "external", numberOfTimes: 4)

/*: functions can have Variadic Parameters */

//func welcome(people: String...) {
//    for person in people {
//        hello(person)
//    }
//}
//
//welcome()
//
//welcome("Hannah", "Noah", "Rosie")

/*: functions can return values */

//func whatsUp(name: String) -> String {
//    return "Hello \(name)"
//}
//
//whatsUp("There")

/*: functions work with Tuples */

//func helloFriends(people: String...) -> (numberOfFriends: Int, greeting: String) {
//    var tempGreeting = "Hello, "
//    for person in people {
//        tempGreeting += person + " "
//    }
//    return (people.count, tempGreeting)
//}
//
//let result = helloFriends("Hannah", "Noah", "Rosie")

/*: reference by index */
//result.0
//result.1

/*: reference by name */
//result.numberOfFriends
//result.greeting

/*: set the result to a tuple */
//let (numberOfPeople, finalGreeting) = helloFriends("Hannah", "Noah", "Rosie")
//numberOfPeople
//finalGreeting


/*: Create a function named display() that takes a single String parameter named char and returns a String. char should have a default value of "\u[2615]" */

//func display(char: String = "\u{2615}") -> String {
//    return "Hello, \(char)"
//}



/*: call the function without any arguments */
//display()


/*: call the function with the argument "\u{266C}" */
//display("\u{266C}")


/*: demonstrating function results */

//let person = "Hannah"
//
//func charlotteWelcome(name: String) -> String {
//    let greeting = "\(name), welcome to Charlotte."
//    return greeting
//}
//
//let greeting = charlotteWelcome(person)
//
//func carolinasWelcome(name: String) -> String {
//    let greeting = "\(name), welcome to the Carolinas."
//    return greeting
//}
//
//let greeting2 = carolinasWelcome(person)
//
//var place = "Pinehurst"
//
//func welcome(personWithName name: String, toLocation location: String) -> String {
//    let greeting = "\(name), welcome to \(location)"
//    return greeting
//}
//
//welcome(personWithName: person, toLocation: "Kiawa")

/*: function as a constant */
//let greeting3 = carolinasWelcome
//
//greeting3(person)

/*: function can also be a variable */

//var greeting4 = carolinasWelcome
//greeting4 = charlotteWelcome
//greeting4(person)

/*: functions can return functions */

//func greetingForLocation(location: String) -> (String) -> String {
//    func locationWelcome(name: String) -> String {
//        return "\(name), welcome to \(location)"
//    }
//    return locationWelcome
//}
//
//let charlotte = greetingForLocation("Charlotte")
//let pinehurst = greetingForLocation("Pinehurst")
//charlotte(person)


/*: currying */

//greetingForLocation("Kiawa")(person)

/*: functions that accept functions */

//func welcome(personNamed name: String, withMessage greeting: (String) -> String) -> String {
//    return greeting(name)
//}
//
//welcome(personNamed: person, withMessage: charlotte)
//
//charlotte

/*: create constants for the coffeeCup and sixteenthNotes */
//let coffeeCup = "\u{2615}"
//let sixteenthNotes = "\u{266C}"

/*: Revise display() so that theCharacter doesn't have a default value and the character is followed by a \t */

//func display2(theCharacter: String) -> String {
//    return theCharacter + "\t"
//}
//
//display2("e")

/*: create displayLine() that takes an int as a second argument and returns a String with that character that many times */

//func displayLines(theCharacter: String, numberOfTimes: Int) -> String {
//    var ourString:String = ""
//    for _ in 1...numberOfTimes {
//        ourString += display2(theCharacter)
//    }
//    return ourString
//}
//
//displayLines(coffeeCup, numberOfTimes: 5)

/*: create displayLine2() that takes an int as a second argument and returns a String with that character once in the first row, twice in the second row, ... n times in the nth row. */

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


/*: You can have an array of functions */

//var places = ["Charlotte", "Pinehurst", "Kiawa"]
//
//var greetings = [greetingForLocation(places[0]),
//                greetingForLocation(places[1]),
//                greetingForLocation(places[2])]
//
//greetings[1]("Noah")

