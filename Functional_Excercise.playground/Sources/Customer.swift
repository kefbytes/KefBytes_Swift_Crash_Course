import Foundation

public class Customer {
    
    public var enabled = false
    public var name: String
    public var state: String
    public var primaryContact: String
    public var domain: String
    public var customerId: Int
    public var contract: Contract
    
    public init(enabled: Bool, name: String, state: String, primaryContact: String, domain: String, id: Int) {
        self.enabled = enabled
        self.name = name
        self.state = state
        self.primaryContact = primaryContact
        self.domain = domain
        self.customerId = id
        self.contract = Contract(beginDate: "02/08/2016")
    }
    
}