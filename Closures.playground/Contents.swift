import UIKit
/*:
# Swift Crash Course
*A fast paced intro to Swift*

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
In the above example we passed a ready made function as the closure to our sort method. But what if that function was ready made and we wanted to create it on the fly?

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

We start with a class which has an init that takes a closure as a parameter. It also has a function named textAnotherCallback that takes two parameters, a String and a closure.
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

/*:
When the AppDelegate creates the SomeStackSetup constant it automatically calls the init which as we recall takes a closure as a parameter. So we pass a trailing closure.

`{(response) -> Void in
if response == "responseString" {
self.completeSetup()
} else {
print(">>>>> response is not what we expected, abort setup <<<<<")
}
}`
*/

