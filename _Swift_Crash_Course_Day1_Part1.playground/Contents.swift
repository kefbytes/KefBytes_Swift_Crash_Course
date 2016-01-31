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

What is this course not? This course is not a deep dive into Swift. The hope is that this lays the foundation so that you can start coding in Swift immediately and then dive deeper as you go.

Swift is a language that Apple has been working on for years. All the changes to Objective C over the last few years have been with Swift in mind. Swift has been a bit of a moving target since it was introduced.

Swift is similar to C and Objective C, but there is no need for seperate header and implementation files.

Swift was designed to make code safer and clearer in intent. It is a type safe language, meaning if something in your code is expecting a string, you cannot pass it an int.

Swift uses type inference, so if you declare a var and don't set it's type implicitly it will infer the type if there is enough information.

## Playgrounds

Playgrounds are just that, a place to play and learn Swift. You are looking at a playground right now. With playgrounds you can run code and see the output without the need to create and compile a full app.

Playgrounds are great learning tools as you can add markdown like what you are reading right now and combine it with code that runs and shows you the output like below.

We will be using Playgrounds extensively in this course.

*/

/*:
## Variables

In Swift variables are set using either the var or let keyword.
Quite simply vars are mutable and lets are not. We use lets for constants.
Always start by using a let until you find that it needs to be a var.

Global variables are defined outside of any function, method, closure, or type context. Local variables are defined within a function, method, or closure context.

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

// Create a var named artist that is a String and has a value of some favorite musician of yours.

/*:
Did you implicitly set it to be a String or let Swift infer its type?
*/
// Now change the value of the var you created.

// Create a let named songTitle that is of type String and set it's value to some song title

// Now change the value of the let.

/*:
What happened when you tried to change the value?

Swift helps you by giving you some way to fix the error, click the little red and white circle to the left.
*/

/*:
vars and lets must have a value at the time a structure is created. What this means is they either need a default value at the time of declaration or they must be assigned a value during initialization.
*/
struct Song {
    
    // Try creating a var named songTitle here that has no initial value. In this case implicitly define the type to be of String.
    
    init() {

    }
}

// What happned when you did so? Click the little red circle with the explanation point to see what it says.

// Now assign a value to the var inside the init() function

// Now comment out the line that assigned the value and add a ? after the String type to the var declaration (example: var varName: String?)

// What happened? No more error! We turned the var into an optional String. An optional is allowed to have no value. We'll learn more about optionals in a bit.

/*:
**Naming vars and lets**

You can use just about any character when naming your vars and lets.

Names cannot contain whitespace characters, mathematical symbols, arrows. Nor can they begin with a number, although numbers may be included elsewhere within the name.

var 🂒 = "A very oddly named String"

var µ = "Another oddly named String"

var 😈 = "Here's a happy little var, probably not real useful though"

var firstName = "Henrieta"

*/
// create a let using a symbol in the name. You can find the symbols under Edit > Emoji & Symbols

// create a let that has a name made up of two names seperated by a space

// What happened? // If you really wanted that as a name, just replace the space with an underscore. Or of course you could use camel casing.

/*:
Once you’ve declared a constant or variable of a certain type, you can not redeclare it again with the same name, or change it to store values of a different type. Nor can you change a constant into a variable or a variable into a constant.
*/
// create a let named instrument of type string and assign it a value of some type of musical instrument

// assign an Int to the var you just created

// What happened?

// try declaring a let named instrument that is of type Int

// declare a var named instrument that is of type String

// Can we try the same thing but make it an Int?

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
var arrayExample = [String](arrayLiteral: "Blue", "Red", "Green")
var anotherWayToDoIt:[String] = ["Earth", "Wind", "Rain"]
var anEmptyArrayExample = [Float]()
var anotherArrayExample = ["Swift", "Can", "Infer", "The", "Type"]
let intArrayExample = [1,2,3,4]
//: _Sets_
let setExample: Set<String> = ["Red", "Green", "Blue"]
var emptySetExample = Set<Int>()
let anotherSetExample: Set = ["Swift", "Can", "Infer", "The", "Type"]
//: _Dictionaries_
var dictionaryExample: [String: String] = ["Kitchen": "Alabastor", "Dining Room": "Sailboat", "trim": "Pure White", "Noah's Room": "BlueGrass"]
var emptyDictionaryExample = [Int: String]()
var anotherDictionaryExample = ["Can": "Swift", "Infer": "The", "Type": "?"]

/*:
**Strings**
*/
// Create a let named album that is type String and give it a value


/*:
You can combine strings with the + sign.
*/
// lets combine our songTitle String from earlier and our album String in a new let named release

// Create a var thats name is genre and it's value is an emptry String

/*:
You can check if a String is empty with the isEmpty method
*/
// Check if the genre var you just created is empty.

// now assign a value to your String so it's not empty and look at the result of our isEmpty check again


/*:
Passing Strings around
*/
// Here is a function that takes a String and adds a String to it and then returns a String
func addGreeting(var name: String) -> String {
    name += ", welcome to Swift"
    return name
}

// Create a let of your first name

// Pass your String to the function  - example addGreeting(firstName)

// Check the value of your String by just typing in the name below

/*:
What did we see from the example above?

Our String that we passed to the function never actually changed.

We did this to demonstrate that Strings are value types, meaning they are passed by value. When you send the String to the function it creates a copy of the String and works on it. The original String is left as is. This is the case with all types in Swift. The only thing that is passed by reference is a class. Everything else is passed by value.

There is a way to have the function change a String passed into it. We will cover that when we get to functions.
*/

/*:
**String Interpolation**  `\(string)`

String Interpolation is another method you could use to combine Strings

It is also easy way to include values in Strings is to write the value in parentheses preceeded by a backslash. This works when creating vars or when printing to the console or anywhere inside a line of text.

example: let someString = "\(string1), here's some more text \(string2)"
*/
// Let's combine our songTitle and album Strings again into a let named single, but this time use String Interpolation

/*:
To get the length of a String you count the characters in the String

`someStringVar.characters.count`
*/
// Find the length of the single String you created above

/*:
You compare Strings with ==
*/
// Compare the songTitle and album Strings to see if they are equal

// Create a new let named goodSong whcih is a String and give it the same value you gave to songTitle

// Compare the songTitle and goodSong Strings to see if they are equal


/*:
You can loop through the characters in a String using for in

`for character in ourString.characters`
*/
// Loop throught the characters of the let single

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
// Create an empty array of Strings named songs

/*:
You can append something to array with the append method

`someArray.append(someVar)`
*/
// Append your songTitle let to the songs array

/*:
You can also append something by using the += operator
someArray += [someValue]
*/
// Create a let named songName of type String and give it a value

// Append another songName to your songs array using the += operator

// You'll notice that you need to include the new variable in square brackets. What you are essentially doing is adding two arrays together. The second one is just an aray of one element. But you could of course add an array of many elements.

/*:
You can access one of elements in your array using the index inside square brackets

`someArray[index]`
*/
// Change the value of the second item in your songs array by accessing it with it's index and assigning it a literal

/*:
You can insert an element into the Array at a specific index

`someArray.insert(someVar, atIndex: index)`
*/
// Insert the songName variable back into the songs array at index 1 (the second spot)

/*:
You can create an Array literal by assigning values to the  Array during declaration. When doing so you don't need to specify the type, Swift can infer it.

`let someArray = [var1, var2, var3, var4]`
*/
// Create an Array literal of Ints named years a assign it some years

/*:
You get the size of an Array by using count

`someArray.count`
*/
// Get the size of your years array using count

/*:
Get the first element in an Array with first.

`someArray.first`
*/
// get the first element of your songs array

/*:
You can get the last element of an Array with last.

`someArray.last`
*/
// Get the last element in your songs array

/*:
You can check if your Array us empty with isEmpty

`someArray.isEmpty`
*/
// Check if your songs array is empty

/*:
Check to see if an Array contains some thing with contains

`someArray.contains(someVar)`
*/
// Check if your years array contains 1993

/*:
You can loop through your array with for in

`for tempVar in someArray`
*/
// Loop through your songs array and print the elements

/*:
You can enumerate through an array getting the index and value of each element

`for (index, value) in someArray.enumerate()`
*/
// enumerate through your songs array

// Create another array named artists you can combine literal values along with you artist variable when creating it

/*:
You can combine arrays with the + operator

`someArray + anotherArray`
*/
// Combine your songs and artist arrays and assign to a new array named songsAndArtists of type let

// Try changing the value of the second element in songsAndArtists

// What happened?
// Click the little red and white circle and then double click the line that starts with Fix-it

/*:
Collections can only contain one type.

We can get around this by declaring an Array of type 'Any'

`var someArray = [Any]()`
*/
// Create a mutable array named musicCollection of type Any. Remember in Swift the only difference between mutable and immutable is the declaration with either let or var. Use var to make the array mutable.

// We want to append an Int to the array let's append the second element of our years array

// Now we want to append a String to the array, let's append the first element in our songs array

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
// Create an empty set of Strings named songSet

/*:
When creating Set literals you don't need to specify the type

`var setOfColors:Set = ["Red", "Green", "Blue"]`
*/
// Create a literal set of Strings named artistSet

/*:
Just like Arrays you can use isEmpty, insert and contains. With Sets you don't specify an index with insert

`someSet.isEmpty`

`someSet.insert(someVar)`

`someSet.contains(someVar)`
*/
// Check if your artistSet is empty

// Insert a String into your songSet

// Check if your songSet contains a specific String

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
// Create and empty Dictionary named mySongs that has a key of type String and value of type String

/*:
You add elements to the Dictionary by accessing the key and assigning the value.

`aDictionary[1] = "red"`

In the above statement the key is 1 and the value is Red
*/
// Add a key value pair to mySongs. The key should be the first element in our songs array and the value should be the first element in artists array.

/*:
Access elements in the dictionary with the key inside square brackets

`var someVar = aDictionary[1]`
*/
// Create a new let named firstArtist by accessing the key of our mySongs Dictionary

// A better solution would be to create a constant for the key, lets create one from songs[2]

// Now add another element to the mySongs Dictionary using our songKey constant as the key and a literal as the value

/*:
You can create a Dictionary literal without specifying the types of the key and value.

`var paintColors = ["Kitchen": "Alabastor", "Dining Room": "Sailboat", "trim": "Pure White", "Noah's Room": "BlueGrass"]`

If you do want to specify the types it goes before the = sign

`let paintColors: [String: String] = ["Kitchen": "Alabastor", "Dining Room": "Sailboat", "trim": "Pure White", "Noah's Room": "BlueGrass"]`
*/

/*:
The same methods are available to Dictionary that were available to the other collection types.
*/
// Get the count of elements in your mySongs Dictionary

// Get the first element of the Dictionary

// Check if your Dictionary is empty

// Get the value for the key "songKey" and assign it to a new let

/*:
To update an element in a Dictionary you use updateValue

`someDictionary.updateValue(value, forKey: key)`
*/
// Update one of the elements in the mySongs Dictionary

