import UIKit
/*:
![Local Image](Cardinal_Logo.png)

# Swift Crash Course
*A fast paced intro to Swift*

Day 1, Part 3
*/

/*:
### Optionals

When we talked about vars we mentioned that vars and lets must have a value at the time a structure is created.  The exception is an optional. An optional is a var that may or may not hold a value.

Optionals will always have a type.

The swift language makes heavy use of optionals, many functions return an optional.
*/

/*:
You declare an optional by adding a ? after the type in the declaration.

`var someOptional:String?`
*/
// Create an optional String.

var optional1:String?

/*:
To get the value of an optional you must unwrap it. There are a few options of how to do so.

Forced Unwrapping of an optional can be done by adding an explanation point after the optional. This is dangerous to do unless you are absolutley sure a value exists.
*/

/*:
You force unwrap something by adding an explanation mark after the var name.

`var newVar = someOptionalString!`
*/
// Try force unwrapping the optional you created above and assigning it to a new var

//var var1 = optional1!

/*:
What happened?

Unless you already set a value you should get an error because you are unwrapping an optional with no value.
*/

// Now assign a value to your optional, just as you would any other var.

optional1 = "Hannah"

// Try force unwrapping again.

var var1 = optional1!

/*:
What happened this time?

It should have succeeded.
*/

/*:
One option is to test for nil first.

`if someOptionalString != nil {
var aGoodVarWithAValue = someOptionalString!
}`
*/

// Check your optional for nil then assign it to a new var if it has a value.

if optional1 != nil {
    var var1 = optional1!
}

/*:
**Optional Binding**

There is nothing wrong with the above, but there is a better solution in Swift, optional binding.

Option Binding uses an if statement and attempts to unwrap an option and assign it to a let all in one move. if this succeeeds, the body of the if block is performed. If not, meaning the optional had no value we move on and not perform the if block.

`if let tempString = someOptionalString  {
print((tempString), terminator: "")
}`
*/

// Use optional binding to assign the value of your optional to a new var.

if let tempVar = optional1 {
    var var1 = optional1
    var var2 = tempVar
}

/*:
**Implicitly Unwrapped Optional**

An Implicitly Unwrapped Optional can be used when you know a variable will always have a value. For example if you are setting the value at the time of initialization you can use a Implicitly Unwrapped Optional.

These can be avoided more often than not.
*/

/*:
You create an Implicitly Unwrapped Optional by putting an explanation mark after the type instead of a question mark.

`var someImplicitlyUnwrappedOptional: String!`
*/

// Create an Implicitly Unwrapped Optional

let optional2:String!

optional2 = "Cardinal"

/*:
Implicitly unwrapped optionals are useful when an optional’s value is confirmed to exist immediately after the optional is first defined and can definitely be assumed to exist at every point thereafter.

The primary use of implicitly unwrapped optionals in Swift is during class initialization.

For example you create an optional and then immediately set it's value during init.

`class SomeClass {`

var ourOptional:String!

init() {
ourOptional = SomeOtherClass.someFuncThatReturnsAValue()
}

`}`
*/
class SomeClass {
    
    var ourOptional:String!
    
    init() {
        ourOptional = "Hannah"
        print(ourOptional)
    }
}

var class1 = SomeClass()
/*:
**Optional Chaining**

Optional chaining is a process in which you add a question mark after the value on which you are attempting to call a property, method or subscript.

This looks similar to forced unwrapping but does not trigger an error and fails gracefully when the value is nil.

The result of an optional chaining call is always an optional value.

You can use optional chaining with calls to properties, methods, and subscripts that are more than one level deep.

You add a question mark after the optional you wish to unwrap in the middle of a statement.

`someOptional?.someProperty`

*/

// Create a class named Class1 with a single var of type Optional String with no intitial value.

class Class1 {
    
    var name:String?
    
}

// Create a second class named Class2 that has a single var who's type is Optional Class1.

class Class2 {
    
    var class1:Class1?
    
}

// Create a var that is intialized as an instance of Class2.

var class2 = Class2()

// Set the var in Class2 to a new instance of Class1.

class2.class1 = Class1()

// Use optional chaining to try to get the value of the var in Class1 and assign it to a new var.

var name = class2.class1?.name

// What's the value now of the last var you created? It should be nil.

// What would have happened if we hadn't set the a value for class2.class1 and used forced unwrap instead of optional chaining?

var name1 = class2.class1!.name

/*:
You can use Optional Chainging to set values of properties.

`someClass.someVarOfAClass?.someProperty`
*/

// Use Optional Chaining to set the value of the var in Class1 by way of the var of Class2.

class2.class1?.name = "Hannah"

// Now if you try to get the value again through Optional Chaining like you did two steps ago it will have a value.

var name2 = class2.class1?.name


/* Optional example */

let numArray = [1,2,5,7,9]
let ourNumber = 7

func checkOffendingNumber(numToCheck: Int, arrayOfNums: [Int]) -> Int {
    
    for tempNum in arrayOfNums {
        if tempNum == numToCheck {
            return numToCheck
        }
    }
    return 0
}

checkOffendingNumber(ourNumber, arrayOfNums: numArray)

//if checkOffendingNumber(ourNumber, arrayOfNums: numArray) {
//    print("Number Found")
//}

/*:
## Enumerations

An enumeration defines a common type for a group of related values and enables you to work with those values in a type-safe way within your code.

Enumerations in Swift are first-class types in their own right.

Enumerations adopt many features traditionally supported only by classes, such as computed properties to provide additional information about the enumeration’s current value, and instance methods to provide functionality related to the values the enumeration represents.
*/

/*:
You create an Enumeration with the enum keyword.

`enum SomeEnum {`

case One

case Two

case Three

case Four

`}`
*/

// Create an enum of four Colors

enum Color {
    
    case Magenta
    
    case Cyan
    
    case Yellow
    
    case Black
    
}

/*:
The cases are not assigned a default integer value, instead they are fully-fledged values in their own right with a type of Color (if that is what you named the enum).

Multiple cases can appear on on a single line. seperated by commas.

`enum SomeEnum {`

case One, Two, Three, Four

`}`
*/
enum Color2 {
    case Red, Green, Blue
}
/*:
You can match enum values in a switch statement.

`var number = SomeEnum.Two`

`switch number {`

case .One

// do something

case .Two

// do something

case .Three

// do something

case .Four

// do something

default

// do something

`}`
*/

// Create a switch case to match each of your cases in your Colors enum.

var buttonColor = Color.Cyan

switch buttonColor {
    
case.Magenta:
    print("The button is magenta")
case.Cyan:
    print("The button is cyan")
case.Yellow:
    print("The button is yellow")
case.Black:
    print("The button is black")
    
}

/*:
**Associated Values**

You can define Swift enumerations to store associated values of any given type, and the value types can be different for each case of the enumeration if needed.

You can define the type for the case like so.

`enum SomeEnum {`

case One(Int)

case Two(Int)

case Three(Int)

case Four(Int)

`}`

Suppose for your Color enum you wanted to allow a user to set the RGB values. You would define the enum to hold three ints like so.

`enum Color {`

case Red(Int, Int, Int)

case Green(Int, Int, Int)

case Blue(Int, Int, Int)

`}`
*/

// Create an enum that uses associated values.

enum RGBColor {
    
    case Red(Int, Int, Int)
    
    case Green(Int, Int, Int)
    
    case Blue(Int, Int, Int)
    
}

/*:
Then you could use the color and set it's RGB like this.

`var loginButton = Color.Red(255, 0, 0)`
*/

// Set the associated value of one of the cases of the enum you just created.

var loginButton  = RGBColor.Red(255, 0, 0)

/*:
**Raw Values**

As an alternative to associated values, enumeration cases can come prepopulated with default values (called raw values), which are all of the same type.

If a value (known as a “raw” value) is provided for each enumeration case, the value can be a string, a character, or a value of any integer or floating-point type.

You can define a common set of related cases as part of one enumeration, each of which has a different set of values of appropriate types associated with it.

`enum TextColor: String {`

case Red = "25500"

case Green = "02550"

case Blue = "00255"

`}`
*/

// Create an enum that has raw values.

enum TextColor: String {
    
    case Red = "25500"
    
    case Green = "02550"
    
    case Blue = "00255"
    
}

print(TextColor.Red)
print(TextColor.Red.rawValue)

/*:
When you’re working with enumerations that store integer or string raw values, you don’t have to explicitly assign a raw value for each case. When you don’t, Swift will automatically assign the values for you.

When strings are used for raw values, the implicit value for each case is the text of that case’s name.
*/

enum HexColor: String {
    
    case Red = "FF0000"
    
    case Green = "00FF00"
    
    case Blue
}

print(HexColor.Red.rawValue)
print(HexColor.Green.rawValue)
print(HexColor.Blue.rawValue)


enum ErrorCode: Int {
    
    case success = 200
    
    case fail = 404
    
    case timeout
    
}

print(ErrorCode.success.rawValue)
print(ErrorCode.fail.rawValue)
print(ErrorCode.timeout.rawValue)

/* Examples of using Enums */

// In this example we are using an enum to set different types of Error, all of which are of type ErrorType
enum CoreDataSetupError: ErrorType {
    case PersistentStoreCreationError
    case ManagedObjectModelCreationError
    case DocumentsDirectoryUnavailableError
}

// Then we throw a particular error type depending on what error occurred. The enum just makes it cleaner to throw the different types of errors by grouping them together.

//func getPersistentStoreCoordinator(storageType: CoreDataStorageType) throws -> NSPersistentStoreCoordinator {
//    guard let model = getManagedObjectModel() else {
//        throw CoreDataSetupError.ManagedObjectModelCreationError
//    }
//    
//    let coordinator = NSPersistentStoreCoordinator(managedObjectModel: model)
//    
//    if let documentsDirectory = FileUtils.getApplicationDocumentsDirectory() {
//        let url = documentsDirectory.URLByAppendingPathComponent(modelName)
//        let failureReason = "There was an error creating or loading the application's saved data."
//        let storage = storageType == .InMemory ? NSInMemoryStoreType : NSSQLiteStoreType
//        let storageURL: NSURL? = storageType == .InMemory ? nil : url
//        
//        do {
//            try coordinator.addPersistentStoreWithType(storage, configuration: nil, URL: storageURL, options: nil)
//        } catch {
//            // TODO: Log this when logging framework is available
//            var dict = [String: AnyObject]()
//            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data"
//            dict[NSLocalizedFailureReasonErrorKey] = failureReason
//            dict[NSUnderlyingErrorKey] = error as NSError
//            
//            let wrappedError = NSError(domain: AppValues.Errors.ErrorDomain, code: 9999, userInfo: dict)
//            NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
//            throw CoreDataSetupError.PersistentStoreCreationError
//        }
//        
//        return coordinator
//    } else {
//        throw CoreDataSetupError.DocumentsDirectoryUnavailableError
//    }
//}

// In this example we're using enums to define different levels of logging

public enum LWSLogLevel: Int {
    case None = 0
    case Error = 1
    case Warning = 2
    case Info = 3
    case Debug = 4
}

public enum LCLogLevel: String {
    case None = "NONE"
    case Error = "ERROR"
    case Warning = "WARNING"
    case Info = "INFO"
    case Debug = "DEBUG"
}

// Then we have a function to retrieve the allowed logging level. The function actually returns one of our enums and uses the other in an eqaulity check.

//private static func fetchLogLevel() -> LWSLogLevel {
//    
//    if let path = NSBundle.mainBundle().pathForResource(plist, ofType: plistFileType),
//        let plistDictionary: [String: AnyObject] = NSDictionary(contentsOfFile: path) as? [String: AnyObject],
//        let level = plistDictionary["LCLogLevel"] {
//            
//            if let storedLogLevel: NSString = level as? NSString {
//                
//                if storedLogLevel == LCLogLevel.None.rawValue {
//                    return .None
//                } else if storedLogLevel == LCLogLevel.Debug.rawValue {
//                    return .Debug
//                } else if storedLogLevel == LCLogLevel.Info.rawValue {
//                    return .Info
//                } else if storedLogLevel == LCLogLevel.Warning.rawValue {
//                    return .Warning
//                } else if storedLogLevel == LCLogLevel.Error.rawValue {
//                    return .Error
//                } else {
//                    // default
//                    return .None
//                }
//            }
//    }
//    return .None
//}

/*: -------------------------------------------------------------------------------------------------
**guard**

A guard statement, like an if statement, executes statements depending on the Boolean value of an expression. You use a guard statement to require that a condition must be true in order for the code after the guard statement to be executed. Unlike an if statement, a guard statement always has an else clause—the code inside the else clause is executed if the condition is not true.

`guard let something = someUnknownThing else {
return
}`
*/

// Write a guard statement

// first the if version
let successfulResponse:String? = "Success"

if let response = successfulResponse {
    print("response is good")
} else {
    print("no response handle the error")
}

// now the guard version
enum ResponseError: ErrorType {
    case NoResponse
    case TimeOut
}

guard let response = successfulResponse else {
    // the response was a failure so handle it
    throw ResponseError.NoResponse
}
// proceed with the response


/*:
If the guard statement’s condition is met, code execution continues after the guard statement’s closing brace. Any variables or constants that were assigned values using an optional binding as part of the condition are available for the rest of the code block that the guard statement appears in.

If that condition is not met, the code inside the else branch is executed. That branch must transfer control to exit the code block that that guard statement appears in. It can do this with a control transfer statement such as return, break, continue, or throw, or it can call a function or method that doesn’t return, such as fatalError().

Using a guard statement for requirements improves the readability of your code, compared to doing the same check with an if statement. It lets you write the code that’s typically executed without wrapping it in an else block, and it lets you keep the code that handles a violated requirement next to the requirement.
*/

