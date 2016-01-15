//: Playground - noun: a place where people can play

import UIKit

/*:
## Generics

Generic code enables you to write flexible, reusable functions and types that can work with any type, subject to requirements that you define. You can write code that avoids duplication and expresses its intent in a clear, abstracted manner. Much of the Swift standard library is built with generic code.

Swift’s Array and Dictionary types are both generic collections.
*/

// Create a function that swaps two Ints

func swapTwoInt(inout a: Int, inout b: Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

// test it out

var firstInt = 7
var secondInt = 11

swapTwoInt(&firstInt, b: &secondInt)
firstInt
secondInt



// Wouldn't it be better to have a function that swaps any two values?

// Let's change our func to use generics.
// The first thing you need to do is define the function with a type parameter. You do this by placing some arbitrary name inside angled brackets. This goes before the parameters.

// func swapTwoValues<T> ...

// Then we will use that type parameter as a placeholder for the type of our parameters

func swapTwoValues<T>(inout a: T, inout b: T) {
    let temporaryA = a
    a = b
    b = temporaryA
    
}

swapTwoValues(&firstInt, b: &secondInt)



// Now we can swap two of anything

// Let's try it with Strings

var child1 = "Hannah"
var child2 = "Noah"

swapTwoValues(&child1, b: &child2)
child1
child2

// In this example the type of the two parameters must be the same

// The type will be determined when the function is called, and inferred using whatever is passed in

// You could have used any arbitrary character for our type parameter, something descriptive is most useful



// You could even used a string



/*:
In most cases, type parameters have descriptive names, such as Key and Value in Dictionary<Key, Value> and Element in Array<Element>, which tells the reader about the relationship between the type parameter and the generic type or function it’s used in. However, when there isn’t a meaningful relationship between them, it’s traditional to name them using single letters such as T, U, and V.
*/

// You can provide more than one type parameter by writing multiple type parameter names within the angle brackets, separated by commas.



/*:
In addition to generic functions, Swift enables you to define your own generic types. These are custom classes, structures, and enumerations that can work with any type, in a similar way to Array and Dictionary.
*/

// Example:
struct Stack<Element> {
    var items = [Element]()
    mutating func push(item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

// mutating allows us to change the value of items within our function

// You can extend a generic type

extension Stack {
    
}
/*: 
**Mixing Swift and Objective C**

To import a set of Objective-C files in the same app target as your Swift code, you rely on an Objective-C bridging header to expose those files to Swift. Xcode offers to create this header file when you add a Swift file to an existing Objective-C app, or an Objective-C file to an existing Swift app.

To import Objective-C code into Swift from the same target

In your Objective-C bridging header file, import every Objective-C header you want to expose to Swift. For example:
    
#import "XYZCustomCell.h"
#import "XYZCustomView.h"
#import "XYZCustomViewController.h"

In Build Settings, in Swift Compiler - Code Generation, make sure the Objective-C Bridging Header build setting under has a path to the bridging header file.
The path should be relative to your project, similar to the way your Info.plist path is specified in Build Settings. In most cases, you should not need to modify this setting.

When you import Swift code into Objective-C, you rely on an Xcode-generated header file to expose those files to Objective-C. This automatically generated file is an Objective-C header that declares the Swift interfaces in your target. It can be thought of as an umbrella header for your Swift code. The name of this header is your product module name followed by adding "-Swift.h". 

Once you import your Swift code into Objective-C, use regular Objective-C syntax for working with Swift classes.
*/

/*: 
When I wanted to add a swift class and access it from an Obj C class.

I had to add this import to any class that wanted to access the swift class

#import "LOWES-swift.h"

Make sure the new swift file has the Target Membership set in the File Inspector.

Items marked as private in Swift will not be available in Obj-C

*/
