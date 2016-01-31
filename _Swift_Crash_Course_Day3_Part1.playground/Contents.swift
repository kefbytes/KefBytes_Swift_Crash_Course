import UIKit
/*:
![Local Image](Cardinal_Logo.png)

# Swift Crash Course
*A fast paced intro to Swift*

Day 3, Part 1
*/
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


// Create an instance of Employee passing in a first and last name and set it to a let.

// Now call the getEmployeeData function of Employee

/*:
Subclasses include their superclass name after their class name, separated by a colon. There is no requirement for classes to subclass any standard root class, so you can include or omit a superclass as needed.

`class ClassName: SuperClassName {`

`}`
*/
// Create a class named Developer that is a subclass of MyClass. It should have a let named group that is set to "AppDev". It should also override the getEmployeeData function to include the group in the formatted String that is returned.

// Create an instance of Developer and assign it to a let. You'll notice that you need to pass in first and last name when doing so. If you wanted to get around this you could override the init function in the Developer class. In this case you would have to set the values to something in the init, maybe empty strings? Then you could set them individually. We're not going to do that at this time so just pass in a name.

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


// Create an instance of your struct that is a var.

// Use your instance of the struct to set the username and password properties.

/*:
If you create an instance of a structure and assign that instance to a constant, you cannot modify the instance’s properties, even if they were declared as variable properties.
*/
// Create an instance of your struct as a let

// Try assigning values to username and password now

/*:
What happened?

This behavior is due to structures being value types. When an instance of a value type is marked as a constant, so are all of its properties.

The same is not true for classes, which are reference types. If you assign an instance of a reference type to a constant, you can still change that instance’s variable properties.
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

// Now let's get the number of characters in the String

//What if we could instead just do something like String.length? We can with the use of Extensions

// Let's create a String Extension. In our extension we'll create a var named length and use a getter to calculate the length.

// Now we can get the length of the string

/*:
An extension can adapt one or more protocols.

You adapt a protocol in an extension just as you would in a struct or class.

`extension SomeType: SomeProtocol {`

`}`
*/
// Create a Protocol named Caps

// Now let's extend String again and have it conform to Capped protocol, then we'll have to implement the capped var

// Now we can call capped on our cardinal string

/*:
Extensions can add computed properties. The syntax is just like a computed property in a normal struct or class.

Extensions can also add initializers. The syntax is just like an initializer in a struct or class.

Extensions can add new instance methods and type methods to existing types.

Extensions can add new subscripts to an existing type.
*/


/*:
## Generics

Generic code enables you to write flexible, reusable functions and types that can work with any type, subject to requirements that you define. You can write code that avoids duplication and expresses its intent in a clear, abstracted manner. Much of the Swift standard library is built with generic code.

Swift’s Array and Dictionary types are both generic collections.
*/
// Create a function named swapTwoInts that takes two Ints and swaps their values, you'll have to mark these as inout parameters so that the change will occur outside our function as well

// test it out by creating two Ints and passing them to our swapTwoInts function. Don't forget to preceed the arguments with an ampersand since they are inout parameters

/*:
Wouldn't it be better to have a function that swaps any two values of any type?

Let's change our func to use generics.
The first thing you need to do is define the function named swapTwoValues that uses a type parameter. You do this by placing some arbitrary name inside angled brackets. This goes before the parameters.

func swapTwoValues<T> ...

Then you use that type parameter as a placeholder for the type of the parameters
*/
// create a function named swapTwoValues that uses a type parameter <T>. The body of the function is exactly the same as our swapTwoInts

// First let's try out our new swapTwoValues with our two ints (firstInt and secondInt)

// But now we can swap two of anything, not just Ints

// Let's try it with Strings. Create two Strings and pass them to our swapTwoValues function

/*:
In this example the type of the two parameters must be the same

The type will be determined when the function is called, and inferred using whatever is passed in

In most cases, type parameters have descriptive names, such as Key and Value in Dictionary<Key, Value> and Element in Array<Element>, which tells the reader about the relationship between the type parameter and the generic type or function it’s used in. However, when there isn’t a meaningful relationship between them, it’s traditional to name them using single letters such as T, U, and V.
*/

// You can provide more than one type parameter by writing multiple type parameter names within the angle brackets, separated by commas.

/*:
In addition to generic functions, Swift enables you to define your own generic types. These are custom classes, structures, and enumerations that can work with any type, in a similar way to Array and Dictionary.
*/

// Example:
struct Stack<Element> {
    var items = [Element]()
    mutating func push(item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

// mutating allows us to change the value of items within our function

// You can extend a generic type

/*:
**Mixing Swift and Objective C**

To import a set of Objective-C files in the same app target as your Swift code, you rely on an Objective-C bridging header to expose those files to Swift. Xcode offers to create this header file when you add a Swift file to an existing Objective-C app, or an Objective-C file to an existing Swift app.

To import Objective-C code into Swift from the same target

In your Objective-C bridging header file, import every Objective-C header you want to expose to Swift. For example:

#import "XYZCustomCell.h"
#import "XYZCustomView.h"
#import "XYZCustomViewController.h"

In Build Settings, in Swift Compiler - Code Generation, make sure the Objective-C Bridging Header build setting under has a path to the bridging header file.
The path should be relative to your project, similar to the way your Info.plist path is specified in Build Settings. In most cases, you should not need to modify this setting.

When you import Swift code into Objective-C, you rely on an Xcode-generated header file to expose those files to Objective-C. This automatically generated file is an Objective-C header that declares the Swift interfaces in your target. It can be thought of as an umbrella header for your Swift code. The name of this header is your product module name followed by adding "-Swift.h".

Once you import your Swift code into Objective-C, use regular Objective-C syntax for working with Swift classes.
*/

/*:
When I wanted to add a swift class and access it from an Obj C class.

I had to add this import to any class that wanted to access the swift class

#import "LOWES-swift.h"

Make sure the new swift file has the Target Membership set in the File Inspector.

Items marked as private in Swift will not be available in Obj-C
*/


