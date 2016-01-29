import Foundation

public struct Customer {
    
    public var enabled = false
    public var name: String
    public var state: String
    public var primaryContact: String
    public var domain: String
    
    public init(enabled: Bool, name: String, state: String, primaryContact: String, domain: String) {
        self.enabled = enabled
        self.name = name
        self.state = state
        self.primaryContact = primaryContact
        self.domain = domain
    }
}