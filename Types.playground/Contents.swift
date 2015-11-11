import UIKit
/*:
# Swift Crash Course
*A fast paced intro to Swift*

### String and Collection Types
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





// Here is a function that takes a String and add a String to it and then returns a String
func changeAString(var ourString: String) -> String {
    ourString += ", welcome to Swift"
    return ourString
}

// Pass your String to the function  - example changeAString(yourStringHere)





// Check the value of your String by just typing in the name of the var below





/*:
What did we see from the example above?

Our String that we passed to the function never actually changed. 

We did this to demonstrate that Strings are value types, meaning they are passed by value. When you send the String to the function it creates a copy of the String and works on it. The original String is left as is. This is the case with all type in Swift. The only thing that is passed by reference is a class. Everything is passed by value. 

There is a way to have the function change a String passed into it. We will cover that when we get to functions.
*/

/*:
 **String Interpolation**  `\(string)`

An easy way to include values in Strings is to write the value in parentheses preceeded by a backslash. This works when creating vars or when printing to the console or anywhere inside a line of text:
 */

// Create some var of String type with the value "Solutions".





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





/*: ----------------------------------------------------------------------------------------------------
**Array**

Arrays are ordered collections of values

Create arrays and dictionaries using brackets [].

Access array elements by writing the index or key in the brackets.

You should always create collections as immutable unless you know they will be changing.

Arrays, sets, and dictionaries in Swift are always clear about the types of values and keys that they can store. This means that you cannot insert a value of the wrong type into a collection by mistake. It also means you can be confident about the type of values you will retrieve from a collection.
*/

/*:
You create an emptt Array by putting the type inside the square brackets.

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
Check to see if an Array contains some with contains

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





// Create a another array of Int's





/*:
You can combine arrays with the + operator

`someArray + anotherArray`
*/

// Combine your two Int Arrays to create a third Array





// Try changing the vlaue of the second element to the value "Cardinal"





// What happened?

/*:
Collectiond can only contain one type.

We can get around this by declaring an Array of type 'Any'

`var someArray = [Any]()`
*/

// Create an array of type Any





// Append an Int to the Array





// Append a String to the Array






/*: ----------------------------------------------------------------------------------------------------
**Sets**
Sets are unordered collections of distinct values.

Sets can replace Arrays when you want to make sure a value is not repeated and the order does not matter.

A type must be hashable in order to be stored in a set. All of Swift’s basic types (such as String, Int, Double, and Bool) are hashable by default.
*/

/*:
Create and empty set by putting the type within less than and greater than symbols

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


/*: ----------------------------------------------------------------------------------------------------
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





/*: ----------------------------------------------------------------------------------------------------
**AnyObject**

- AnyObject is a type alias that can represent an instance of any class type. It is mainly there for compatability with ObjC.

- Any is also a type alias and can represent an instance of any type at all, including function types.

It's always better to specify a type if possible rather than use AnyObject or Any

Objective-C does not have explicitly typed arrays, therefore it is possible to get arrays of AnyType when working with Cocoa APIs. But often you know which type they hold. In these cases you can downcast the item to a more specific type with as!

*/

/*: 
Example Code
*/

// Here's an Array created with a type of AnyObject. It actually holds items of type Song.
let anyObjects: [AnyObject] = [
    Song(nameIn: "Anodyne", artistIn: "Uncle Tupelo"),
    Song(nameIn: "Ain't So Lonely", artistIn: "Lucerne"),
    Song(nameIn: "Hard Times", artistIn: "Gob Irone")
]

// We can iterate over the Array and set each item to be of type Song, because we know the Array holds Songs
for object in anyObjects {
    let song = object as! Song
    print("Song: '\(song.name)', dir. \(song.artist)")
}

// Here's a shorter version
for song in anyObjects as! [Song] {
    print("Song: '\(song.name)', dir. \(song.artist)")
}

// This Array is created with type Any. It holds a String, an Int and a Song
let anyArray: [Any] = [
    "Hannah",
    11,
    Song(nameIn: "Moonshiner", artistIn: "Uncle Tupelo")
]

// While iterating over the Array we use a switch case to find the type of each item.
for anyItem in anyArray {
    switch anyItem {
    case is String:
        print("It must be Hannah")
    case let age as Int:
        print("She must be 11")
    case let song as Song:
        print("What a great song")
    default:
        print("hmmm must have found something unknown")
    }
}

/*: ----------------------------------------------------------------------------------------------------
**Tuple**

Tuples hold mutiple valus

The elements of a tuple can be referred to either by name or by number.

The values within a tuple can be of any type and do not have to be of the same type as each other.

Tuples are useful for temporary groups of related values.

*/

/*:
You can create a var that is a Tuple by seperating the values by a comma, naming the values is optional.

`let someTuple = (valueName:value, valueName:value)`
*/

// Create a Tuple that names it's values





/*: 
You can access the values of the Tuples by number

`someTuple.0`
*/

// Access the second value of the Tuple you created and assign it to a new var





/*:
You can also access thr value of a Tuple by name, if you assigned names when creating it.

`someTuple.valueName`
*/

// Access a value of your Tuple by name






/*: ----------------------------------------------------------------------------------------------------
**Type Alias**

Type aliases define an alternative name for an existing type. You define type aliases with the typealias keyword.

Type aliases are useful when you want to refer to an existing type by a name that is contextually more appropriate, such as when working with data of a specific size from an external source.
*/

// Here we create a typeAlias for a UInt16
typealias AudioSample = UInt16

/*:
Once you define a type alias, you can use the alias anywhere you might use the original name.
*/

var maxAmplitudeFound = AudioSample.min

/*:
Here, AudioSample is defined as an alias for UInt16. Because it is an alias, the call to AudioSample.min actually calls UInt16.min, which provides an initial value of 0 for the maxAmplitudeFound variable.
*/


