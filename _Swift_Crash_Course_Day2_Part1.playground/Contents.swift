import UIKit
/*:
![Local Image](Cardinal_Logo.png)

# Swift Crash Course
*A fast paced intro to Swift*

Day 2, Part 1
*/

/*:
### Optionals

When we talked about vars we mentioned that vars and lets must have a value at the time a structure is created.  The exception is an optional. An optional is a var that may or may not hold a value.

Optionals will always have a type.

The swift language makes heavy use of optionals, many functions return an optional.
*/

/*:
You declare an optional by adding a ? after the type in the declaration. In the case of the example below this would be an optional String.

`var someOptional:String?`
*/
// Create an optional String named userName.

/*:
To get the value of an optional you must unwrap it. There are a few options of how to do so.

Forced Unwrapping of an optional can be done by adding an explanation point after the optional. This is dangerous to do unless you are absolutley sure a value exists.
*/

/*:
You force unwrap something by adding an explanation mark after the var name.

`var newVar = someOptionalString!`
*/
// Try force unwrapping the userName optional String you created above and assigning it to a new let

/*:
What happened?

Unless you already set a value you should get an error because you are unwrapping an optional with no value.
*/
// Now assign a value to your userName optional.

// Try force unwrapping again.

/*:
What happened this time?

It should have succeeded.
*/

/*:
An alternative option to the forced unwrap is to test for nil first, and then unwrap.

`if someOptionalString != nil {
var aGoodVarWithAValue = someOptionalString!
}`
*/
// Check your userName optional for nil, then assign it to a new var if not nil.

// This time the forced unwrap is perfectly safe since we checked to make sure the optional had a value
/*:
**Optional Binding**

There is nothing wrong with the above code where we check for nil and then force unwrap. But Swift gives us a better solution, optional binding.

Option Binding uses an if statement and attempts to unwrap an option and assign it to a let all in one move. if this succeeeds, the body of the if block is performed. If not, meaning the optional had no value we move on and not perform the if block.

`if let tempString = someOptionalString  {
print((tempString), terminator: "")
}`
*/
// Use optional binding to assign the value of your userName optional to a new var.

/*:
**Implicitly Unwrapped Optional**

An Implicitly Unwrapped Optional can be used when you know a variable will always have a value. For example if you are setting the value at the time of initialization you can use a Implicitly Unwrapped Optional.

These can be avoided more often than not.

You create an Implicitly Unwrapped Optional by putting an explanation mark after the type during declaration instead of a question mark.

`var someImplicitlyUnwrappedOptional: String!`
*/
// Create an Implicitly Unwrapped Optional

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
// Here's a class named NetworkManager use it to create an Implicitly Unwrapped Optional
class NetworkManager {
    
    // create an Implicitly Unwrapped Optional named authToken that is an optional String.
    
    init() {
        // Set a value for authToken
    }
}

var networkManager = NetworkManager()
/*:
**Optional Chaining**

Optional chaining is a process in which you add a question mark after the value on which you are attempting to call a property, method or subscript.

This looks similar to forced unwrapping but does not trigger an error and fails gracefully when the value is nil.

The result of an optional chaining call is always an optional value.

You can use optional chaining with calls to properties, methods, and subscripts that are more than one level deep.

You add a question mark after the optional you wish to unwrap in the middle of a statement.

`someOptional?.someProperty`

*/
// Create a class named Guitar with a single var named guitarBrand which is an Optional String with no intitial value.

// Create a second class named RockBand that has a single var named guitar that is of type optional Guitar.

// Create a var named rockBand that is an instance of RockBand.

// Using the rockBand var we just created initialize the guitar var.

// Use optional chaining to try to get the value of the guitarBrand from the guitar var in RockBand and assign it to a new var named guitarBrand.

// What's the value now of the last var you created? It should be nil.

// What would have happened if we hadn't set the a value for rockBand.guitar and used forced unwrap instead of optional chaining?

// Try commenting out the line 
// rockBand.guitar = Guitar() 
// and the line 
// var guitarBrand = rockBand.guitar?.guitarBrand
// then uncomment this line 
//var guitarBrand = rockBand.guitar!.guitarBrand

/*:
You can use Optional Chainging to set values of properties.

`someClass.someVarOfAClass?.someProperty`
*/
// Use Optional Chaining to set the value of the guitarBrand var in guitar by way of the var of rockBand.

// Now if you try to get the value again through Optional Chaining like you did two steps ago it will have a value.
// uncomment this line
//var brandOfGuitar = rockBand.guitar?.guitarBrand
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
// Create an enum named Color that has 4 cases of colors.

/*:
The cases are not assigned a default integer value, instead they are fully-fledged values in their own right with a type of Color (if that is what you named the enum).

Multiple cases can appear on on a single line. seperated by commas.

`enum SomeEnum {`

case One, Two, Three, Four

`}`
*/

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
// Create a switch case to match each of your cases in your Color enum.

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
// Re-create your Color enum with a name RGBColor and give it associated values

/*:
Then you could use the color and set it's RGB like this.

`var loginButton = Color.Red(255, 0, 0)`
*/
// Set the associated value of the Green case of your RGBColor

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
// Create an enum named Link with a type String that lists some websites and sets their raw values as their addresses.

/*:
When you’re working with enumerations that store integer or string raw values, you don’t have to explicitly assign a raw value for each case. When you don’t, Swift will automatically assign the values for you.

When strings are used for raw values, the implicit value for each case is the text of that case’s name.
*/
// Create an enum named HexColor with type String that assigns raw values for two cases, but not the third.

// Print out the raw values of all three cases of the HexColor enum: print(HexColor.Red.rawValue)

// Now creat an enum named ErrorCode of type Int. Set the first two cases two be success = 200 and fail = 404, leave the third case timeout with no raw value.

// Now print out all three of those values.

/*:
Examples of using Enums 
*/

// In this example we are using an enum to set different types of Error, all of which are of type ErrorType
enum CoreDataSetupError: ErrorType {
    case PersistentStoreCreationError
    case ManagedObjectModelCreationError
    case DocumentsDirectoryUnavailableError
}

// Then we throw a particular error type depending on what error occurred. The enum just makes it cleaner to throw the different types of errors by grouping them together.

// If we uncomment this code we will get errors because this is some production code using classes we don't have acces to them here.

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



