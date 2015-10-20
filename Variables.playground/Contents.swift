import UIKit
/*:
# Swift Crash Course

## Variables

In Swift variables are set using either the var or let keyword.
Quite simply vars are mutable and lets are not. We use lets for constants.
Always start by using a let until you find that it needs to be a var.

Global variables are variables that are defined outside of any function, method, closure, or type context. Local variables are variables that are defined within a function, method, or closure context.

Here is the syntax for creating vars and lets

`var nameOfVar: TypeOfVar = InitialValue`

`let nameOfVar: TypeOfVar = InitialValue`

*/


/*: 
Examples
*/
var userName:String = "cardinalAdmin"
var employeeNumber:Int = 007
var employeeVacationDays:Float = 7.5
var companyEmployees = [Employee]()
var returnStatus:(String, Int) = (errorMessage:"Page does not exist", statusCode:404)
let isActive:Bool = true
let password:Any = "pass1234"
/*:
In swift we don't have to be so verbose when declaring vars and lets. If the type can be inferred we can omit the type in the declaration.
*/
var userName2 = "cardinalAdmin"     // equivalant to userName above
var employeeNumber2 = 007           // equivalant to employeeNumber above
let isActive2 = true                // equivalant to isActive above
let password2 = "pass1234"          // in this case it will imply that the type is String

// Create a var that has a type String





/*:
Did you implicitly set it to be a String or let Swift infer its type?
*/

// Now change the value of the var you created.





// Create a let of type Int




// Now change the value of the let.




/*:
What happened when you tried to change the value?

Swift helps you by giving you some why to fix the error, click the little red and white circle to the right.
*/

/*:
vars and lets must have a value at the time a structure is created. What this means is they either need a default value at the time of declaration or they must be assigned a value during initialization.
*/

struct someStructOrClass {
    
    // Try creating a var of type String here that has no initial value. In this case implicitly define the type
    
    init() {

    }
}

// What happned when you did so?


// Now assign a value to the var inside the init() function


// Now remove the line that assigned the value and add a ? after the String type (example: var varName: String?)


// What happened? No more error! We turned the var into an optional String. We'll learn more about optionals in a bit

/*:
**Naming vars and lets**

You can use just about any character when naming your vars and lets.

Names cannot contain whitespace characters, mathematical symbols, arrows. Nor can they begin with a number, although numbers may be included elsewhere within the name.

var 🂒 = "A very oddly named String"
var µ = "Another oddly named String"
var 😈 = "Here's a happy little var, probably not real useful though"
var firstName = "Henrieta"

*/

// create a var using a symbol in the name




// create a var that has a nmae made up of two names seperated by a space





// What happened?


/*:
Once you’ve declared a constant or variable of a certain type, you can not redeclare it again with the same name, or change it to store values of a different type. Nor can you change a constant into a variable or a variable into a constant.
*/

// create a var of type string





// assign an Int to the var you just created





// What happened?


