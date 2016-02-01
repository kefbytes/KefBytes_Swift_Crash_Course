import UIKit
/*:
**Conjunction junction, what's your function (al) app doing**

customers is an array of Customer objects. Customer objects contain the following.
public var enabled = false
public var name: String
public var state: String
public var primaryContact: String
public var domain: String
*/
let customers = Customers.customers()
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

