import UIKit
/*:
## Xcode

You will need Xcode 7 or later in order to use Swift 2.0 which is what we will be using in this course. You can download it here.

[Apple Developer Site](https://developer.apple.com/xcode/download/)

The latest version at the time I'm writing this is 7.0.1.
A beta verion 7.1 beta 2 is available as well.
*/


/*:
![Local Image](Cardinal_Logo.png)

# Swift Crash Course
*A fast paced intro to Swift*
Day 1, Part 1

What is this course? This course is meant to bring you up to speed in Swift as quickly as possible.

What is this course not? This course is not a deep dive into Swift. The hope is that this lays the foundation so that you can start coding in Swift immediately and then dive deeper as you go. Swift has been a bit of a moving target since it was introduced.

Swift is a language that Apple has been working on for years. All the changes to Objective C over the last few years have been with Swift in mind.

Swift is similar to C and Objective C, but there is no need for seperate header and implementation files.

Swift was designed to make code safer and clearer in intent. It is a type safe language, meaning if something in your code is expecting a string, you cannot pass it an int.

Swift uses type inference, so if you declare a var and don't set it's type implicitly it will infer the type if there is enough information.

## Playgrounds

Playgrounds are just that a place to play and learn Swift. You are looking at a playground right now. With playgrounds you can run code and see the output without the need to create and compile a full app.

Playgrounds are great learning tools as you can add markdown like what you are reading right now and combine it with code that runs and shows you the output like below.

We will be using Playgrounds extensively in this course.

*/

// Create a var that's type is inferred.



// Create a var that has no value but's type is inferred.



// Create a var that is set to nil



// print our first var to the console



/*:
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

// Create a var that has a value that is String



/*:
Did you implicitly set it to be a String or let Swift infer its type?
*/

// Now change the value of the var you created.



// Create a let of type Int



// Now change the value of the let.



/*:
What happened when you tried to change the value?

Swift helps you by giving you some way to fix the error, click the little red and white circle to the left.
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


// create a var that has a name made up of two names seperated by a space


// What happened?



/*:
Once you’ve declared a constant or variable of a certain type, you can not redeclare it again with the same name, or change it to store values of a different type. Nor can you change a constant into a variable or a variable into a constant.
*/

// create a var of type string


// assign an Int to the var you just created


// What happened?

/*:
## Strings and Collection Types
*/

/*:
**Examples**

_Strings_
*/

var stringExample:String = "Here's a string"
let anotherStringExample = "Swift can infer the type"
//: _Arrays_
var arrayExample = [String](arrayLiteral: "Hannah", "Noah", "Rosie")
var anotherWayToDoIt:[String] = ["Earth", "Wind", "Rain"]
var anEmotyArrayExample = [Float]()
var anotherArrayExample = ["Swift", "Can", "Infer", "The", "Type"]
let intArrayExample = [1,2,3,4]
//: _Sets_
let setExample: Set<String> = ["Red", "Green", "Blue"]
var emptySetExample = Set<Int>()
let finalSetExample: Set = ["Swift", "Can", "Infer", "The", "Type"]
//: _Dictionaries_
var dictionaryExample: [String: String] = ["Kitchen": "Alabastor", "Dining Room": "Sailboat", "trim": "Pure White", "Noah's Room": "BlueGrass"]
var emptyDictionaryExample = [Int: String]()
var lastDictionaryExample = ["Can": "Swift", "Infer": "The", "Type": "?"]

/*:
**Strings**
*/

// Create two vars of type String



/*:
You can combine strings with the + sign.
*/
// Combine the two Strings you created into a new String



// Create a var thats value is an emptry String



/*:
You can check if a String is empty with the isEmpty method
*/
// Check if the String you just created is empty.



// now assign a value to your String that is an actual String and not empty



// Here is a function that takes a String and adds a String to it and then returns a String
func changeAString(var ourString: String) -> String {
    ourString += ", welcome to Swift"
    return ourString
}

// Pass your String to the function  - example changeAString(yourStringHere)



// Check the value of your String by just typing in the name below



/*:
What did we see from the example above?

Our String that we passed to the function never actually changed.

We did this to demonstrate that Strings are value types, meaning they are passed by value. When you send the String to the function it creates a copy of the String and works on it. The original String is left as is. This is the case with all types in Swift. The only thing that is passed by reference is a class. Everything else is passed by value.

There is a way to have the function change a String passed into it. We will cover that when we get to functions.
*/

/*:
**String Interpolation**  `\(string)`

An easy way to include values in Strings is to write the value in parentheses preceeded by a backslash. This works when creating vars or when printing to the console or anywhere inside a line of text:
*/

// Create some var of type String with the value "Solutions".



// Now create a var with a value of "Ideas Solutions People", use String Interpolation.



/*:
To get the length of a String you count the characters in the String

`someStringVar.characters.count`
*/

// Find the length of the String you created above



/*:
You compare Strings with ==
*/

//Create two Strings



// Compare the two Strings to see if they are equal (use ==)



/*:
You can loop through the characters in a String using for in

`for character in ourString.characters`
*/

// Loop throught the characters of one of your Strings



/*:
**Array**

Arrays are ordered collections of values

Create arrays and dictionaries using brackets [].

Access array elements by writing the index or key in the brackets.

You should always create collections as immutable unless you know they will be changing.

Arrays, sets, and dictionaries in Swift are always clear about the types of values and keys that they can store. This means that you cannot insert a value of the wrong type into a collection by mistake. It also means you can be confident about the type of values you will retrieve from a collection.
*/

/*:
You create an empty Array by putting the type inside the square brackets.

`var arrayOfStrings = [String]()`
*/

// Create an empty array of Strings



/*:
You can append something to array with the append method

`someArray.append(someVar)`
*/

// Append a String or two to your empty array



/*:
You can also append something by using the += operator
*/

// Append another String to your array using the += operator



/*:
You can change one of the Strings in your Array by accessing it with the index inside square brackets

`someArray[index]`
*/

// Change the value of the second item in your Array



/*:
You can insert an element into the Array at a specific index

`someArray.insert(someVar, atIndex: index)`
*/

// Insert a new String into your array at index 1



/*:
You can create an Array literal by assigning values to the  Array during declaration. When doing so you don't need to specify the type, Swift can infer it.

`let someArray = [var1, var2, var3, var4]`
*/

// Create an Array literal of Ints



/*:
You get the size of an Array by using count

`someArray.count`
*/

// Get the size of your Array literal yo created.



/*:
Get the first element in an Array with first.

`someArray.first`
*/

// get the first element of your Array



/*:
You can get the last element of an Array with last.

`someArray.last`
*/

// Get the last element in your Array



/*:
You can check if your Array us empty with isEmpty

`someArray.isEmpty`
*/

// Check if your Array is empty



/*:
Check to see if an Array contains some thing with contains

`someArray.contains(someVar)`
*/

// Check if your Array contains 99



/*:
You can loop through your array with for in

`for tempVar in someArray`
*/

// Lopp through your array and print the elements



/*:
You can enumerate through an array getting the index and value of each element

`for (index, value) in someArray.enumerate()`
*/

// enumerate through your array



// Create another array of the same type as the one you already created



/*:
You can combine arrays with the + operator

`someArray + anotherArray`
*/

// Combine your two Int Arrays to create a third Array



// Try changing the value of the second element



// What happened?

/*:
Collections can only contain one type.

We can get around this by declaring an Array of type 'Any'

`var someArray = [Any]()`
*/

// Create an array of type Any



// Append an Int to the Array



// Append a String to the Array



/*:
**Sets**
Sets are unordered collections of distinct values.

Sets can replace Arrays when you want to make sure a value is not repeated and the order does not matter.

A type must be hashable in order to be stored in a set. All of Swift’s basic types (such as String, Int, Double, and Bool) are hashable by default.
*/

/*:
You create an empty set by putting the type within less than and greater than symbols

`var emptySetOfStrings = Set<String>()`
*/

// Create an empty set of Strings



/*:
When creating Set literals you don't need to specify the type

`var setOfColors:Set = ["Red", "Green", "Blue"]`
*/

// Create a literal set of Strings



/*:
Just like Arrays you can check for isEmpty, insert and contains. With Sets you don't specify an index with insert

`someSet.isEmpty`

`someSet.insert(someVar)`

`someSet.contains(someVar)`
*/

// Check if your Set is empty



// Insert a String into your Set



// Check if your Set contains a specific String



// Loop though your Set (just like you did in Array)



/*:
Here are some functions you can apply to sets
-union(_:)

-subtract(_:)

-intersect(_:)

-exclusiveOr(_:)

-“is equal” operator (==)

-isSubsetOf(_:)

-isSupersetOf(_:)

-isStrictSubsetOf(_:)

-isStrictSupersetOf(_:)

-isDisjointWith(_:)
*/

/*:
**Dictionaries**
Dictionaries are unordered collections of key-value associations

Keys must be of the same type.

Values must be of the same type.

A dictionary Key type must conform to the Hashable protocol, like a set’s value type.
*/

/*:
You create an empty Dictionary by adding the key and value types in square brackets

`var aDictionary = [Int: String]()`
*/

// Create and empty Dictionary that has a key of type Int and value of type String



/*:
You add elements to the Dictionary by accessing the key and assigning the value.

`aDictionary[1] = "red"`

In the above statement the key is 1 and the value is Red
*/

// Add a few key values to the Dictionary



/*:
Access elements in the dictionary with the key inside square brackets

`var someVar = aDictionary[1]`
*/

// Create a new var by accessing the key



/*:
You can create a Dictionary literal without specifying the types of the key and value.

`var paintColors = ["Kitchen": "Alabastor", "Dining Room": "Sailboat", "trim": "Pure White", "Noah's Room": "BlueGrass"]`

If you do want to specify the types it goes before the = sign

`let paintColors: [String: String] = ["Kitchen": "Alabastor", "Dining Room": "Sailboat", "trim": "Pure White", "Noah's Room": "BlueGrass"]`
*/

// Create a dictionary literal using Strings for the keys and values.



/*:
The same methods are available to Dictionary that were available to the other collection types.
*/

// Get the count of elements in your Dictionary



// Get the first element of the Dictionary



// Check if your Dictionary is empty



// Get the value for the key "trim" and assign it to a new var



/*:
To add an element put the key in square brackets and assign a value

`someDictionary[key] = value`
*/

// Add a new element to the dictionary



/*:
To update an element in a Dictionary you use updateValue

`someDictionary.updateValue(value, forKey: key)`
*/

// Update one of the elements in the Dictionary



