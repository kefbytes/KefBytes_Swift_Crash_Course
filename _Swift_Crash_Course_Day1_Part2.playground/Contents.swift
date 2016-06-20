import UIKit
/*:
![Local Image](Cardinal_Logo.png)

# Swift Crash Course
*A fast paced intro to Swift*

Day 1, Part 2
*/

/*:
**AnyObject**

- AnyObject is a type alias that can represent an instance of any class type. It is mainly there for compatability with ObjC.

- Any is also a type alias and can represent an instance of any type at all, including function types.

It's always better to specify a type if possible rather than use AnyObject or Any

Objective-C does not have explicitly typed arrays, therefore it is possible to get arrays of AnyType when working with Cocoa APIs. But often you know which type they hold. In these cases you can downcast the item to a more specific type with as!

*/

/*:
I created a simple Song class that we can use to create objects of type Song. It is accessible from our playground here.

To creat an object in Swift you use syntax like this:
ObjectType()

Alternatively you can pass in parameters when creating the object.

In the case of a Song object it has an init function which takes two parameters, nameIn & artistIn.

So to create a Song object we will use something like this.

Song(nameIn: "Name of Song", artistIn: "Name of Artist")
*/
// Create and array named songs that holds a type of AnyObject and has three Song objects

// Iterate over the Array and set each item to be of type Song, we can do so because we know the Array holds Songs

// Can you create a shorter by casting to the type Song in the for loop declaration?

// Create an Array named items with type Any. It should hold a String, an Int and a Song

// While iterating over the Array we use a switch case to find the type of each item. Uncomment this to see it work

//for item in items {
//    
//    switch item {
//    case is String:
//        print("Album name: \(item)")
//    case is Int:
//        print("Year released: \(item)")
//    case is Song:
//        var song = item as! Song
//        print("song title: \(song.name), artist: \(song.artist)")
//    default:
//        print("Found something unexpected")
//    }
//    
//}

/*:
**Tuple**

Tuples hold multiple values

The elements of a tuple can be referred to either by name or by number.

The values within a tuple can be of any type and do not have to be of the same type as each other.

Tuples are useful for temporary groups of related values.

*/

/*:
You can create a var that is a Tuple by seperating the values by a comma, naming the values is optional.

`let someTuple = (valueName:value, valueName:value)`
*/
// Create a Tuple named album that holds two values, one is a String named albumName, the other is an Int named releaseData.

/*:
You can access the values of the Tuples by number

`someTuple.0`
*/
// Access the second value of the album Tuple you created and assign it to a new let

/*:
You can also access the value of a Tuple by name, if you assigned names when creating it.

`someTuple.valueName`
*/
// Access the first value of your album Tuple by name and assign it to a new let

/*:
**Type Alias**

Type aliases define an alternative name for an existing type. You define type aliases with the typealias keyword.

Type aliases are useful when you want to refer to an existing type by a name that is contextually more appropriate, such as when working with data of a specific size from an external source.

typealias name = existingType

Many times you will see typealias used to define a function defition like so.

typealias funcDef = (String, String) -> String
*/
// Create a typealias named AudioSample  that is of type UInt16

/*:
Once you define a type alias, you can use the alias anywhere you might use the original name.
*/
//var maxAmplitudeFound = AudioSample.min

/*:
Here, AudioSample is defined as an alias for UInt16. Because it is an alias, the call to AudioSample.min actually calls UInt16.min, which provides an initial value of 0 for the maxAmplitudeFound variable.

In Swift a function definition takes parameters inside () seperated by commas and returns a type after ->

So in this case  (String, Int) -> Void, a function would take a String and an Int as arguments and return Void meaning it doesn't return anything at all.
*/
// create a typealias named Response that defines a function definition of (String) -> Void

// Now we can use the Response typealias anywhere a function definition can be used, uncomment the setup func
//func setup(completion: Response) {
//    
//}

/*:
### Properties

Properties associate values with a particular class, structure, or enumeration.

Properties are usually associated with instances of a particular type. However, properties can also be associated with the type itself. Such properties are known as type properties.

Properties can be either stored properties or computed properties.

Stored properties occur in a class or struct.
Computed properties occur in a class, struct or enum.
*/

/*:
You create a property much like you would a var or let, the difference is it is created within a class, struct or enum, yet outside of any function.

`struct MyStruct {
let myProperty = "A Property"
var anotherproperty = 2
}`
*/
// Create a struct named Account with a couple properties which are Strings, one being a let named accountName, the other being a var named accountPassword.

//

/*:
**Stored Properties**

A stored property is a constant or variable that is stored as part of an instance of a particular class or structure.

Stored properties are provided only by classes and structures.

A stored property does not have a backing store instance variable like it would in ObjC. There are no instance variables in Swift.
*/
// The properties you created just above were stored properties. Add one more stored property to the struct named expirationDate which should be an Int.

/*:
**Lazy Stored Properties**

A lazy stored property is a property whose initial value is not calculated until the first time it is used. You indicate a lazy stored property by writing the lazy modifier before its declaration.

Lazy Stored Properties will always be vars.

`struct someStruct {
lazy var someVar = someValue
}`
*/
// Add a lazy stored property named intitialLogin to your struct.

/*:
One reason you might want to use a lazy stored property would be when we may not always need the property and getting it's value might be something complicated. In this case we wouldn't want to calculate the value each time the struct is used, so we use the lazy stored property to save on overhead.
*/

/*:
Example
*/
class APICallForUserInfo {
    // assume that instantiating this class does some complicated and resource intensive stuff that would slow down the app even if just momentarily.
    // call API
    // API queries large DB
    // Return is parsed 
    // etc
}

class AccountUser {
    
    // we may not always need this property and getting it's value is overhead so only create it when needed
    lazy var userData = APICallForUserInfo()
}

/*:
If you create an instance of a structure and assign that instance to a constant, you cannot modify the instance’s properties, even if they were declared as variable properties
*/
// Create an instance of our Account struct named account and assign it to a constant

// check for the value of our accountName var

// try changing the value of the var property

// account.accountPassword = "adminUser"

/*:
**Computed Properties**

Computed properties are provided by classes, structures, and enumerations.

Computed properties do not actually store a value. Instead, they provide a getter and an optional setter to retrieve and set other properties and values indirectly.

Example:
`var computedProp:Type {
get {
return do some computations
}
set {
do some computations
}
}`
*/
// Add a computed property to your struct named credentials. It should return a String that gives the accountName and accountPassword.

/*:
Example
*/
struct Point {
    var xCoord: Int
    var yCoord: Int
}

struct ScreenSize {
    let width = 320
    let height = 420
}

struct Button {
    var newPoint:Point
    
    var center:Point {
        get {
            let screen:ScreenSize = ScreenSize()
            let center = Point(xCoord: screen.width - 2, yCoord: screen.height - 2)
            return center
        }
        set {
            let screen:ScreenSize = ScreenSize()
            newPoint.xCoord = newValue.xCoord - (screen.width / 2)
            newPoint.yCoord = newValue.yCoord - (screen.height / 2)
        }
    }
}

// read only version
struct Button2 {
    var newPoint:Point
    
    var center:Point {
        get {
            let screen:ScreenSize = ScreenSize()
            let center = Point(xCoord: screen.width - 2, yCoord: screen.height - 2)
            return center
        }
        
    }
}

//simplified version - must have explicit type, if no setter we can remove the get keyword
struct Button3 {
    var newPoint:Point
    
    var center:Point {
        let screen:ScreenSize = ScreenSize()
        let center = Point(xCoord: screen.width - 2, yCoord: screen.height - 2)
        return center
        
    }
}


/*:
**Property Observers**

Property observers observe and respond to changes in a property’s value. Property observers are called every time a property’s value is set, even if the new value is the same as the property’s current value.

You can add property observers to any stored properties you define, apart from lazy stored properties. You can also add property observers to any inherited property (whether stored or computed) by overriding the property within a subclass.

`var computedProp:Type {
get {
do some computations
}
set {
do some computations
}
willSet {
do something
}
didSet {
do something
}
}`
*/

// Add a property observer to one of your stored properties in the struct

/*:
**Global & Local Variables**

The capabilities described above for computing and observing properties are also available to global variables and local variables. Global variables are variables that are defined outside of any function, method, closure, or type context. Local variables are variables that are defined within a function, method, or closure context.

Global constants and variables are always computed lazily, in a similar manner to Lazy Stored Properties. Unlike lazy stored properties, global constants and variables do not need to be marked with the lazy modifier.
*/

/*:
**Type Properties**

Instance properties are properties that belong to an instance of a particular type. Every time you create a new instance of that type, it has its own set of property values, separate from any other instance.

You can also define properties that belong to the type itself, not to any one instance of that type. There will only ever be one copy of these properties, no matter how many instances of that type you create. These kinds of properties are called type properties.

Unlike stored instance properties, you must always give stored type properties a default value. This is because the type itself does not have an initializer that can assign a value to a stored type property at initialization time.

Stored type properties are lazily initialized on their first access. They are guaranteed to be initialized only once, even when accessed by multiple threads simultaneously, and they do not need to be marked with the lazy modifier.

You define type properties with the static keyword.

`struct SomeStructure {
static var storedTypeProperty = "Some value."
}`
*/
// add a type property to your struct named loginAPI

/*:
You access type properties with dot notation.

`SomeStructure.storedTypeProperty`
*/
// uncomment the next line
// Account.loginAPI
/*:
When in a class you can use class instead of static.

`class SomeClass {
class var classTypeProp = someValue
}`
*/

