import UIKit

import UIKit
/*:
# Swift Crash Course
*A fast paced intro to Swift*

## Functions

Every function in Swift has a type, consisting of the function’s parameter types and return type. You can use this type like any other type in Swift, which makes it easy to pass functions as parameters to other functions, and to return functions from functions. Functions can also be written within other functions to encapsulate useful functionality within a nested function scope.

Here is the syntax for creating a function. In this function we are naming the parameters param1 and param2.

`func someFunc(param1: Type, param2: Type) -> Type {`

// do something

return something

`}`
*/
// Create a function that takes two Strings as parameters and returns a String.

func someFunc(param1: String, param2: String) -> String {
    
    let response = "success"
    
    // do something
    
    return response
    
}


/*:
If a function is not going to return anything you can omit the arrow and return type.
*/
// Create a function that takes an Int and a String as parameters and doesn't return anything.

func someFunc(param1: String, param2: Int) {
    
    print("entered someFunc2")
    
}


/*:
If a function is not going to take any parameters you can omit those
*/
// Create a function that takes no parameters and returns nothing.

func someFunc() {
    
}


/*:
If you don't care about naming a parameter you can just substitute an underscore.
*/
// Create a function where one of the parameters is not named.

func someFunc(param1: String, _: String) -> String {
    
    let response = "success"
    
    // do something
    
    return response
    
}


/*:
A function can return multiple values with a tuple.
*/
// Create a function that returns a tuple.

func someFunc()->(String, String) {
    
    return ("Hannah", "Noah")
    
}


/*:
A function can also return an optional tuple.
*/
// Create a function that returns an optional tuple.

func someFunc()->(String, String)? {
    
    return ("Hannah", "Noah")
    
}




/*:
This is different than returning a Tuple of optionals
*/
// Create a function that returns two optionals.

func someFunc()->(String?, String?) {
    
    return ("Hannah", "Noah")
    
}



/*:
Function parameters have both an external parameter name and a local parameter name. An external parameter name is used to label arguments passed to a function call. A local parameter name is used in the implementation of the function.

By default, the first parameter omits its external name, and the second and subsequent parameters use their local name as their external name. All parameters must have unique local names. Although it’s possible for multiple parameters to have the same external name, unique external names help make your code more readable.

You write an external parameter name before the local parameter name it supports, separated by a space.

If you provide an external parameter name for a parameter, that external name must always be used when you call the function.
*/

// Create a function that has external names for it's parameters.
func someFunc(externalparam1Name param1: String, externalparam2Name param2: String) -> String {
    
    let response = "success"
    
    // do something
    
    return response
    
}





/*:
You can set default values for parameters in your functions.
*/

// Create a function that sets default values for it's parameters.
func someFunc(daughter:String = "Hannah", son:String)->(String, String) {
    
    return ("Hannah", "Noah")
    
}




/*:
**variadic parameters**

A variadic parameter accepts zero or more values of a specified type.

The values passed to a variadic parameter are made available within the function’s body as an array of the appropriate type.

A function may have at most one variadic parameter.
*/

// Create a function that takes a variadic parameter.
func someFunc(numbers: Int ...) {
    for number in numbers {
        print(number)
    }
}




/*:
Function parameters are constants by default.

You can define variable parameters by prefixing the parameter name with the var keyword.
*/

// Create a function that takes a variable parameter.
func someFunc1(var number: Int) {
    number++
}




/*:
**in-out parameters**

Variable parameters can only be changed within the function itself. If you want a function to modify a parameter’s value, and you want those changes to persist after the function call has ended, define that parameter as an in-out parameter instead.

You write an in-out parameter by placing the inout keyword at the start of its parameter definition.

You can only pass a variable as the argument for an in-out parameter. You cannot pass a constant or a literal value as the argument, because constants and literals cannot be modified.
*/

// Create a function that takes an inout parameter.
func someFunc(inout number: Int) {
    number++
}


/*:
You place an ampersand (&) directly before a variable’s name when you pass it as an argument to an in-out parameter, to indicate that it can be modified by the function.
*/

// Call you function that has an inout parameter, passing it an Int
var someInt = 11
someFunc(&someInt)
someInt


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
*/

// Create a var with a type that matches one of the functions you created above and set it's value to that function.
func someIntFunc(a: Int, b: Int) -> Int {
    
    return a + b
    
}

var anIntFunc: (Int, Int) -> Int = someIntFunc


/*:
You can use a function type such as (Int, Int) -> Int as a parameter type for another function. This enables you to leave some aspects of a function’s implementation for the function’s caller to provide when the function is called.
*/

// Create a function that takes a function type as one of it's parameters.
func someIntFunc(a: Int, b: (Int, Int) -> Int) -> Int {
    
    return 7
    
}




/*:
You can also use a function type as the return type of another function. You do this by writing a complete function type immediately after the return arrow (->) of the returning function.
*/
func intFunc(a: Int) -> (Int, Int) -> Int {
    
    return someIntFunc
    
}



/*:
Functions can be nested inside other functions

Nested functions have access to variables that were declared in the outer function. You can use nested functions to organize the code in a function that is long or complex.
*/

// Create a function that has a second function nested inside it.

func outFunc(inout a:Int) -> Int {
    
    func innerFunc() {
        
        print(a)
        
    }
    
    return ++a
    
}

var b = 3
var c = outFunc(&b)

/* :
Function calls can be wrapped in a print line.
*/

print(someFunc(7))


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

backwards("Noah", "Hannah")

// Let's create an Array of colors
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

We could do that by doing something like this.
*/
var reverseSortedColors2 = colors.sort({ (s1: String, s2: String) -> Bool in
    return s1 > s2
})

/*:
In that example we passed an unnamed closure.

The start of the closure’s body is introduced by the in keyword. This keyword indicates that the definition of the closure’s parameters and return type has finished, and the body of the closure is about to begin.

In our example because we are sorting on an Array of Strings it is unnecessary to provide the type in our arguments and we can shorten it to this. Swift can infer the type based on the Array we are sorting on.
*/

var reverseSortedColors3 = colors.sort({ (s1, s2) -> Bool in
    return s1 > s2
})

/*:
In addition to the parameter types it's also unnecessary to provide the return type.

So the example can be further reduced to this.
*/

var reverseSortedColors4 = colors.sort({ (s1, s2) in
    return s1 > s2
})

/*:
While we're at it let's put it all on one line since it's so short. And we don't need those parens around our parameters either.
*/

var reverseSortedColors5 = colors.sort({ s1, s2 in return s1 > s2 })

/*:
Single-expression closures can implicitly return the result of their single expression by omitting the return keyword from their declaration. So we shorten it even more.
*/

var reverseSortedColors6 = colors.sort({ s1, s2 in s1 > s2 })

/*:
Swift provides shorthand argument names to inline closures; $0, $1, $2 etc..

When using these you can omit the argument list, and also the in keyword as well because the closure is made up of only it's body.
*/

var reverseSortedColors7 = colors.sort({ $0 > $1 })

/*:
Wow, that is quite a bit shorter than our original function that we stuck in there.

But believe it or not this can be shorted even more. Swift’s String type defines its string-specific implementation of the greater-than operator (>) as a function that has two parameters of type String, and returns a value of type Bool. This exactly matches the function type needed by the sort(_:) method. Therefore, you can simply pass in the greater-than operator, and Swift will infer that you want to use its string-specific implementation.
*/

var reverseSortedColors8 = colors.sort( > )

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

var reverseSortedColors7a = colors.sort() { $0 > $1 }

/*:
And if the trailing closure is the only argument passed you can omit the ()
*/

var reverseSortedColors7b = colors.sort{ $0 > $1 }

/*:
Here's another example.

We start with a class which has an init that takes a closure as a parameter. It also has a function named testAnotherCallback that takes two parameters, a String and a closure.
*/

class SomeStackSetup {
    init (handleSuccessfulCompletion: String -> Void) {
        // do something and if successful call handleSuccessfulCompletion
        handleSuccessfulCompletion("responseString")
    }
    
    func testAnotherCallback (name: String, whenDone: (String) -> Void) {
        print(">>>>> SomeStackSetup.testAnotherCallback() name = \(name) <<<<<")
        whenDone("Hannah")
    }
}

/*:
Now we'll define a ViewController class that calls the SomeStackSetup.testAnotherCallback function from it's viewDidLoad.
*/
class ViewController: UIViewController {
    var someStackSetup: SomeStackSetup!
    override func viewDidLoad() {
        super.viewDidLoad()
        someStackSetup.testAnotherCallback("Noah") {
            returnedValue -> Void in
            print(">>>>> whenDone:returnedValue = \(returnedValue) <<<<<")
        }
    }
}


/*:
When it calls the testAnotherCallback function it passes a trailing closure.

In this case the trailing closure consists if

`{
returnedValue -> Void in
print(">>>>> whenDone:returnedValue = \(returnedValue) <<<<<")
}`
*/

/*:
Our last class is the app delegate.
*/

class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let someStackSetup: SomeStackSetup = SomeStackSetup() {(response) -> Void in
            if response == "responseString" {
                self.completeSetup()
            } else {
                print(">>>>> response is not what we expected, abort setup <<<<<")
            }
        }
        let viewController: ViewController = self.window!.rootViewController as! ViewController
        viewController.someStackSetup = someStackSetup
        
        return true
    }
    func completeSetup() {
        print(">>>>> AppDelegate:completeSetup() <<<<<")
    }
}
