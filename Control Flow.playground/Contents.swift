import UIKit

/*:
# Swift Crash Course
*A fast paced intro to Swift*

### Control Flow

Swift provides all the usual control flow statements:
for loops
while loops
if blocks
switch blocks

When declaring the control flow statement parentheses around the condition or loop variable are optional.

Braces around the body are required.
*/

/*: -------------------------------------------------------------------------------------------------
**for**

A for loop performs a set of statements until a specific condition is met.

`for var i = 1; i <= someCondition; i++ {`

    print("Hi")

`}`
*/

// Write a for loop that runs 5 times





/*: -------------------------------------------------------------------------------------------------
**for-in**

A for in performs a set of statements for each item in a sequence.

`for someitem in someCollection {`

    print(someItem)

`}`
*/

// Create an Array of five Strings.





// Write a for in loop to print each String in the Array.





/*:
You can use a for-in loop to iterate over items in a dictionary by providing a pair of names to use for each key-value pair.
    
`for (name1, name2) in aDictionary {`

    do Something

`}`
*/





// Create a Dictionary that holds three items, the keys should be Ints and the values should be Strings.





// write a for in loop to print out each key and value





/*:
You can keep an index in a loop—either by using ..< or ...
..<   omits the upper value
... includes both values

`for index in 1...5 {`

    do something

`}`
*/

// Write a for in loop that loops five times printing out each index





/*: -------------------------------------------------------------------------------------------------
**while**

A while loop performs a set of statements until a condition becomes false. These kinds of loops are best used when the number of iterations is not known before the first iteration begins.

`while (condition) {`

    statements

`}`
*/

// Create two vars of type Int. One with an initial value of 0 an the other with an initial value of 5.





// Write a while loop that adds 1 to the var that starts at 0 and goes until that var is = to the other var which starts at 5.





/*: -------------------------------------------------------------------------------------------------
**repeat-while**

Repeat while is similar to the do-while in other languages.

`repeat {`

    statements

`} while condition`

*/

// Write the same loop we did above but using repeat while this time.






/*: -------------------------------------------------------------------------------------------------
**if**

Typically, you use the if statement to evaluate simple conditions with only a few possible outcomes.

`if somethingIsTrue {`

    do something

`}`
*/

// Create a var of type Bool with a value of true





// Write an if statement that does something if the var you created is true.






/*:
You can do an else and an else if ust like other languages

`if someVar {`

    do something

} else if someOtherVar {

    do soemthing else

} else {

    do something altogether different

`}`
*/


// Create an if block that also includes and else if and an alse





/*: -------------------------------------------------------------------------------------------------
**switch**

A swicth in Swift supports any kind of data and a wide variety of comparison operations. It is not limited to integers and it tests for equality.

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

// Create a var that is a Int between 1 and 5





// Create a switch that does something different for each number between 1 and 5 and match it to your var.





/*: 
Did it complain? Did you try adding a default case?
*/

/*:
You must provide executable statements for each case. You cannot simply leave a case blank.

This will give you an error

`switch someThing {`

    case somethingToMatch:

        do something

    case somethingWElseToMatch:

    default:

        do something

`}`
*/

/*: 
You can match multiple values in one case, seperated by a comma

`switch someThing {`

    case somethingToMatch, somethingWElseToMatch:

        do something

    default:

        do something

`}`
*/

// Change your switch to do the same thing for numbers 2 and 3





/*: 
Though Swift switch cases don't fall through, you can ask it to implicitly. To do so you add the fallthrough keyword.

`switch someThing {`

    case somethingToMatch:

        do something

    case somethingElseToMatch:

        fallthrough

    default:

        do something

`}`
*/

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

// Create a switch that checks for a range of values





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

// Create a switch that tests for multiples values in a Tuple





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

// Write a switch that uses a where clause.





// add a && condition





/*: -------------------------------------------------------------------------------------------------
**Transfer Statements**

**continue** - The continue statement tells a loop to stop what it is doing and start again at the beginning of the next iteration through the loop.


**break** - When used inside a loop statement, break ends the loop’s execution immediately, and transfers control to the first line of code after the loop’s closing brace. When used inside a switch statement, break causes the switch statement to end its execution immediately, and to transfer control to the first line of code after the switch statement’s closing brace
*/

// Write a loop that includes a continue statement and a break statement





/*: -------------------------------------------------------------------------------------------------
**guard**

A guard statement, like an if statement, executes statements depending on the Boolean value of an expression. You use a guard statement to require that a condition must be true in order for the code after the guard statement to be executed. Unlike an if statement, a guard statement always has an else clause—the code inside the else clause is executed if the condition is not true.

`guard let something = someUnknownThing else {
    return
}`
*/

// Write a guard statement





/*: 
If the guard statement’s condition is met, code execution continues after the guard statement’s closing brace. Any variables or constants that were assigned values using an optional binding as part of the condition are available for the rest of the code block that the guard statement appears in.

If that condition is not met, the code inside the else branch is executed. That branch must transfer control to exit the code block that that guard statement appears in. It can do this with a control transfer statement such as return, break, continue, or throw, or it can call a function or method that doesn’t return, such as fatalError().

Using a guard statement for requirements improves the readability of your code, compared to doing the same check with an if statement. It lets you write the code that’s typically executed without wrapping it in an else block, and it lets you keep the code that handles a violated requirement next to the requirement.
*/








