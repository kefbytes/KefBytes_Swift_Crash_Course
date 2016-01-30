import UIKit

/*:
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

// try calling out new function and passing in the field names
names = getEnabledCustomerFields("name")
states = getEnabledCustomerFields("state")
primaryContacts = getEnabledCustomerFields("contact")
domains = getEnabledCustomerFields("domain")




