import UIKit
/*:
![Local Image](Cardinal_Logo.png)

# Swift Crash Course
*A fast paced intro to Swift*

Day 3, Part 2
*/
/*:
## Protocols

A protocol defines a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality.

The protocol can then be adopted by a class, structure, or enumeration to provide an actual implementation of those requirements.

Any type that satisfies the requirements of a protocol is said to conform to that protocol.

You can use a protocol name just like any other named type—for example, to create a collection of objects that have different types but that all conform to a single protocol.

You define a protocol with the "protocol" keyword.

`protocol SomeProtocol {`

`}`

*/
// Many times you include the word delegate in the name of the Protocol. Create a Protocol named UserAccountDelegate
//protocol UserAccountDelegate {
//    var username: String? {get}
//    var password: String? {get}
//    static var active: Bool {get}
//
//    func setCredentials(username: String, password: String)
//}


/*:
A protocol can require any conforming type to provide an instance property or type property with a particular name and type. The protocol also specifies whether each property must be gettable or gettable and settable.

`protocol SomeProtocol {`

var someVar:String {get}

var anotherVar:Int {get set}

`}`

*/
// Add two properties to the UserAccountDelegate, username and password, they should both optional strings. Designate each one to be only get.
/*:
You can create type property requirements with the "static" keyword.

`protocol SomeProtocol {`

static var someVar:String {get}

var anotherVar:Int {get set}

`}`
*/
// Add a static property named active which is a Bool, also only get.
/*:
**Method Requirements**
Protocols can require specific instance methods and type methods to be implemented by conforming types.

You declare method requirements just as with a normal func, but with no curly braces or body.

`protocol SomeProtocol {`

static var someVar:String {get}

var anotherVar:Int {get set}

func someFunc()

`}`
*/
// Add a method named updatePassword to your protocol. It should have one String parameter, password. Remember not to include curly braces.
/*:
As with type property requirements, you always prefix type method requirements with the static keyword when they are defined in a protocol.

`protocol SomeProtocol {`

static var someVar:String {get}

var anotherVar:Int {get set}

func someFunc()

static func someTypeFunc()

`}`
*/

/*:
**Protocol Initializers**

Protocols can require specific initializers to be implemented by conforming types. You write these initializers as part of the protocol’s definition in exactly the same way as for normal initializers, but without curly braces or an initializer body:

`protocol SomeProtocol {`

init(someParam: Int)

static var someVar:String {get}

var anotherVar:Int {get set}

func someFunc()

static func someTypeFunc()

`}`
*/
// Move your UserAccountProtocol down here and add an initializer to it. The init should set the username and password from the two parameters passed in.
protocol UserAccountDelegate {
    var username: String? {get set}
    var password: String? {get set}
    static var active: Bool {get set}
    
    func updatePassword(password: String)
    init(username: String, password: String)
}

var test = "test"

/*:
To conform to a protocol you add it after the type's name, sperated by a colon.

`struct SomeStruct:SomeProtocol {`

`}`
*/
// Create a struct named Person that conforms to the UserAccountDelegate protocol. The Person struct must implement all the item in the UserAccountProtocol or it will give you an error.
struct Person: UserAccountDelegate {
    var username: String? {
        get{
            return self.username
        } set {}
    }
    var password: String? {
        get{
            return self.password
        } set {}
    }
    static var active: Bool {
        get{
        return self.active
        } set {}
    }
    
    init(username: String, password: String) {
        self.password = password
        self.username = username
    }
    
    func updatePassword(password: String) {
        
    }
    
}

var test2 = "test2"
/*:
If you are in a class and it has a superclass list the superclass before any protocols seperated by a comma.

`class SomeClass: SomeSuperClass, SomeProtocol {`

`}`
*/

/*:
**Delegation**

Delegation is a design pattern that enables a class or structure to hand off (or delegate) some of its responsibilities to an instance of another type.

The delegation design pattern is implemented by defining a protocol that encapsulates the delegated responsibilities.
*/
// We've already done this we defined the UserAccountDelefate protocol and encapsulated the responsibilities and delegated the actual implementation to whoever conformed to the UserAccountProtocol, in this case the Person struct.
/*:
You can extend an existing type to adopt and conform to a new protocol, even if you do not have access to the source code for the existing type.
*/

/*:
**Protocol Extensions**

You can extend a protocol to implement some requirements or to implement additional functionality that conforming types can take advantage of. This allows you to define behavior on protocols themselves, rather than in each type’s individual conformance or in a global function.
*/

/*:
You extend a protocol just like you would a structure.

`extension SomeProtocol {`

// implement something here

`}`
*/
// First let's define a protocol named RandomNumberGenerator that includes a func named random that returns a Double
protocol RandomNumberGenerator {
    func random() -> Double
}

var test3 = "test3"

// Now let's extend our RandomNumberGenerator protocol to include a func named randomBool it should call our random func and return true if the result of the random call is greated than 0.5
extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return random() > 0.5
    }
}

// now define a struct named BattleResult that comforms to RandomNumberGenerator. You can use drand48() to return a random Double
struct BattleResult: RandomNumberGenerator {
    func random() -> Double {
        return drand48()
    }
}

// Now we can create an instance of BattleResult
let battleResult = BattleResult()

// Create a let named damage and set its value to a call to battleResult.random()
var damage = battleResult.random()

// Now create a let named directHit and set it to battleResult.randomBool()
var directHit = battleResult.randomBool()
/*:
You can use protocol extensions to provide a default implementation to any method or property requirement of that protocol. If a conforming type provides its own implementation of a required method or property, that implementation will be used instead of the one provided by the extension.
*/

/*:
## Error Handling

Swift provides first-class support for throwing, catching, propagating, and manipulating recoverable errors at runtime.

In Swift, errors are represented by values of types that conform to the ErrorType protocol.

enums are particularly useful when defining error types.

*/
// Let's create an enum that throws errors associaetd with reading a file
enum FileReadingError: ErrorType {
    case FileDoesNotExist(fileName: String)
    case FileIsWrongType
    case FileIsCorrupt
}

/*:
**Propagating Errors**

If a function, method or initializer can throw an error, you include the throws keyword in the definition before the return type.

`func someFunc() throws -> String {`

return "SomeString"

`}`

A throwing function propagates errors that are thrown inside of it to the scope from which it’s called.
*/
/*:
Throwing an error lets you indicate that something unexpected happened and the normal flow of execution can’t continue. You use a throw statement to throw an error.
*/
// Create a struct named FileReader with a function named readFile that throws a FileReadingError.FileDoesNotExist error. This type of error takes a string as a file name
struct FileReader {
    func readFile() throws {
        guard readFileSuccessfully() else {
            throw FileReadingError.FileDoesNotExist(fileName: "SomeFile.xml")
        }
    }
}


// We're going to use this function
func readFileSuccessfully() -> Bool {
    let battleResult = BattleResult()
    return battleResult.randomBool()
}

// We're not just going to automatically throw an error. We only want to throw it if the error actually occurs

// Add a guard statement to determine when to throw the error, The guard statement should call the readFileSuccessfully function and if it returns false it throws the error. Remember the guard statement looks like this
// guard testABool else {
//    handle the error
// }

/*:
When an error is thrown, some surrounding piece of code must be responsible for handling the error. For example, by correcting the problem, trying an alternative approach, or informing the user of the failure.

There are four ways to handle errors in Swift.

- propagate the error from a function to the code that calls that function

- handle the error using a do-catch statement

- handle the error as an optional value

- assert that the error will not occur


You write the try keyword—or the try? or try! variation—before a piece of code that calls a function, method, or initializer that can throw an error.
*/

/*:
**do-catch**

You use a do-catch statement to handle errors by running a block of code. If an error is thrown by the code in the do clause, it is matched against the catch clauses to determine which one of them can handle the error.

`do checkSomething {`

// persome some statements

`} catch matchSomethingHere {`

// persome some statements

`} catch matchSomethingElseHere {`

// persome some statements

`}`
*/
// Rewrite our FileReader struct to use a do-catch instead of the guard statement
struct FileReader2 {
    func readFile() {
        do {
            try readFileSuccessfully()
            print("Do Something")
        }
        catch is ErrorType {
            print("Log Error")
        }
    }
    func readFileSuccessfully() throws -> Bool {
        let battleResult = BattleResult()
        return battleResult.randomBool()
    }
}

// Create an instance of FileReader2 and then call the readFile method
var fileReader = FileReader2()
fileReader.readFile()
/*:
**Converting Errors to Optional Values**

You use try? to handle an error by converting it to an optional value. If an error is thrown while evaluating the try? expression, the value of the expression is nil.

Suppose you are calling the function you called earlier that throws an error.

`var someVar = try? readFileSuccessfully()`

If readFileSuccessfully() throws an error, the value of someVar is nil otherwise it gets value returned by the function.
*/
// It would look something like this

struct FileReader3 {
    func readFile() {
        let _ = try? readFileSuccessfully()
    }
    
    func readFileSuccessfully() throws -> Bool {
        let battleResult = BattleResult()
        guard battleResult.randomBool() else {
            throw FileReadingError.FileIsWrongType
        }
        return battleResult.randomBool()
        
    }
    
}

// Create an instance of FileReader3 and then call the readFile method
var fileReader3 = FileReader3()
fileReader3.readFile()

/*:
**Disabling Error Propagation**

Sometimes you know a throwing function or method won’t, in fact, throw an error at runtime. On those occasions, you can write try! before the expression to disable error propagation and wrap the call in a runtime assertion that no error will be thrown. If an error actually is thrown, you’ll get a runtime error.

`let someVar = try! someFunctionGuaranteedToWork()`
*/
struct FileReader4 {
    func readFile() {
        let _ = try! readFileSuccessfully()
    }
    
    func readFileSuccessfully() throws -> Bool {
        let battleResult = BattleResult()
        guard battleResult.randomBool() else {
            throw FileReadingError.FileIsWrongType
        }
        return true
        
    }
    
}

// Create an instance of FileReader4 and then call the readFile method
var fileReader4 = FileReader4()
//fileReader4.readFile()
// Comment out the call to readFile if is causing an error

var test4 = "test4"

/*:
**defer**

You use a defer statement to execute a set of statements just before code execution leaves the current block of code. This code always gets executed whether we are exiting the scope because of an error or a return statement or some other method.

`func someFunc() throws {`

if something {

// do something

}

defer {

// perform this code when leaving scope regardless if an error is thrown or not

}

while let someVar = try trySomeFunction() {

// do some work if successful

}

`}`
*/
struct FileReader5 {
    
    func readFile() {
        defer {
            cleanUp()
        }
        readFileSuccessfully()
    }
    
    func readFileSuccessfully() {
        let battleResult = BattleResult()
        if battleResult.randomBool() {
            print("battleResult.randomBool() = True")
        } else {
            print("battleResult.randomBool() = false")
        }
    }
    
    func cleanUp() {
        print("log, free up etc ...")
    }
    
}

// Create an instance of FileReader5 and then call the readFile method,  check the console for the order of lines printed out
var fileReader5 = FileReader5()
fileReader5.readFile()


