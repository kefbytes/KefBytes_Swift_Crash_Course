import Foundation

public struct Customers {

    static var customer1 = Customer(enabled: true, name: "Luke Skywalker", state: "CA", primaryContact: "Princess Leia", domain: "rebelAlliance.com", id: 001)
    static var customer2 = Customer(enabled: true, name: "Darth Vader", state: "WY", primaryContact: "The Emperor", domain: "empire.com", id: 002)
    static var customer3 = Customer(enabled: true, name: "Princess Leia", state: "NC", primaryContact: "Luke Skywalker", domain: "rebelAlliance.com", id: 003)
    static var customer4 = Customer(enabled: true, name: "Han Solo", state: "MO", primaryContact: "Chewbacca", domain: "rebelAlliance.com",id: 004)
    static var customer5 = Customer(enabled: true, name: "Yoda", state: "NY", primaryContact: "Obi-Wan Kenobi", domain: "rebelAlliance.com", id: 005)
    static var customer6 = Customer(enabled: false, name: "R2D2", state: "AL", primaryContact: "Momma Cook", domain: "droids.com", id: 006)
    static var customer7 = Customer(enabled: true, name: "Bobo Fett", state: "FL", primaryContact: "Jango Fett", domain: "bountyHunter.com", id: 007)
    static var customer8 = Customer(enabled: true, name: "Obi-Wan Kenobi", state: "AR", primaryContact: "Yoda", domain: "rebelAlliance.com", id: 008)
    static var customer9 = Customer(enabled: true, name: "Chewbacca", state: "MO", primaryContact: "Han Solo", domain: "wookie.com", id: 009)
    static var customer10 = Customer(enabled: false, name: "Jabba The Hutt", state: "NM", primaryContact: "Pizza The Hutt", domain: "blob.com", id: 000)


    public init() {
        
    }
    
    public static func customers() -> [Customer] {
        let customersArray = [customer1, customer2, customer3, customer4, customer5, customer6, customer7, customer8, customer9, customer10]
        return customersArray
    }
}

