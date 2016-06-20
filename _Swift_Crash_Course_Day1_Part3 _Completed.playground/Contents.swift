import UIKit
/*:
![Local Image](Cardinal_Logo.png)

# Swift Crash Course
*A fast paced intro to Swift*

Day 1, Part 3
*/

/*:
### Control Flow

Swift provides all the usual control flow statements:

for loops

while loops

if blocks

switch blocks

When declaring the control flow statement parentheses around the condition or loop variable are optional.

Braces around the body are required.
*/

/*:
**for**

A for loop performs a set of statements until a specific condition is met.

`for var i = 1; i <= someCondition; i++ {`

print("Hi")

`}`
*/
// Write a for loop that runs 5 times

for var i = 1; i <= 5; i++ {
    print("i = \(i)")
}

/*:
**for-in**

A for in performs a set of statements for each item in a sequence.

`for someitem in someCollection {`

print(someItem)

`}`
*/
// Create an Array named colors that consists of five Strings.

let colors = ["Blue", "Red", "Green", "Yellow", "Black"]

// Write a for in loop to print each String in the Array.

for color in colors {
    print(color)
}

/*:
You can use a for-in loop to iterate over items in a dictionary by providing a pair of names to use for each key-value pair.

`for (name1, name2) in aDictionary {`

do Something

`}`
*/
// Create a Dictionary named users that holds three items, the keys should be Ints and the values should be Strings.

let users = [1: "testUser", 2: "adminUser", 3: "endUser"]

// write a for in loop to print out each key and value

for (keyIndex, userType) in users {
    print("keyIndex = \(keyIndex), userType = \(userType)")
}

/*:
You can keep an index in a loop—either by using ..< or ...

..<   omits the upper value

... includes both values

`for index in 1...5 {`

do something

`}`
*/
// Write a for in loop that loops five times printing out each index

for index in 1...5 {
    print(index)
}

/*: -------------------------------------------------------------------------------------------------
**while**

A while loop performs a set of statements until a condition becomes false. These kinds of loops are best used when the number of iterations is not known before the first iteration begins.

`while condition {`

statements

`}`
*/
// Create two vars of type Int. One with an initial value of 0 named counter an the other with an initial value of 5 named condition.
var counter = 0
var condition = 5

// Write a while loop that adds 1 to the var that starts at 0 and goes until that var is = to the other var which starts at 5.
//var counter = zero
while counter != condition {
    counter++
    print("counter = \(counter)")
}

/*: -------------------------------------------------------------------------------------------------
**repeat-while**

Repeat while is similar to the do-while in other languages.

`repeat {`

statements

`} while condition`

*/
// Write the same loop we did above but using repeat while this time. Start by resetting our counter to 0
counter = 0
repeat {
    counter++
    print("counter: \(counter)")
} while counter != condition

/*: -------------------------------------------------------------------------------------------------
**if**

Typically, you use the if statement to evaluate simple conditions with only a few possible outcomes.

`if somethingIsTrue {`

do something

`}`
*/
// Create a var of type Bool named response with a value of true
var response = true

// Write an if statement that does something if the var you created is true.

if response {
    print("response = \(response)")
}

/*:
You can do an else and an else if just like other languages

`if someVar {`

do something

} else if someOtherVar {

do soemthing else

} else {

do something altogether different

`}`
*/
// Create an if block that also includes and else if and an else. You can use the same response var.

if response {
    print("response = true")
} else {
    print("response = false")
}

/*: -------------------------------------------------------------------------------------------------
**switch**

A switch in Swift supports any kind of data and a wide variety of comparison operations. It is not limited to integers and it tests for equality.

Switch statements do not “fall through”. This means no need for a break line in each case.

The switch statement is best suited to more complex conditions with multiple possible permutations, and is useful in situations where pattern-matching can help select an appropriate code branch to execute.

Every switch statement must be exhaustive. That is, every possible value of the type being considered must be matched by one of the switch cases. If it is not appropriate to provide a switch case for every possible value, you can define a default catch-all case to cover any values that are not addressed explicitly. This catch-all case is indicated by the default keyword, and must always appear last.
*/

/*:
In its simplest form, a switch statement compares a value against one or more values of the same type.

`switch someThing {`

case somethingToMatch:

do something

case somethingElseToMatch:

do something

default:

do something

`}`
*/
// Create a let named count that is a Int between 1 and 5

let count = 3

// Create a switch that does something different for each number between 1 and 5 and match it to your let.

switch count {
case 1:
    print("count = 1")
case 2:
    print("count = 2")
case 3:
    print("count = 3")
case 4:
    print("count = 4")
case 5:
    print("count = 5")
default:
    print("count > 5")
}

/*:
Did it complain? Did you try adding a default case?
*/

/*:
You must provide executable statements for each case. You cannot simply leave a case blank.

This will give you an error

`switch someThing {`

case somethingToMatch:

do something

case somethingElseToMatch:

default:

do something

`}`
*/
//example: uncomment this and see the result

//var somethingToMatch = "Some"
//switch somethingToMatch {
//case "Something":
//    print("Something")
//case "Some":
//default:
//    print("Found the default")
//}

/*:
You can match multiple values in one case, seperated by a comma

`switch someThing {`

case somethingToMatch, somethingWElseToMatch:

do something

default:

do something

`}`
*/
// Redo your switch you created above here to do the same thing for numbers 2 and 3

switch count {
case 1:
    print("count = 1")
case 2, 3:
    print("count = 2 or 3")
case 4:
//    print("count = 4")
    // changed to fallthrough below
    fallthrough
case 5:
    print("count = 5")
default:
    print("count > 5")
}

/*:
Though Swift switch cases don't fall through, you can ask it to so implicitly. Just add the fallthrough keyword.

`switch someThing {`

case somethingToMatch:

do something

case somethingElseToMatch:

fallthrough

default:

do something

`}`
*/

// edit your switch to fall through the number 4

/*:
You can check for values within a range in a case.

`var testScore = 89`

switch testScore {

case 0..<60:

print("Well, maybe it's not your fault. Did you not have a pencil?")

case 60..<70:

print("Seriously?")

case 70..<80:

print("You should really study a bit more")

case 80...89:

print("Okay that's not going to kill you")

case 90...100:

print("Well done")

default:

print("Must have done extra credit")

`}`
*/
// Redo your switch to check for a range of 1 to 3

switch count {
case 1..<4:
    print("count = 1, 2 or 3")
case 4:
    //    print("count = 4")
    // changed to fallthrough below
    fallthrough
case 5:
    print("count = 5")
default:
    print("count > 5")
}

/*:
You can use tuples to test multiple values in the same switch statement. Each element of the tuple can be tested against a different value or interval of values. Alternatively, use the underscore character (_), also known as the wildcard pattern, to match any possible value.

If multiple matches are possible, the first matching case is always used.

`var touchPoint = (21, 35)`

switch touchPoint {

case (0, 100):

print("Whatever")

case (100, 0):

print("Nope")

case (0...25, 0...25):

print("Nothing to say")

case (0...25, 25...50):

print("Bingo")

default:

print("Some nonsense here")
`}`
*/
// Create a tuple named scores that has two Ints
var testScores = (78, 87)

// Create a switch that tests for multiples values in the scores tuple

switch testScores {
case(0, 100):
    print("Student answered none of the questions or got all of them right")
case(70...80, 80...90):
    print("Student got C's or B's")
default:
    break
}

/*:
A switch case can use a where clause to check for additional conditions.

`switch touchPoint {`

case let( x, y) where x < 25:

print("Whatever")

case (100, 0):

print("Nope")

case (0...25, var y):

print("Nothing to say")

case (let x, 25...50):

print("Bingo \(x)")

default:

print("Some nonsense here")

`}`
*/
// Redo your last switch case to use a where clause to check the if the first value is below 80.

switch testScores {
case let(x,y) where x < 80:
    print("first score is below a C")
case(0, 100):
    print("Student answered none of the questions or got all of them right")
case(70...80, 80...90):
    print("Student got C's or B's")
default:
    break
}

// Redo the above switch case adding an && to the where clause

switch testScores {
case let(x,y) where x < 80 && y < 90:
    print("first score is below a C and the second is below an A")
case(0, 100):
    print("Student answered none of the questions or got all of them right")
case(70...80, 80...90):
    print("Student got C's or B's")
default:
    break
}


/*: -------------------------------------------------------------------------------------------------
**Transfer Statements**

**continue** - The continue statement tells a loop to stop what it is doing and start again at the beginning of the next iteration through the loop.


**break** - When used inside a loop statement, break ends the loop’s execution immediately, and transfers control to the first line of code after the loop’s closing brace. When used inside a switch statement, break causes the switch statement to end its execution immediately, and to transfer control to the first line of code after the switch statement’s closing brace
*/
// Write a loop that loops 10 times and includes a continue statement and a break statement

for index in 1...10 {
    if index == 4 {
        continue
    } else if index == 8 {
        break
    }
    print(index)
}


/*: -------------------------------------------------------------------------------------------------
**guard**

A guard statement, like an if statement, executes statements depending on the Boolean value of an expression. You use a guard statement to require that a condition must be true in order for the code after the guard statement to be executed. Unlike an if statement, a guard statement always has an else clause—the code inside the else clause is executed if the condition is not true.

`guard let something = someUnknownThing else {
return
}`
*/
// Write a guard statement using our response var from earlier inside this function.

func serviceCall() {
    guard response else {
        print("Page not found")
        return
    }
}

/*:
If the guard statement’s condition is met, code execution continues after the guard statement’s closing brace. Any variables or constants that were assigned values using an optional binding as part of the condition are available for the rest of the code block that the guard statement appears in.

If that condition is not met, the code inside the else branch is executed. That branch must transfer control to exit the code block that that guard statement appears in. It can do this with a control transfer statement such as return, break, continue, or throw, or it can call a function or method that doesn’t return, such as fatalError().

Using a guard statement for requirements improves the readability of your code, compared to doing the same check with an if statement. It lets you write the code that’s typically executed without wrapping it in an else block, and it lets you keep the code that handles a violated requirement next to the requirement.
*/


// Example
let successfulResponse:String? = "Success"

if let response = successfulResponse {
    print("response is good")
} else {
    print("no response handle the error")
}

// now the guard version
enum ResponseError: ErrorType {
    case NoResponse
    case TimeOut
}

guard let response = successfulResponse else {
    // the response was a failure so handle it
    throw ResponseError.NoResponse
}
// proceed with the response

