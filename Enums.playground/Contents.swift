import UIKit
/*:
# Swift Crash Course
*A fast paced intro to Swift*

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

// Create an enum of Colors that have all their cases on a single line.





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

// Create ab enum that has raw values.





/*:
When you’re working with enumerations that store integer or string raw values, you don’t have to explicitly assign a raw value for each case. When you don’t, Swift will automatically assign the values for you.

When strings are used for raw values, the implicit value for each case is the text of that case’s name.
*/
