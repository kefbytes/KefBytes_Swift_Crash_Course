import UIKit
/*:
## Classes and Structs

Classes and structures are general-purpose, flexible constructs that become the building blocks of your program’s code. You define properties and methods to add functionality to your classes and structures by using exactly the same syntax as for constants, variables, and functions.

Unlike other programming languages, Swift does not require you to create separate interface and implementation files for custom classes and structures.

Classes and structures in Swift have many things in common. Both can:

- Define properties to store values
- Define methods to provide functionality
- Define subscripts to provide access to their values using subscript syntax
- Define initializers to set up their initial state
- Be extended to expand their functionality beyond a default implementation
- Conform to protocols to provide standard functionality of a certain kind

Classes have additional capabilities that structures do not:

- Inheritance enables one class to inherit the characteristics of another.
- Type casting enables you to check and interpret the type of a class instance at runtime.
- Deinitializers enable an instance of a class to free up any resources it has assigned.
- Reference counting allows more than one reference to a class instance.
*/

/*:
**class**

You define a class with the class keyword followed by the class name. The class definition is contained with in a pair of braces.

`class SomeClass {`

// class definition

`}`
*/
// Create a class named Employee that has two vars which are strings, firstName and lastName. Let's include an init function to allow us to set the vars at the time the class is instantiated. An init function is always called at the time of instantiation and it works juts like a function except that you do not need to include the func keyword when defining it. Also include one function named getEmployeeData which has no parameters but returns a formatted name (lastName, firstName).
class Employee {
    
    var firstName: String
    var lastName: String
    
    init(first: String, last: String) {
        firstName = first
        lastName = last
    }
    
    func getEmployeeData() -> String {
        return "\(lastName), \(firstName)"
    }
}

// Create an instance of Employee passing in a first and last name and set it to a let.
let employee = Employee(first: "Steve", last: "Jobs")
// Now call the getEmployeeData function of Employee
employee.getEmployeeData()
/*:
Subclasses include their superclass name after their class name, separated by a colon. There is no requirement for classes to subclass any standard root class, so you can include or omit a superclass as needed.

`class ClassName: SuperClassName {`

`}`
*/
// Create a class named Developer that is a subclass of MyClass. It should have a let named group that is set to "AppDev". It should also override the getEmployeeData function to include the group in the formatted String that is returned.
class Developer: Employee {
    let group = "AppDev"
    override func getEmployeeData() -> String {
        return "\(super.getEmployeeData()): \(group)"
    }
}

// Create an instance of Developer and assign it to a let. You'll notice that you need to pass in first and last name when doing so. If you wanted to get around this you could override the init function in the Developer class. In this case you would have to set the values to something in the init, maybe empty strings? Then you could set them individually. We're not going to do that at this time so just pass in a name.
let developer = Developer(first: "Steve", last: "Jobs")
developer.getEmployeeData()
/*:
A property declaration in a class is written the same way as a constant or variable declaration, except that it is in the context of a class. Likewise, method and function declarations are written the same way.

`class SomeClass {`

var someProperty = "Our Property"

`}`
*/
// We've already added properties, the firstName and lastName in Employee and group in Developer are all properties
/*:
Methods on a subclass that override the superclass’s implementation are marked with override.

`override func someFunction() {`

`}`
*/
// We overrided the getEmployeeData method in Developer
/*:
You create an instance of a class by putting parentheses after the class name.

`var someVarClassName = SomeClass()`
*/
// This is what we did when creating employee and developer

/*:
You can use dot syntax to access the properties and methods of the instance.

`someClass.someFunction()`
*/
// This is how we called the getEmployeeData method in both instances.
  
/*:
**struct**

Use struct to create a structure. Structures support many of the same behaviors as classes, including methods and initializers. One of the most important differences between structures and classes is that structures are always copied when they are passed around in your code, but classes are passed by reference.
*/

/*:
A struct is created with the struct keyword.

`struct SomeStruct {`

// struct definition

`}`
*/
// Create a struct named Account it should include one let which is a String named accountName that will get initialized in the init method, and two vars which are Strings optionals one named username and one named password. We need to include an init method and should take one String parameter that will be accountName.
struct Account {
    let accountName: String
    var username: String?
    var password: String?
    
    init(accountName: String) {
        self.accountName = accountName
    }
}

// Create an instance of your struct that is a var.
var account = Account(accountName: "netflix")

// Use your instance of the struct to set the username and password properties.
account.username = "flixUser"
account.password = "pass1234"

/*:
If you create an instance of a structure and assign that instance to a constant, you cannot modify the instance’s properties, even if they were declared as variable properties.
*/
// Create an instance of your struct as a let
let constantAccount = Account(accountName: "iTunes")

// Try assigning values to username and password now
//constantAccount.username = "iTunesUser"
//constantAccount.password = "pass1234"
/*:
What happened?

This behavior is due to structures being value types. When an instance of a value type is marked as a constant, so are all of its properties.

The same is not true for classes, which are reference types. If you assign an instance of a reference type to a constant, you can still change that instance’s variable properties.
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
## Extensions

Extensions add new functionality to an existing class, structure, enumeration, or protocol type.

You can even extend types for which you do not have the source code to. For example you could extend String or Int etc ...

Extensions can add new functionality to a type, but they cannot override existing functionality.

*/

/*:
You can create an extension with the extension keyword.

`extension SomeType {`

`}`
*/
// Let's start by creating a String named cardinal that has a value of cardinal
let cardinal = "cardinal"

// Now let's get the number of characters in the String
cardinal.characters.count

//What if we could instead just do something like String.length? We can with the use of Extensions

// Let's create a String Extension. In our extension we'll create a var named length and use a getter to calculate the length.
extension String {
    var length: Int {
        get {
            return self.characters.count
        }
    }
}

// Now we can get the length of the string
cardinal.length
/*:
An extension can adapt one or more protocols.

You adapt a protocol in an extension just as you would in a struct or class.

`extension SomeType: SomeProtocol {`

`}`
*/
// Create a Protocol named Caps
protocol Capped {
    var capped: String{get}
}

// Now let's extend String again and have it conform to Capped protocol, then we'll have to implement the capped var
extension String: Capped {
    var capped: String {
        get {
            return self.capitalizedString
        }
    }
}

// Now we can call capped on our cardinal string
cardinal.capped


/*:
Extensions can add computed properties. The syntax is just like a computed property in a normal struct or class.

Extensions can also add initializers. The syntax is just like an initializer in a struct or class.

Extensions can add new instance methods and type methods to existing types.

Extensions can add new subscripts to an existing type.
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

