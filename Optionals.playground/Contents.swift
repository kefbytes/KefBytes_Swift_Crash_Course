import UIKit
/*:
# Swift Crash Course

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
To get the value of an option you must unwrap it. There are a few options of how to do so.

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

// Check your optional for nil the assign it to a new var if it has a value.





/*:
**Optional Binding**

There is nothing wrong with the above, but a better solution is to use optional binding.

Option Binding uses an if statement and attempts to unwrap an option and assign it to a let all in one move. if this succeeeds the body of the if block is performed. If not, meaning the optional had no value we move on and not perform the if block.

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
*/

/*:
Add a question mark after the optional you wish to unwrap in the middle of a statement.

`someOptional?.someProperty`
*/


// Create a class named Class1 with a single var of type Optional String with no intitial value.





// Create a second class named Class2 that has a single var who's type is Optional Class1.





// Create a var that is instance of Class2.





// Set the var in Class2 to a new instance of Class1.





// Use optional chaining to try to get the value of the var in Class1 and assign it to a new var.





// What's the value now of the last var you created? It should be nil.


/*:
You can use Optional Chainging to set values of properties.

`someClass.someVarOfAClass?.someProperty`
*/

// Use Optional Chaining to set the value of the var in Class1 by way of the var of Class2.





// Now if you try to get the value again through Optional Chaining like you did two steps ago it will have a value.

