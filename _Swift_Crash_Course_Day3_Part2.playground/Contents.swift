//: Playground - noun: a place where people can play

import UIKit

/*:
## Generics

Generic code enables you to write flexible, reusable functions and types that can work with any type, subject to requirements that you define. You can write code that avoids duplication and expresses its intent in a clear, abstracted manner. Much of the Swift standard library is built with generic code.

Swift’s Array and Dictionary types are both generic collections.
*/

// Create a function that swaps two Ints



// test it out



// Wouldn't it be better to have a function that swaps any two values?

// Let's change our func to use generics.
// The first thing you need to do is define the function with a type parameter. You do this by placing some arbitrary name inside angled brackets. This goes before the parameters.

// func swapTwoValues<T> ...

// Then we will use that type parameter as a placeholder for the type of our parameters



// Now we can swap two of anything

// Let's try it with Strings



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

