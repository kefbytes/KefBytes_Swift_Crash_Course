import UIKit
//: ## Conjunction junction, pass that function
//: ----
var customers = Customers.customers()
/*:
> customers is an array of Customer objects. Customer objects contain the following.

```public var enabled = false```
 
```public var name: String```
 
```public var state: String```
 
```public var primaryContact: String```
 
```public var domain: String```
 
*/
customers
/*:
> Below we have four functions, each loops through the customers array and returns an array of specific data about that customer, if the customer is enabled.
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
> Our task is to refactor the four methods above using a more functional style of programming. In the process we will conforming to the DRY principle.
*/

// Start by creating a function named getEnabledCustomerFields that takes a single String parameter named fieldName and uses an if else block to build an array[String] making use of our customers array and the fieldName passed in and then returns the array we built.
func getEnabledCustomerFields(fieldName: String) -> [String] {
    var returnedArray = [String]()
    for customer in customers {
        if customer.enabled {
//            if fieldName == "name" {
            if fieldName == Constants.nameField {
               returnedArray.append(customer.name)
            } else if fieldName == Constants.stateField {
                returnedArray.append(customer.state)
            } else if fieldName == Constants.contactField {
                returnedArray.append(customer.primaryContact)
            } else if fieldName == Constants.domainField {
                returnedArray.append(customer.domain)
            }

        }
    }
    return returnedArray
}

// try calling our new function and passing in the field names
names = getEnabledCustomerFields(Constants.nameField)
states = getEnabledCustomerFields(Constants.stateField)
primaryContacts = getEnabledCustomerFields(Constants.contactField)
domains = getEnabledCustomerFields(Constants.domainField)

/*:
> The next step is to eliminate that ugly if else block we just added. To be funcitonal we want to accept a function as a parameter and use that parameter to replace the if else block. The function type should take a Customer and return a String, which will represent the field we want to add to the array.
*/
// Let's create a protocol named FieldsDelegate that defines a func named getField
protocol FieldsDelegate {
    func getField(customer: Customer) -> String
}

// Rewrite our function replacing the fieldName parameter with the protocol type FieldFunction, then replace the if else block with a call to fieldFunction.getField passing in the urrent customer and appending the result to the array before returning the array
func getEnabledCustomerFields(fieldFunction:FieldsDelegate) -> [String] {
    var returnedArray = [String]()
    for customer in customers {
        if customer.enabled {
            returnedArray.append(fieldFunction.getField(customer))
        }
    }
    return returnedArray
}


// Now create a class named CustomerName that implements the FieldFunction protocol, the getField function should return customer.name
class CustomerName: FieldsDelegate {
    func getField(customer: Customer) -> String {
        return customer.name
    }
}

// Create an instance of our CustomerName class
let customerName = CustomerName()

//Now we can call our getEnabledCustomerFields function passing our instance of CustomerName
getEnabledCustomerFields(customerName)


// We could do the same thing with each of the fields, here's the contactField example
class CustomerContact: FieldsDelegate {
    func getField(customer: Customer) -> String {
        return customer.primaryContact
    }
}

let customerContact = CustomerContact()

getEnabledCustomerFields(customerContact)

/*:
> What's the problem with this approach? Well to start we would need to create objects for each of the field types we want to return (name, state, domain, contact). And pass it to our getEnabledCustomerFields function call.
*/
// Let's change our getEnabledCustomerFields function, renaming it getEnabledCustomerFieldsFromFunction, the parameter will be a function named fieldFunction with type (Customer) -> String. We'll call this function in our for loop passing the current customer, appending the array and then returning it.
func getEnabledCustomerFieldsFromFunction(fieldFunction: (Customer) -> String) -> [String] {
    var returnedArray = [String]()
    for customer in customers {
        if customer.enabled {
            returnedArray.append(fieldFunction(customer))
        }
    }
    return returnedArray
}

// Now instead of creating a class we can create functions and pass them. We are moving away from object oriented and more towards functional thinking.
func getCustomerState(customer: Customer) -> String {
    return customer.state
}

// Now just call our getEnabledCustomerFieldsFromFunction passing in the function that we want to use.
getEnabledCustomerFieldsFromFunction(getCustomerState)

// And of course we could do the same with the other fields just by creating those functions and passing them.

func getCustomerDomain(customer: Customer) -> String {
    return customer.domain
}

getEnabledCustomerFieldsFromFunction(getCustomerDomain)

/*:
> But hold on there, we're still creating a bunch of functions. Why do we need to do that? Well we don't, why not create the function on the fly when we are calling getEnabledCustomerFieldsFromFunction() and pass it in as a closure?

> In a closure you omit the curly braces and insert the 'in' keyword before the body of the function. The closure itself is not named and only includes the function type and body. So the syntax is something like this

```functionType in body```

> Where functionType is any type that may or may not include parameters and a return type, and body is whatever actions/logic that function is supposed to perform.
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
> Now anytime you want to call the getEnabledCustomerFieldsFromFunction function you just pass in the closure you want to use.
*/
// We've gotten the customer states array now get the array for customer name, primary contact and domain.
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
> So far so good, we are getting functional. Now let's shift gears slightly. What if we wanted to get a list/array of all customers that are enabled? The actual customer objects not just a field from the object?
Well we'd have to write a second function similar to our  getEnabledCustomerFieldsFromFunction function. But instead of filling our array with field values we'd be filling them with customer objects.
*/
// Our function would look something like this
//func getEnabledCustomerInfo(fieldFunction: (Customer) -> Customer) -> [Customer] {
//    var returnedArray = [Customer]()
//    for customer in customers {
//        if customer.enabled {
//            returnedArray.append(fieldFunction(customer))
//        }
//    }
//    return returnedArray
//}

func getEnabledCustomerInfo() -> [Customer] {
    var returnedArray = [Customer]()
    for customer in customers {
        if customer.enabled {
            returnedArray.append(customer)
        }
    }
    return returnedArray
}

getEnabledCustomerInfo()
/*:
> If we look closely we can see that this function is similar to our other function, just with no parameters. Wouldn't it be great if we could use the same function for both cases ([String] and [Customer])?

> This can be accomplished easily using generics. We just define a generic parameter type and use that as a placeholder to replace the return type of the parameter function, the return type of our getEnabledCustomers function and the type of array we want to return.
*/
// Redo our getEnabledCustomers function using generics (we'll need to add the parameters back in). Set a generic parameter type  <someParameterType> before the parameter list. Then use it as a placeholder for the rest of the function.
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
> Pretty exciting! Now we have one function that returns either a value or object and we just call that function passing in a closure.

> What if we wanted to prepend or postfix something on one of the field values we are returning? Simple just do it in the closure you are passing.
*/
// Call or getEnabledCustomers function and return an array of states, but postfix the state with a colon and then USA. Example: NC:USA
getEnabledCustomerInfo(){
    (customer: Customer) -> String in return "\(customer.state):USA"
}

/*:
> Let's make one last adjustment. What if we wanted to get all the same information we already are getting but for customers who are disabled? Would we write a second function? Of course not. We'd pass in a function that tested whether or not the customer was enabled or disabled and return the appropriate list.
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
    { (customer: Customer) -> Bool in return customer.enabled // returns enabled customers
}

getCustomerInfo({
    (customer: Customer) -> String in return customer.name})
    { (customer: Customer) -> Bool in return !customer.enabled // returns disabled customers
}

/*:
## Pure Functions ##

> Sometimes requirements change over time. We're going to act as if that's the case now. The product owner now wants to have a way to enable or disable customer via a contract. We have added a class named Contract that includes a begin date, an end date and an enabled flag. We updated our Customer object so that now each Customer has a contract associated with them.

> Now when we want a customer to be enabled or disabled we will do that on their contract. We have a function here that disables the contract on a customer.
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

customers

for customer in customers {
    print("\(customer.customerId) enabled = \(customer.contract.enabled)")
}

/*:
> When we look at this function the first thing we think is that this probably won't be the last time we want to get a customer by customerId. So we decide we should make that it's own function.
*/
//// Create a function named getCustomerById that takes a customerId as an argument, loops over the customers array and returns an array with any matching customers. If no customer with that Id exists return an empty array.
//func getCustomerById(id: Int) -> [Customer] {
//    var customersArray = [Customer] ()
//    for customer in customers {
//        if customer.customerId == id {
//            customersArray.append(customer)
//        }
//    }
//    return customersArray
//}
//
////We could also extract that for loop into it's own function named filterCustomers. This function will take function of type (Customer) -> Bool. With the Bool indicating if we should use the customer.
//func filterCustomers(filter: (Customer) -> Bool) -> [Customer] {
//    var returnArray = [Customer]()
//    for customer in customers {
//        if filter(customer) {
//            returnArray.append(customer)
//        }
//    }
//    return returnArray
//}
//
//// Now we can refactor our getCustomersById function and rename it getCustomersByIdUsingFilterCustomers. We'll use our new filterCustomers func, removing the for loop.
//func getCustomerByIdUsingFilterCustomers(id: Int) -> [Customer] {
//    return filterCustomers(){
//        (customer: Customer) -> Bool in
//        customer.customerId == id
//    }
//}
//
//let customer007 = getCustomerByIdUsingFilterCustomers(007)

/*:
> To truly make functions pure they should not reference anything out side their function. This means all those functions we created referencing the customers array should be refactored to instead accept that array when called.
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

// Then refactor getCustomerByIdUsingFilterCustomers, it needs to accept a customer array which it will in turn pass to filterCustomers
func getCustomerByIdUsingFilterCustomers(customersIn: [Customer], id: Int) -> [Customer] {
    return filterCustomers(customersIn){
        (customer: Customer) -> Bool in
        customer.customerId == id
    }
}


// Now do the same for setContractDisabledForCustomer, we will need to add a return type of [Customer] since we will now be returning a modified array and not modiying the original array.
public func setContractDisabledForCustomer(customersIn: [Customer], customerId: Int) -> [Customer] {
    var customerArray = customersIn
    for (index, value) in customersIn.enumerate() {
        if customerId == value.customerId {
            value.contract.enabled = false
            customerArray[index] = value
        }
    }
    return customerArray
}

let customer007 = getCustomerByIdUsingFilterCustomers(customers, id: 007)

// forEach func
func forEach(customersIn: [Customer], changeValue: (Customer) -> Void ) -> [Customer] {
    var returnArray = [Customer]()
    for customer in customersIn {
        changeValue(customer)
        returnArray.append(customer)
    }
    return returnArray
}

forEach(getCustomerByIdUsingFilterCustomers(customers, id: 007)) {
    (customer: Customer) -> Void in
    customer.contract.enabled = true
}

print("________________________________________")
for customer in customers {
    print("\(customer.customerId) enabled = \(customer.contract.enabled)")
}

// refactor setContractDisabledForCustomer renaming it setContractOnCustomer. We'll use our new forEach function and return an array of disabled customers so that our BA can have a list of changed Customers. We want this function to be used whether we are enabling or disabling a customer contract, so we need to add a Bool parameter that will be used to set the contract.
public func setContractDisabledForCustomerWithForEach(customersIn: [Customer], customerId: Int, contractStatus: Bool) -> [Customer] {
    return forEach(getCustomerByIdUsingFilterCustomers(customersIn, id: customerId)) {
        (customer: Customer) -> Void in
        customer.contract.enabled = contractStatus
    }
}

let disabledCustomersArray = setContractDisabledForCustomerWithForEach(customers, customerId: 007, contractStatus: false)
print("________________________________________")
for customer in disabledCustomersArray {
    print("\(customer.customerId) enabled = \(customer.contract.enabled)")
}

let enabledArray = setContractDisabledForCustomerWithForEach(customers, customerId: 008, contractStatus: true)
print("________________________________________")
for customer in enabledArray {
    print("\(customer.customerId) enabled = \(customer.contract.enabled)")
}

