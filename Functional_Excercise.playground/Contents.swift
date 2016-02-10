import UIKit
/*:
**Conjunction junction, pass that function**

***Functions as first class citizens***

customers is an array of Customer objects. Customer objects contain the following.
public var enabled = false
public var name: String
public var state: String
public var primaryContact: String
public var domain: String
*/
var customers = Customers.customers()

var test = "Test"
/*:
Below we have four functions, each loops through the customers array and returns an array of specific data about that customer, if the customer is enabled.
*/
func getEnabledCustomerNames() -> [String] {
    var returnedArray = [String]()
    for customer in customers {
        if customer.enabled {
            returnedArray.append(customer.name)
        }
    }
    return returnedArray
}

func getEnabledCustomerStates() -> [String] {
    var returnedArray = [String]()
    for customer in customers {
        if customer.enabled {
            returnedArray.append(customer.state)
        }
    }
    return returnedArray
    
}

func getEnabledCustomerPrimaryContacts() -> [String] {
    var returnedArray = [String]()
    for customer in customers {
        if customer.enabled {
            returnedArray.append(customer.primaryContact)
        }
    }
    return returnedArray
    
}

func getEnabledCustomerDomains() -> [String] {
    var returnedArray = [String]()
    for customer in customers {
        if customer.enabled {
            returnedArray.append(customer.domain)
        }
    }
    return returnedArray
    
}

var names = getEnabledCustomerNames()
var states = getEnabledCustomerStates()
var primaryContacts = getEnabledCustomerPrimaryContacts()
var domains = getEnabledCustomerDomains()


/*:
Our task is to refactor the four methods above using a more functional style of programming. In the process we will conforming to the DRY principle.
*/

// Start by creating a function that takes a single String parameter named fieldName and uses a long if else block to build the array.
func getEnabledCustomerFields(fieldName: String) -> [String] {
    var returnedArray = [String]()
    for customer in customers {
        if customer.enabled {
            if fieldName == "name" {
               returnedArray.append(customer.name)
            } else if fieldName == "state" {
                returnedArray.append(customer.state)
            } else if fieldName == "contact" {
                returnedArray.append(customer.primaryContact)
            } else if fieldName == "domain" {
                returnedArray.append(customer.domain)
            }

        }
    }
    return returnedArray
}

// try calling our new function and passing in the field names
names = getEnabledCustomerFields("name")
states = getEnabledCustomerFields("state")
primaryContacts = getEnabledCustomerFields("contact")
domains = getEnabledCustomerFields("domain")

/*:
The next step is to eliminate that ugly if else block we just added. To be funcitonal we want to accept a function as a parameter and use that parameter to replace the if else block. The function type should take a Customer and return a String, which will represent the field we want to add to the array.
*/
// Let's create a protocol that defines a func named getField
protocol FieldFunction {
    func getField(customer: Customer) -> String
}

// Rewrite our function replacing the fieldName parameter with the protocol type FieldFunction, then replace the if else block with a call to fieldFunction.getField and append the result to the array
func getEnabledCustomerFields(fieldFunction:FieldFunction) -> [String] {
    var returnedArray = [String]()
    for customer in customers {
        if customer.enabled {
            returnedArray.append(fieldFunction.getField(customer))
        }
    }
    return returnedArray
}


// Now create a class named CustomerName that implements the FieldFunction protocol, the getField function should return customer.name
class CustomerName: FieldFunction {
    func getField(customer: Customer) -> String {
        return customer.name
    }
}

// Create an instance of our CustomerName class
let customerName = CustomerName()

//Now we can call our getEnabledCustomerFields function passing our instance of CustomerName
getEnabledCustomerFields(customerName)

/*:
What's the problem with the way the code stands now? Well to start we would need to create objects for each of the field types we want to return (name, state, domain, contact). And pass it to our getEnabledCustomerFields function call.
*/
// Let's change our getEnabledCustomerFields function, renaming it getEnabledCustomerFieldsFromFunction, the parameter will be a function of type (Customer) -> String. We'll call this function passing the customer from the current iteration of the loop
func getEnabledCustomerFieldsFromFunction(fieldFunction: (Customer) -> String) -> [String] {
    var returnedArray = [String]()
    for customer in customers {
        if customer.enabled {
            returnedArray.append(fieldFunction(customer))
        }
    }
    return returnedArray
}

// Now instead of creating a class we can create functions and pass them. See how we are moving away from object oriented and more towards functional?
func getCustomerState(customer: Customer) -> String {
    return customer.state
}

// Now just call our getEnabledCustomerFieldsFromFunction passing in the function that we want to use.
getEnabledCustomerFieldsFromFunction(getCustomerState)

/*:
But hold on there, we're still creating a buynch of functions. Why do we need to do that? Well we don't, why not create the function on the fly when we are calling getEnabledCustomerFieldsFromFunction() and pass it in as a closure?

In a closure you omit the curly braces and insert the 'in' keyword before the body of the function. The closure itself is not named and only includes the function type and body. So the syntax is something like this 

functionType in body

Where functionType is any type you would like that may or may not include parameters and a return type, and body is what ever actions/logic that function is supposed to perform.
*/
// Call the getEnabledCustomerFieldsFromFunction function passing in a closure that is the function type and body of the getCustomerState function.
getEnabledCustomerFieldsFromFunction({
    (customer: Customer) -> String in return customer.state
})

// And of course we can make this a trailing closure for better readability. Move the closure outside of and after the ()
getEnabledCustomerFieldsFromFunction(){
    (customer: Customer) -> String in return customer.state
}

/*:
Now anytime you want to call the getEnabledCustomerFieldsFromFunction function you just pass in the closure you want to use.
*/
// We've gotten the customer states array not get the array for customer name, primary contact and domain.
getEnabledCustomerFieldsFromFunction(){
    (customer: Customer) -> String in return customer.name
}

getEnabledCustomerFieldsFromFunction(){
    (customer: Customer) -> String in return customer.primaryContact
}

getEnabledCustomerFieldsFromFunction(){
    (customer: Customer) -> String in return customer.domain
}

/*: 
So far so good, we are getting functional. Now let's shift gears slightly. What if we wanted to get a list/array of all customers that are enabled? The actual customer objects not just a field from the object?
Well we'd have to write a second function similar to our  getEnabledCustomerFieldsFromFunction function. But instead of filling our array with field values we'd be filling them with customer objects.
*/
// Our function would look something like this
func getEnabledCustomerInfo(fieldFunction: (Customer) -> Customer) -> [Customer] {
    var returnedArray = [Customer]()
    for customer in customers {
        if customer.enabled {
            returnedArray.append(fieldFunction(customer))
        }
    }
    return returnedArray
}

/*:
If we look closely we can see that this function is very similar to our other function. Wouldn't it be great if we could use the same function for both cases?

This can be accomplished easily using generics. We just define a generic parameter type and use that as a placeholder to replace the return type of the parameter function, the return type of our getEnabledCustomers function and the type of array we want to return.
*/
// Redo our getEnabledCustomers function using generics. Set a generic parameter type  <someParameterType> before the parameter list. Then use it as a placeholder for the rest of the function.
func getEnabledCustomerInfo<T>(fieldFunction: (Customer) -> T) -> [T] {
    var returnedArray = [T]()
    for customer in customers {
        if customer.enabled {
            returnedArray.append(fieldFunction(customer))
        }
    }
    return returnedArray
}

// Call the getEnabledCustomers function passing in a closure that just returns the customer object
getEnabledCustomerInfo(){
    (customer: Customer) -> Customer in return customer
}

// Call the getEnabledCustomers function to get the arrays filled with the various field values that we've been previously using (name, state, primaryContact and domain)
getEnabledCustomerInfo(){
    (customer: Customer) -> String in return customer.name
}

getEnabledCustomerInfo(){
    (customer: Customer) -> String in return customer.state
}

getEnabledCustomerInfo(){
    (customer: Customer) -> String in return customer.primaryContact
}

getEnabledCustomerInfo(){
    (customer: Customer) -> String in return customer.domain
}

/*:
Pretty exciting! Now we have one function that returns either a value or object and we just call that function passing in a closure.

What if we wanted to prepend or postfix something on one of the field values we are returning? Simple just do it in the closure you are passing.
*/
// Call or getEnabledCustomers function and return an array of states, but postfix the state with a colon and then USA. Example: NC:USA
getEnabledCustomerInfo(){
    (customer: Customer) -> String in return "\(customer.state):USA"
}

/*:
Let's make one last adjustment. What if we wanted to get all the same information we already are getting but for customers who are disabled? Would we right a second function? Of course not. We'd pass in a function that tested whether or not the customer was enabled or disabled and return the appropriate list.
*/
// Let's change our getEnabledCustomerInfo again and rename it getCustomerInfo. We want to add a second parameter named isEnabled that is a function type of (Customer) -> Bool. Then we replace our if customer.enabled check with a call to the isEnabled function.
func getCustomerInfo<T>(fieldFunction: (Customer) -> T, isEnabled: (Customer) -> Bool) -> [T] {
    var returnedArray = [T]()
    for customer in customers {
        if isEnabled(customer) {
            returnedArray.append(fieldFunction(customer))
        }
    }
    return returnedArray
}

// Now when we call the getCustomerInfo function we need to pass a closure specifying if we want enabled or disabled customers. keep in mind that only the last closure can be a trailing closure.
getCustomerInfo({
    (customer: Customer) -> String in return customer.name})
    { (customer: Customer) -> Bool in return customer.enabled // returns enalbled customers
}

getCustomerInfo({
    (customer: Customer) -> String in return customer.name})
    { (customer: Customer) -> Bool in return !customer.enabled // returns disabled customers
}

/*:
*Pure Functions*

Sometimes requirements change over time. We're going to act as if that's the case now. The product owner now wants to have a way to enable or disable customer via a contract. We have added a class named Contract that includes a begin date, an end date and an enabled flag. We updated our Customer object so that now each Customer has a contract associated with them.

Now when we want a customer to be enabled or disabled we will do that on their contract. We have a function here that disables the contract on a customer.
*/
public func setContractDisabledForCustomer(customerId: Int) {
    for (index, value) in customers.enumerate() {
        if customerId == value.customerId {
            value.contract.enabled = false
            customers[index] = value
        }
    }
}

setContractDisabledForCustomer(007)
for customer in customers {
    print("\(customer.customerId) enabled = \(customer.contract.enabled)")
}

/*:

When we look at this function the first thing we think is that this probably won't be the last time we want to get a customer by customerId. So we decide we should make that it's own function.
*/
// Create a function named getCustomerById that takes a customerId as an argument, loops over the customers array and returns an array with any matching customers. If no customer with that Id exists return an empty array.
func getCustomerById(id: Int) -> [Customer] {
    var customersArray = [Customer] ()
    for customer in customers {
        if customer.customerId == id {
            customersArray.append(customer)
        }
    }
    return customersArray
}

//We could also extract that for loop into it's own function named filterCustomers. This function will take function of type (Customer) -> Bool. With the Bool indicating if we should use the customer.
func filterCustomers(filter: (Customer) -> Bool) -> [Customer] {
    var returnArray = [Customer]()
    for customer in customers {
        if filter(customer) {
            returnArray.append(customer)
        }
    }
    return returnArray
}

// Now we can refactor our getCustomersById function and rename it getCustomersByIdUsingFilterCustomers. We'll use our new filterCustomers func, removing the for loop.
func getCustomerByIdUsingFilterCustomers(id: Int) -> [Customer] {
    return filterCustomers(){
        (customer: Customer) -> Bool in
        customer.customerId == id
    }
}

let customer007 = getCustomerByIdUsingFilterCustomers(007)

/*:
To truly make functions pure they should not reference anything out side their function. This means all those functions we created referencing the customers array should be refactored to instead accept that array when called.
*/
// Let's start with the filterCustomers function. We on't need to rename it since we are changing the function type. Add an array of Customers as a parameter and access that where we were accessing the customers array directly.
func filterCustomers(customersIn: [Customer], filter: (Customer) -> Bool) -> [Customer] {
    var returnArray = [Customer]()
    for customer in customersIn {
        if filter(customer) {
            returnArray.append(customer)
        }
    }
    return returnArray
}

// The refactor getCustomersById the same way.
func getCustomersById(customersIn: [Customer], id: Int) -> [Customer] {
    var customersArray = [Customer] ()
    for customer in customersIn {
        if customer.customerId == id {
            customersArray.append(customer)
        }
    }
    return customersArray
}

// Now do the same for setContractDisabledForCustomer, we will need to add a return type of [Customer] since we will now be returning a modified array and not modiying the original array.
public func setContractDisabledForCustomer(var customersIn: [Customer], customerId: Int) -> [Customer] {
    for (index, value) in customersIn.enumerate() {
        if customerId == value.customerId {
            value.contract.enabled = false
            customersIn[index] = value
        }
    }
    return customersIn
}


