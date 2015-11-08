import UIKit
/*:
# Swift Crash Course
*A fast paced intro to Swift*

## Extensions

Extensions add new functionality to an existing class, structure, enumeration, or protocol type. 

You can even extend types for which you do not have the source code to. For example you could extend String or Int etc ...

Extensions can add new functionality to a type, but they cannot override existing functionality.

We have a couple things that are going to help us in this section. The first is avery simple struct named Greetings, the other is a very simple protocol named GreetingProtocol. These are both located in our Sources folder and available to us right now.
*/

/*:
You can create an extension with the extension keyword.

`extension SomeType {`

`}`
*/


// Extent the struct Greetings.

print("Hello")

for var i = 0; i < 5; i++ {
    print(i)
}



/*:
An extension can adapt one or more protocols.

You adapt a protocol in an extension just as you would in a struct or class.

`extension SomeType: SomeProtocol {`

`}`
*/

// Have the extension greated above adapt to the GreetingProtocol protocol.





/*:
Extenions can add computed properties. The syntax is just like a computed property in a normal struct or class.

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

/*:
When you define a protocol extension, you can specify constraints that conforming types must satisfy before the methods and properties of the extension are available. You write these constraints after the name of the protocol you’re extending using a where clause.

You can use protocol extensions to provide a default implementation to any method or property requirement of that protocol. If a conforming type provides its own implementation of a required method or property, that implementation will be used instead of the one provided by the extension.
*/

