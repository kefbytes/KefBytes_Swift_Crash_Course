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

// Create a class named MyClass that has one func named greetings which takes no parameter and returns the string "Hello"

class MyClass {
    func greetings() -> String {
        return "Hello"
    }
}
/*:
Subclasses include their superclass name after their class name, separated by a colon. There is no requirement for classes to subclass any standard root class, so you can include or omit a superclass as needed.

`class ClassName: SuperClassName {`

`}`
*/

// Create a class named MySubClass that is a subclass of MyClass

class MySubClass: MyClass {
    
    let name = "Hannah"
    
    override func greetings() -> String {
        return "\(super.greetings()) \(name)"
    }
}
/*:
A property declaration in a class is written the same way as a constant or variable declaration, except that it is in the context of a class. Likewise, method and function declarations are written the same way.

`class SomeClass {`

var someProperty = "Our Property"

`}`
*/

// add a constant property named "name" and assign a value to it in MySubClass

/*:
Methods on a subclass that override the superclass’s implementation are marked with override.

`override func someFunction() {`

`}`
*/

// Add the function greetings to MySubClass and override it since it resides in MyClass. This method should call the super class version of greetings and then add the constant property name to it.



/*:
You create an instance of a class by putting parentheses after the class name.

`var someVarClassName = SomeClass()`
*/

// Create an instance of MySubClass

var mySubClass = MySubClass()

/*:
You can use dot syntax to access the properties and methods of the instance.

`someClass.someFunction()`
*/

// call greetings from the class instance you created.

mySubClass.greetings()  

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

// Create a struct named MyStruct.

struct MyStruct {
    
    var name = "Hannah"
}

// Add a var property to your struct.



// Create an instance of your struct that is a var.

var myStruct = MyStruct()

// Use your instance of the struct to change the value of the property.

myStruct.name = "Noah"

/*:
If you create an instance of a structure and assign that instance to a constant, you cannot modify the instance’s properties, even if they were declared as variable properties.
*/

// Create an instance of your struct that is a let

//let myStruct2 = MyStruct()
//
//// Try changing the property of the struct using the instance that is a let.
//
//myStruct2.name = "Rosie"


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
*/

/*:
Define a protocol with the "protocol" keyword.

`protocol SomeProtocol {`

`}`

*/

// Define a basic protocol named MyProtocol with no var or methods yet.

//protocol MyProtocol {
//    
//}

/*:
To conform to a protocol you add it after the type's name, sperated by a colon.

`struct SomeStruct:SomeProtocol {`

`}`
*/

// Create a structure that conforms to your protocol.

//struct OurStruct: MyProtocol {
//    
//}

/*:
If class has a superclass list it before any protocols seperated by a comma.

`class SomeClass: SomeSuperClass, SomeProtocol {`

`}`
*/

// Create a class name OurClass with super class MyClass and conforms to MyProtocol

//class OurClass: MyClass, MyProtocol {
//    
//}

/*:
A protocol can require any conforming type to provide an instance property or type property with a particular name and type. The protocol also specifies whether each property must be gettable or gettable and settable.

`protocol SomeProtocol {`

var someVar:String {get}

var anotherVar:Int {get set}

`}`

*/

// Create a new Protocol named OurProtocol that defines a couple properties, one for name which is only gettable, and one for age which is gettable or settable


/*:
You can create type property requirements with the "static" keyword.

`protocol SomeProtocol {`

static var someVar:String {get}

var anotherVar:Int {get set}

`}`
*/

// Change one of your properties to be a type property.

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

// Add a method to your protocol.


/*:
As with type property requirements, you always prefix type method requirements with the static keyword when they are defined in a protocol.

`protocol SomeProtocol {`

static var someVar:String {get}

var anotherVar:Int {get set}

func someFunc()

static func someTypeFunc()

`}`
*/

// Add a type method to your protocol

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

// Move your protocol down here and add an initializer to your protocol.

//protocol OurProtocol {
//    
//    init(age: Int)
//    static var name: String{get}
//    var age: Int{get set}
//    func greeting()
//    static func goodBye()
//}
/*:
**Delegation**

Delegation is a design pattern that enables a class or structure to hand off (or delegate) some of its responsibilities to an instance of another type.

The delegation design pattern is implemented by defining a protocol that encapsulates the delegated responsibilities.
*/

// Let's create a new class named Person that conforms to OurProtocol

//class Person: OurProtocol {
//    
//    required init(age: Int) {
//        self.age = age
//    }
//    static var name: String {
//        get {
//            return self.name
//        }
//    }
//    
//    var age: Int {
//        get {
//            return self.age
//        }
//        set {
//            print("Setting Age")
//        }
//    }
//    
//    func greeting() {
//        print("hello \(age) year old")
//    }
//    
//    static func goodBye() {
//        print("Goodbye")
//    }
//}

// You'll notice the error, what this is telling us is we need to implement the elements to conform to the protocol

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
// Let's start by creating a String

let hannah = "hannah"

// Now let's get the number of characters in the String

hannah.characters.count

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

hannah.length
/*:
An extension can adapt one or more protocols.

You adapt a protocol in an extension just as you would in a struct or class.

`extension SomeType: SomeProtocol {`

`}`
*/

// Create a Protocol named Caps

protocol Cap {
    var cap: String{get}
}

// Now let's extend String again and have it conform to Caps protocol, then we'll have to implement the caps var

extension String: Cap {
    var cap: String {
        get {
            return self.capitalizedString
        }
    }
}

// Now we can call caps on our hannah string

hannah.cap


/*:
Extensions can add computed properties. The syntax is just like a computed property in a normal struct or class.

Extensions can also initializers. The syntax is just like an initializer in a struct or class.

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
// First let's define a protocol named RandomNumberGenerator

protocol RandomNumberGenerator {
    func random() -> Double
}

// now define a struct named battleResult that comforms to RandomNumberGenerator


// Now let's extend our RandomNumberGenerator protocol to include a func that returns a random Bool

extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return random() > 0.5
    }
}

struct BattleResult: RandomNumberGenerator {
    
    var damage: Double {
        get{
            return random()
        }
        set{
            damage += random()
        }
    }
    
    func random() -> Double {
        return drand48()
    }
    
}

// Now we can create an instance of BattleResult and call randomBool on it

let battleResult = BattleResult()
let directHit = battleResult.randomBool()


// And of course we're still able to call damage as well

let battleDamage = battleResult.random()


/*:
You can use protocol extensions to provide a default implementation to any method or property requirement of that protocol. If a conforming type provides its own implementation of a required method or property, that implementation will be used instead of the one provided by the extension.
*/

/*:
## Error Handling

Swift provides first-class support for throwing, catching, propagating, and manipulating recoverable errors at runtime.

In Swift, errors are represented by values of types that conform to the ErrorType protocol.

enums are particularly useful when defining error types.

*/
// Let's create an enum that throws errors associaed with reading a file

enum FileReadingError: ErrorType {
    case FileDoesNotExist(fileName: String)
    case FileIsWrongType
    case FileIsCorrupt
}

/*:
Throwing an error lets you indicate that something unexpected happened and the normal flow of execution can’t continue. You use a throw statement to throw an error.
*/

// Create a struct that will attempt to read a file, and without doing anything else let's throw a FileDoesNotExist error

//struct FileReader {
//    func readFile() throws {
//        throw FileReadingError.FileDoesNotExist(fileName: "SomeFile.xml")
//    }
//}

// What does the error say? We need to declare that our func can throw an error

/*:
**Propagating Errors**

If a function, method or initializer can throw an error, you include the throws keyword in the definition before the return type.

`func someFunc() throws -> String {`

return "SomeString"

`}`

A throwing function propagates errors that are thrown inside of it to the scope from which it’s called.
*/

// Let's try creating that struct again, but this time define the function with the throws keyword



// Better, but honestly we're not just going to automatically throw an error. We only want to throw it if the error actually occurs



// Redo our struct one more time using a guard statement to determine when to throw the error

struct FileReader {
    func readFile() throws {
        guard readFileSuccessfully() else {
            throw FileReadingError.FileDoesNotExist(fileName: "SomeFile.xml")
        }
        
    }
    
    func readFileSuccessfully() -> Bool {
        let battleResult = BattleResult()
        return battleResult.randomBool()
    }
}

/*:
When an error is thrown, some surrounding piece of code must be responsible for handling the error. For example, by correcting the problem, trying an alternative approach, or informing the user of the failure.

There are four ways to handle errors in Swift.

- propagate the error from a function to the code that calls that function

- handle the error using a do-catch statement

- handle the error as an optional value

- assert that the error will not occur


Write the try keyword—or the try? or try! variation—before a piece of code that calls a function, method, or initializer that can throw an error.
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

// Rewrite our struct to use a do-catch

struct FileReader2 {
    func readFile() throws {
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

/*:
**Converting Errors to Optional Values**

You use try? to handle an error by converting it to an optional value. If an error is thrown while evaluating the try? expression, the value of the expression is nil.

Suppose you are calling the function you called earlier that throws an error.

`var someVar = try? readFileSuccessfully()`

If readFileSuccessfully() throws an error, the value of someVar is nil otherwise it gets value returned by the function.
*/

// It would look something like this

//struct FileReader6 {
//    func readFile() throws {
//        _ = try? readFileSuccessfully()
//    }
//    
//    func readFileSuccessfully() throws -> Bool {
//        let battleResult = BattleResult()
//        return battleResult.randomBool()
//    }
//
//}

/*:
**Disabling Error Propagation**

Sometimes you know a throwing function or method won’t, in fact, throw an error at runtime. On those occasions, you can write try! before the expression to disable error propagation and wrap the call in a runtime assertion that no error will be thrown. If an error actually is thrown, you’ll get a runtime error.

`let someVar = try! someFunctionGuaranteedToWork()`
*/


/*:
**defer**

You use a defer statement to execute a set of statements just before code execution leaves the current block of code. This code always gets executed whether we are exiting the scope because of an error or a return statement or whatever.

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

struct FileReader6 {
    
    func readFile() throws {
        defer {
            cleanUp()
        }
    }
    
    func readFileSuccessfully() throws -> Bool {
        let battleResult = BattleResult()
        return battleResult.randomBool()
    }
    
    func cleanUp() {
        print("log, free up etc ...")
    }
    
}

