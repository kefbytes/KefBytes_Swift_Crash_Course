import UIKit
/*:
# Swift Crash Course
*A fast paced intro to Swift*

## Error Handling

Swift provides first-class support for throwing, catching, propagating, and manipulating recoverable errors at runtime.

In Swift, errors are represented by values of types that conform to the ErrorType protocol. 

enums are particularly useful when defining error types.

`enum FileReadingError: ErrotType {`

    case FileDoesNotExist(fileName: String)

    case FileIsWrongFormat

    case FileIsCorrupt

`}`
*/


/*:
You use a throw statement to throw an error.

`throw FileReadingError.FileDoewNotExist(fileName: "SomeFileToRead.xml")`
*/


/*:
When an error is thrown, some surrounding piece of code must be responsible for handling the error—for example, by correcting the problem, trying an alternative approach, or informing the user of the failure.

There are four ways to handle errors in Swift.

- propagate the error from a function to the code that calls that function

- handle the error using a do-catch statement

- handle the error as an optional value

- assert that the error will not occur

Write the try keyword—or the try? or try! variation—before a piece of code that calls a function, method, or initializer that can throw an error.
*/


/*:
**Propagating Errors**

If a function, method or initializer can throw an error, you include the throws keyword in the defition before the return type.

`func someFunc() throws -> String {`

    return "SomeString"

`}`

A throwing function propagates errors that are thrown inside of it to the scope from which it’s called.
*/

// Define a method or function that can throw an error.





/*:
**do-catch**

You use a do-catch statement to handle errors by running a block of code. If an error is thrown by the code in the do clause, it is matched against the catch clauses to determine which one of them can handle the error.

`do checkSomething {`
    
    // persome some statements

`} catch matchSomethingHere {`

    // persome some statements

`} catch matchSomethingElseHere {`

    // persome some statements

`}`
*/


/*:
**Converting Errors to Optional Values**

You use try? to handle an error by converting it to an optional value. If an error is thrown while evaluating the try? expression, the value of the expression is nil.

Suppose you are calling the function yo called earlier that throws an error.

`var someVar = try? someFunctionThatThrowsAnError()`

If someFunctionThatThrowsAnError() throws an error, the value of someVar is nil otherwise it gets value returned by the function.
*/


/*:
**Disabling Error Propagation**

Sometimes you know a throwing function or method won’t, in fact, throw an error at runtime. On those occasions, you can write try! before the expression to disable error propagation and wrap the call in a runtime assertion that no error will be thrown. If an error actually is thrown, you’ll get a runtime error.

`let someVar = try! someFunctionGuaranteedToWork()`
*/


/*:
**defer**

You use a defer statement to execute a set of statements just before code execution leaves the current block of code. This code always gets executed whether we are exiiting the scope because of an error or a return statement or whatever.

`func someFunc() throws {`

    if something {

        // do something

    }

    defer {

        // perform this code when leaving scope regardless if an error is thrown or not

    }

    while let someVar = try trySomeFunction() {

        // do some work if successful

    }

`}`
*/






