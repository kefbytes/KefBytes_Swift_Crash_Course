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



/*:
To get the value of an optional you must unwrap it. There are a few options of how to do so.

Forced Unwrapping of an optional can be done by adding an explanation point after the optional. This is dangerous to do unless you are absolutley sure a value exists.
*/

/*:
You force unwrap something by adding an explanation mark after the var name.

`var newVar = someOptionalString!`
*/



// Try force unwrapping the optional you created above and assigning it to a new var



/*:
What happened?

Unless you already set a value you should get an error because you are unwrapping an optional with no value.
*/

// Now assign a value to your optional, just as you would any other var.



// Try force unwrapping again.



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



/*:
**Optional Binding**

There is nothing wrong with the above, but there is a better solution in Swift, optional binding.

Option Binding uses an if statement and attempts to unwrap an option and assign it to a let all in one move. if this succeeeds, the body of the if block is performed. If not, meaning the optional had no value we move on and not perform the if block.

`if let tempString = someOptionalString  {
print((tempString), terminator: "")
}`
*/

// Use optional binding to assign the value of your optional to a new var.



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



// Create a second class named Class2 that has a single var who's type is Optional Class1.



// Create a var that is intialized as an instance of Class2.



// Set the var in Class2 to a new instance of Class1.



// Use optional chaining to try to get the value of the var in Class1 and assign it to a new var.



// What's the value now of the last var you created? It should be nil.

// What would have happened if we hadn't set the a value for class2Var.optionalClass and used forced unwrap instead of optional chaining?



/*:
You can use Optional Chainging to set values of properties.

`someClass.someVarOfAClass?.someProperty`
*/

// Use Optional Chaining to set the value of the var in Class1 by way of the var of Class2.



// Now if you try to get the value again through Optional Chaining like you did two steps ago it will have a value.



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

// Create a switch case to match each of your cases in your Colors enum.



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



/*:
Then you could use the color and set it's RGB like this.

`var loginButton = Color.Red(255, 0, 0)`
*/

// Set the associated value of one of the cases of the enum you just created.



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



/*:
When you’re working with enumerations that store integer or string raw values, you don’t have to explicitly assign a raw value for each case. When you don’t, Swift will automatically assign the values for you.

When strings are used for raw values, the implicit value for each case is the text of that case’s name.
*/
