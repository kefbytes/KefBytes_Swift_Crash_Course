import UIKit
/*:
# Swift Crash Course
*A fast paced intro to Swift*

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

// Create a class named MyClass





/*:
Subclasses include their superclass name after their class name, separated by a colon. There is no requirement for classes to subclass any standard root class, so you can include or omit a superclass as needed.

`class ClassName: SuperClassName {`

`}`
*/

// Create a class that is a subclass of OurSuperClass





/*:
A property declaration in a class is written the same way as a constant or variable declaration, except that it is in the context of a class. Likewise, method and function declarations are written the same way.

`class SomeClass {`

    var someProperty = "Our Property"

`}`
*/

// add a property declaration to the class you just created.





/*:
Methods on a subclass that override the superclass’s implementation are marked with override.

`override func someFunction() {`

`}`
*/

// Add the function someFunction that returns a String to your class and override it since it resides in OurSuperClass.





/*:
You create an instance of a class by putting parentheses after the class name.

`var someVarClassName = SomeClass()`
*/

// Create an instance of your class





/*:
You can use dot syntax to access the properties and methods of the instance.

`someClass.someFunction()`
*/

// call someFunction from the class instance you created.






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

// Create a struct named MyStruct.





// Add a property to your struct.





// Create an instance of your struct that is a var.





// Use your instance of the struct to change the value of the property.






/*:
If you create an instance of a structure and assign that instance to a constant, you cannot modify the instance’s properties, even if they were declared as variable properties.
*/

// Create an instance of your struct that is a let





// Try changing the property of the struct using the instance that is a let.





/*:
What happened?

This behavior is due to structures being value types. When an instance of a value type is marked as a constant, so are all of its properties.

The same is not true for classes, which are reference types. If you assign an instance of a reference type to a constant, you can still change that instance’s variable properties.
*/



