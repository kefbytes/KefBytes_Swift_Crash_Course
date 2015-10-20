import UIKit
/*:
# Swift Crash Course
*A fast paced intro to Swift*

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

// Define a basic protocol with no var or methods yet.





/*:
To conform to a protocol you add it after the type's name, sperated by a colon.

`struct SomeStruct:SomeProtocol {`
    
`}`
*/

// Create a structure that conforms to youf protocol.





/*:
If class has a superclass list it before any protocols seperated by a comma.

`class SomeClass: SomeSuperClass, SomeProtocol {`
    
`}`
*/

// Change the structure above to extend 'SomeSuperClass'.





/*:
A protocol can require any conforming type to provide an instance property or type property with a particular name and type. The protocol also specifies whether each property must be gettable or gettable and settable.

`protocol SomeProtocol {`

    var someVar:String {get}

    var anotherVar:Int {get set}

`}`

*/

// Add a couple properties to your protocol defined above.





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

// Add an initializer to your protocol.





/*:
**Delegation**

Delegation is a design pattern that enables a class or structure to hand off (or delegate) some of its responsibilities to an instance of another type. 

The delegation design pattern is implemented by defining a protocol that encapsulates the delegated responsibilities.
*/


/*:
You can extend an existing type to adopt and conform to a new protocol, even if you do not have access to the source code for the existing type.
*/



