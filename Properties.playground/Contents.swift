import UIKit
/*:
# Swift Crash Course
*A fast paced intro to Swift*

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

// Create a struct with a couple properties





/*:
**Stored Properties**

A stored property is a constant or variable that is stored as part of an instance of a particular class or structure.

Stored properties are provided only by classes and structures.

A stored property does not has a backing store instance variable like it would in ObjC. There are no instance variables in Swift.
*/

// The properties you created just above where stored properties. Add one more stored property to the struct.





/*:
**Lazy Stored Properties**

A lazy stored property is a property whose initial value is not calculated until the first time it is used. You indicate a lazy stored property by writing the lazy modifier before its declaration.

Lazy Stored Properties will always be vars.

`struct someStruct {
    lazy var someVar = someValue
}`
*/

// Add a lazy stored property to your struct.





/*:
One reason you might want to use a lazy stored property would be when we may not always need the property and getting it's value might be someone complicated. In this case we wouldn't want to calculate the value each time the struct is used, so we use the lazy stored property to save on overhead.
*/

/*:
Example
*/
class AComplicatedClass {
    // assume that instantiating this class does some complicated and resource intensive stuff that would slow down the app even if just momentarily.
}

class AClass {
    
    // we may not always need this property and getting it's value is complicated so only create it when needed
    lazy var aLazyProp = AComplicatedClass()
}

/*:
If you create an instance of a structure and assign that instance to a constant, you cannot modify the instance’s properties, even if they were declared as variable properties
*/

/*:
Example
*/

struct SomeStruct {
    var firstValue: Int
    let secondValue: Int
}

let someConstant = SomeStruct(firstValue: 0, secondValue: 4)
// This next line will throw an error if uncommented because we cannot set firstValue since someConstant is a let.
// someConstant.firstValue = 6


/*:
**Computed Properties**

Computed properties are provided by classes, structures, and enumerations.

Computed properties do not actually store a value. Instead, they provide a getter and an optional setter to retrieve and set other properties and values indirectly.

`var computedProp:Type {
    get {
        do some computations
    }
    set {
        do some computations
    }
}`
*/

// Add a computed property to your struct. The computation could be as simple as adding 1 to an Int or "The" to a String.





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

//simplified version - must have implicit type
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

// Add a property observer to your stored property you just created and have it print out each time you set the value. ex. print("Value Set")





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

// add a type property to your struct





/*:
You access type properties with dot notation.

`SomeStructure.storedTypeProperty`
*/


/*:
When in a class you can use class instead of static.

`class SomeClass {
    class var classTypeProp = someValue
}`
*/
