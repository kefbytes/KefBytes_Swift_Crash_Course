import UIKit
/*:
![Local Image](Cardinal_Logo.png)

# Swift Crash Course
*A fast paced intro to Swift*

Fun with functions
*/
// Here's a dictionary of numbers
let digits = ["zero": 0, "one": 1, "two": 2, "three": 3, "four": 4, "five": 5, "six": 6, "seven": 7, "eight": 8, "nine": 9]

// create a function named add() that takes an array of Strings as its argument. It then lloks up the numeric equivalent from our digits dictionary and sums them all and then returns and Int

// call the add function passing in an array of the english words for a couple numbers example:["one", "three"]

/*: more functions */
// Here's an array of numbers that we're going to use
var numbers = [5,2,8,3,9,4]

// create a function named addOneHundred that takes an array of int's, then returns an array of int's. The new array should include the numbers from the input array with 100 added to them

// call our func passing in our numbers array

// Now create a similar function named modifyByOneHundred that does the same thing but actually changes the array passed in.

/*: variadic parameters */
// create a function performing the same functionality but using a variadic parameter

/*: inout parameters */
// create the same function but set the parameter array to be if type inout

// call previous func with our number2 array then check array values

// call new inout version and do the same

// Create a simple function that takes a number and multiplies it by 100 then returns the result

// reset our numbers array as the values are getting pretty large

/*: function as the second parameter */
// create the same func but add a second param that is a closure: modificationOf:(Int) -> Int
// in the for loop we want to call that closure with the current loops value

// call our new func passing in our numbers array and the times100 func

// It's really just doing this right? But the difference is we get to let the modification be dynamic rather than static

/*: closure */
// let's change the function to use a closure, keep the first parameter the same and add a second that is a function type named modification who's type is (Int) -> Int. Replace the statement inside the for loop and replace the assignment to array[i] with a call to the modification closure using array[i] as the parameter

// try calling this function, passing in our numbers array again and a closure

// we can shorten this since Swift is able to infer the return type and with that being the case we don't need the parens around the parameter. we might as well put it all on one line too

// now lets change the call to use a trailing closure, when doing so we don't need to use the parameter name

/*: generics */
// but what if we wanted to do the same thing with doubles and not ints? Here's an array of doubles we can use
var doubles = [5.0, 2.0, 8.0, 3.0, 9.0, 4.0]

// create a version of our most recent func but use doubles instead of ints

// call our doubles array passing the doubles array

// Wouldn't it be nice to have one function that could handle both?
// This is where generics come in

// create the same function but use generics

// call the function twice, once with the numbers and once with the doubles array

/*: 
Mutating functions

The type of a Swift array is written in full as Array<Element>, where Element is the type of values the array is allowed to store.
*/
// Let's assume that we want to add this func to any array we want to use. To do so we would use an extension and extend array. Let's start with extending Array and adding the same function we have been creating, use the latest version. We'll rename our function to arrayMutation.

// But here's the thing. Since we are inside the Array class now we don't need generics and can just use the Array type which is element. And since it is going to be modiying our array we need to mark the function as mutating. We can also get rid of the array we are passing in since we will be working on  self, which is an array.


// reseting numbers so the Int start out smaller again
numbers = [5,2,8,3,9,4]

// Now we can call the arrayMutation function on the array itself passing it the closure we've been using

// This would be a version that did not modify self, but instead returned a new array

// Here's the real beauty of adding the function to our array extension and making it mutating. What if we didn't want to multiply by 100 each time but different something different. Now we can.


