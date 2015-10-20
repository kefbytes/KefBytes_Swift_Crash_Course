import UIKit
/*:
# Swift Crash Course
*A fast paced intro to Swift*

## Functions

Every function in Swift has a type, consisting of the function’s parameter types and return type. You can use this type like any other type in Swift, which makes it easy to pass functions as parameters to other functions, and to return functions from functions. Functions can also be written within other functions to encapsulate useful functionality within a nested function scope.

Here is the syntax for creating a function. In this function we are naming the parameters param1 and param2.

`func someFunc(param1: String, param2: String) -> String {`

    let response = success

    // do something

    return response

`}`
*/

// Create a function that takes two Strings as parameters and returns a String.





/*:
If a function is not going to return anything you can omit the arrow and return type.

`func someFunc(param1: String, param2: Int) {`

    // do something

`}`
*/

// Create a function that takes an Int and a String as parameters and doesn't return anything.





/*: 
If a function is not going to take any parameters you can omit those

`func someFunc() {`

    // do something

`}`
*/

// Create a function that takes no parameters and returns nothing.






/*:
If you don't care about naming a parameter you can just substitute an underscore.

`func someFunc(param1: String, _: String) -> String {`

    let response = "success"

    // do something

    return response

`}`
*/

// Create a function where one of the parameters is not named.






/*:
A function can return multiple values with a tuple.

`func someFunc()->(String, String) {`

    return ("Hannah", "Noah")

`}`
*/

// Create a function that returns a tuple.





/*:
A function can also return an optional tuple.

`func someFunc()->(String, String)? {`

    return ("Hannah", "Noah")

`}`
*/

// Create a function that returns an optional tuple.






/*:
This is different than returning a Tuple of optionals

`func someFunc()->(String?, String?) {`

    return ("Hannah", "Noah")

`}`
*/

// Create a function that returns two optionals.





/*:
Function parameters have both an external parameter name and a local parameter name. An external parameter name is used to label arguments passed to a function call. A local parameter name is used in the implementation of the function.

By default, the first parameter omits its external name, and the second and subsequent parameters use their local name as their external name. All parameters must have unique local names. Although it’s possible for multiple parameters to have the same external name, unique external names help make your code more readable.

You write an external parameter name before the local parameter name it supports, separated by a space.

If you provide an external parameter name for a parameter, that external name must always be used when you call the function.

`func someFunc(externalparam1Name param1: String, externalparam2Name param2: String) -> String {`

    let response = "success"

    // do something

    return response

`}`
*/

// Create a function that has external names for it's parameters.





/*: 
You can set default values for parameters in your functions.

`func someFunc2(daughter:String = "Hannah", son:String)->(String, String) {`

    return ("Hannah", "Noah")

`}`

*/

// Create a function that sets default values for it's parameters.





/*:
**variadic parameters**

A variadic parameter accepts zero or more values of a specified type.

The values passed to a variadic parameter are made available within the function’s body as an array of the appropriate type.

A function may have at most one variadic parameter.

`func someFunc1(numbers: Int ...) {`

    for number in numbers {

    print(number)

    }

`}`
*/

// Create a function that takes a variadic parameter.





/*:
Function parameters are constants by default.

You can define variable parameters by prefixing the parameter name with the var keyword.

`func someFunc1(var number: Int) {`

    number++

`}`
*/

// Create a function that takes a variable parameter.





/*: 
**in-out parameters**

Variable parameters can only be changed within the function itself. If you want a function to modify a parameter’s value, and you want those changes to persist after the function call has ended, define that parameter as an in-out parameter instead.

You write an in-out parameter by placing the inout keyword at the start of its parameter definition.

You can only pass a variable as the argument for an in-out parameter. You cannot pass a constant or a literal value as the argument, because constants and literals cannot be modified.

`func someFunc1(inout number: Int) {`

    number++

`}`
*/

// Create a function that takes an inout parameter.





/*:
You place an ampersand (&) directly before a variable’s name when you pass it as an argument to an in-out parameter, to indicate that it can be modified by the function.

`someFunc1(&someInt)`
*/

// Call you function that has an inout parameter, passing it an Int





/*: 
##Function Types

Every function has a specific function type, made up of the parameter types and the return type of the function.

`func someFunc4(aString: String, anotherString: String) -> Int {`

    return 3

`}`

The funct type of the above func is (String, String) -> Int
*/

/*:
Function types can be used just like any other types in Swift. You can define a constant or variable to be of a function type and assign an appropriate function to that variable.

`func someIntFunc(a: Int, b: Int) -> Int {`

    return a + b

`}`

`var anIntFunc: (Int, Int) -> Int = someIntFunc`

In anIntFunc the type of the var is a function type and it must equal a function with a matching function type.
*/

// Create a var with a type that matches one of the functions you created above and set it's value to that function.





/*:
You can use a function type such as (Int, Int) -> Int as a parameter type for another function. This enables you to leave some aspects of a function’s implementation for the function’s caller to provide when the function is called.

`func someIntFunc(a: Int, b: (Int, Int) -> Int) -> Int {`

    return something

`}`

In this func the second parameter has a function type as it's parameter type
*/

// Create a function that takes a function type as one of it's parameters.





/*:
You can also use a function type as the return type of another function. You do this by writing a complete function type immediately after the return arrow (->) of the returning function.

`func intFunc(a: Int) -> (Int, Int) -> Int {`

    return someIntFunc

`}`

In this function the return type it a function type of (Int, Int) -> Int
*/




/*:
Functions can be nested inside other functions

Nested functions have access to variables that were declared in the outer function. You can use nested functions to organize the code in a function that is long or complex.

`func outFunc(inout a:Int) -> Int {`

    func innerFunc() {

        print(a)

    }

    return ++a

`}`

`var b = 3`
`var c = outFunc(&b)`
*/

// Create a function that has a second function nested inside it.


/* :
Function calls can be wrapped in a print line.

`print(someFunc(someVar))`
*/






