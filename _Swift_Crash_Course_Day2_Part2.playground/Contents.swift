import UIKit
/*:
# Swift Crash Course
*A fast paced intro to Swift*

Day 2 Part 2

## Functions

Every function in Swift has a type, consisting of the function’s parameter types and return type. You can use this type like any other type in Swift, which makes it easy to pass functions as parameters to other functions, and to return functions from functions. Functions can also be written within other functions to encapsulate useful functionality within a nested function scope.

Here is the syntax for creating a function. In this function we are naming the parameters param1 and param2.

`func someFunc(param1: Type, param2: Type) -> Type {`

// do something

return something

`}`
*/
// Create a function named firstAndLastName that takes two Strings as parameters and returns a String.

/*:
If a function is not going to return anything you can omit the arrow and return type.
*/
// Create a function named nameAndAge that takes an Int and a String as parameters and doesn't return anything.

/*:
If a function is not going to take any parameters you can omit those
*/
// Create a function named hello that takes no parameters and returns nothing.

// Call the hello function

//Create the same hello function that takes one parameter, name, which is a String. The function should print out a greeting using the name parameter passed in.

// Call the new hello function passing in a name

//Create another hello function that takes two parameters, the same name one we just used and a second one named numberOfTimes which is an Int. The function should call the hello function that takes one parameter in a loop that runs the number of times as the Int parameter passed in.

// Call the newest hello function passing in a name and an Int.

//We ended up with the first basic hello function and then two overloaded versions

/*:
You can set default values for parameters in your functions.

Let's start a new version of a similar function. Start by creating a func named greeting that takes a single parameter, name, which is a String and has a default value of "World". This function is going to call our hello function which takes one parameter(name).
*/

// Call our greeting function and don't pass it any value.

// Try calling the same greeting function again, but this time pass in a name

/*:
Function parameters have both an external parameter name and a local parameter name. We use the external name when calling the function and passing in the arguments. A local parameter name is used within the implementation of the function.

By default, the first parameter omits its external name, and the second and subsequent parameters use their local name as their external name. All parameters must have unique local names. Although it’s possible for multiple parameters to have the same external name, unique external names help make your code more readable.

You write an external parameter name before the local parameter name it supports, separated by a space.

If you provide an external parameter name for a parameter, that external name must always be used when you call the function.
*/
// Create a new version of greeting, giving the name parameter an external name of personWithName. Let's also add a second parameter, numberOfTimes which is an Int.

// Now when we call the new greeting function we must use the external name for our String parameter.

/*:
**variadic parameters**

A variadic parameter accepts zero or more values of a specified type.

You use a variadic parameter to specify that the parameter can be passed a varying number of input values when the function is called.

The values passed to a variadic parameter are made available within the function’s body as an array of the appropriate type.

A function may have at most one variadic parameter.

func variadicFunction(numbers:Int...) {

}
*/
// Create a function named calculateGrade that takes a Int variadic parameter of testScores.

// Call the calculateGrade function passing in some test scores and assign the result ot a var named grade

/*:
Function parameters are constants by default.

You can define variable parameters by prefixing the parameter name with the var keyword.

func varFunc(var number: Int) {

}
*/
// Create a function named calculateGradeWithXtraCredit that takes a Int variable parameter and adds 10 to it.

// test out the calculateGradeWithXtraCredit function by passing it a grade

/*:
A function can return multiple values with a tuple.
*/
// Create a function named getCredentials that returns a tuple of two Strings with external names,userName and password.

// Call getCredentials assigning the returned tuple to a let named credentials

/*:
We can then reference the credntials by index or by their external name.
*/
// Reference the elements of credentials by index

// Reference the elements by external name

/*:
We also could have assigned the result to a tuple.
*/
// Call getCredentials again and assign the result to a tuple.

/*:
Now we access the elements by name within the tuple
*/
// Try accessing them

/*:
A function can also return an optional tuple.
*/
// Create a function named getUser that returns an optional tuple.

/*:
This is different than returning a Tuple of optionals
*/
// Create a function named getEmployeeFromID that returns two optionals.

/*:
functions can be assigned to constants or variables
*/
// Assign the getCredentials function to a let

// Now we can use the constant to call the function

/*:
**in-out parameters**

Variable parameters can only be changed within the function itself. If you want a function to modify a parameter’s value, and you want those changes to persist after the function call has ended, define that parameter as an in-out parameter instead.

You write an in-out parameter by placing the inout keyword at the start of its parameter definition.

You can only pass a variable as the argument for an in-out parameter. You cannot pass a constant or a literal value as the argument, because constants and literals cannot be modified.


*/
// Create a function named deductFromGradeForLateSubmition that takes an Int inout parameter and subtracts 10 from it.

/*:
You place an ampersand (&) directly before a variable’s name when you pass it as an argument to an in-out parameter, to indicate that it can be modified by the function.
*/
// Call your deductFromGradeForLateSubmition function passing it the grade var we declared earlier

/*:
**Function Types**

Every function has a specific function type, made up of the parameter types and the return type of the function.

`func someFunc4(aString: String, anotherString: String) -> Int {`

return 3

`}`

The funct type of the above func is (String, String) -> Int
*/

/*:
Function types can be used just like any other types in Swift. You can define a constant or variable to be of a function type and assign an appropriate function to that variable.
*/
// Create a let named calculateGradeFunc with a type that matches the type of calculateGradeWithXtraCredit and assign that function to the let.

/*:
You can use a function type such as (Int, Int) -> Int as a parameter type for another function. This enables you to leave some aspects of a function’s implementation for the function’s caller to provide when the function is called.
*/
// Create a function named semesterGrade that takes the same function type that we just used in calculateGradeFunc as one of it's parameters.

/*:
You can also use a function type as the return type of another function. You do this by writing a complete function type immediately after the return arrow (->) of the returning function.
*/
//func semesterGrade(a: Int) -> (Int...) -> Int {
//    return calculateGradeFunc
//}
/*:
Functions can be nested inside other functions

Nested functions have access to variables that were declared in the outer function. You can use nested functions to organize the code in a function that is long or complex.
*/
// Create a function named finalGrade that has a second function nested inside it.

/*:
Function calls can be wrapped in a print line.

print(someFunc(7))
*/

/*:
## Closures

Closures are self-contained blocks of functionality that can be passed around and used in your code.

Closures can capture and store references to any constants and variables from the surrounding context in which they are defined.

Global and nested functions are actually special cases of closures.

Closures take one of three forms:

- Global functions are closures that have a name and do not capture any values.

- Nested functions are closures that have a name and can capture values from their enclosing function.

- Closure expressions are unnamed closures written in a lightweight syntax that can capture values from their surrounding context.
*/

/*:
**Closure Expressions**
Closure expressions are a way to write inline closures in a brief, focused syntax. They are especially useful when you work with functions or methods that take functions as one or more of their arguments.

Closure expression syntax has the following general form.

`{ (parameters) -> return type in
statements
}`
*/

/*:
Here is a function that sorts two strings, we will be using it in our exploration of closures. It's a very simple function that takes two Strings and returns false if the first String comes before the second String alphabetically.
*/
func backwards(s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

/*:
Here's an example of using the backwards function.
*/
backwards("Bruce", "Wayne")

// Here's an array of colors that we'll be using
var colors = ["Red", "Green", "Blue", "Yellow"]
/*:
Swift's standard Library provides a sort(_:) method which accepts a closure that takes two arguments of the same type as the type of array we want to sort. In this case we have an Array of Strings so the closure takes two Strings and returns a Bool saying whether the first argument should appear before the second argument.
*/

/*:
We're going to start our exporation by passing our backwards function as the closure to the sort function on our colors array.

It will look like this.
*/
var reverseSortedColors = colors.sort(backwards)

/*:
In the above example we passed a ready made function as the closure to our sort method. But what if that function wasn't ready made and we wanted to create it on the fly?
*/
// Create a new var named reversedColors that is the same as our reverseSortedColors var but substitues a closure for backwards. The closure should match the implementation of backwards, so it does the same thing but we are going to write out the functionality so we can customize it.

/*:
In that example we passed an unnamed closure.

The start of the closure’s body is introduced by the in keyword. This keyword indicates that the definition of the closure’s parameters and return type has finished, and the body of the closure is about to begin.

In our example because we are sorting on an Array of Strings it is unnecessary to provide the type in our arguments. Swift can infer the type based on the Array we are sorting on.
*/
// Redo the reversedColors var, naming it reversedColors2 and remove the String types from the parameters.

/*:
In addition to the parameter types it's also unnecessary to provide the return type. Swift can infer that as well.
*/
// Create reversedColors3 removing the return type

/*:
While we're at it let's put it all on one line since it's so short.
*/
// Create reversedColors4 putting everything on one line

/*:
And we don't need those parens around our parameters either.
*/
// Create reversedColors5 removing the parens

/*:
Single-expression closures can implicitly return the result of their single expression by omitting the return keyword from their declaration. So we shorten it even more.
*/
// Create reversedColors6 removing the return keyword

/*:
Swift provides shorthand argument names to inline closures; $0, $1, $2 etc..

When using these you can omit the argument list, and also the in keyword as well because the closure is made up of only it's body.
*/
// Create reversedColors7 removing the parameters and the in keyword and change the argument names to use the shorthand version

/*:
Wow, that is quite a bit shorter than our original function that we stuck in there.

But believe it or not this can be shorted even more. Swift’s String type defines its string-specific implementation of the greater-than operator (>) as a function that has two parameters of type String, and returns a value of type Bool. This exactly matches the function type needed by the sort(_:) method. Therefore, you can simply pass in the greater-than operator, and Swift will infer that you want to use its string-specific implementation.
*/
// var reverseSortedColors8 = colors.sort( > )
/*:
**Trailing Closures**

If you need to pass a closure expression to a function as the function’s final argument and the closure expression is long, it can be useful to write it as a trailing closure instead. A trailing closure is a closure expression that is written outside of (and after) the parentheses of the function call it supports:

Trailing closures are most useful when the closure is sufficiently long that it is not possible to write it inline on a single line.
*/
func someFunctionThatTakesAClosure(closure: () -> Void) {
    // function body goes here
}

// here's how you call this function without using a trailing closure:

someFunctionThatTakesAClosure({
    // closure's body goes here
})

// here's how you call this function with a trailing closure instead:

someFunctionThatTakesAClosure() {
    // trailing closure's body goes here
}

/*:
This means our reverseSortedColors7 var above could have been written like this.
*/
var reversedColors7a = colors.sort() { $0 > $1 }

/*:
And if the trailing closure is the only argument passed you can omit the ()
*/
var reversedColors7b = colors.sort{ $0 > $1 }

