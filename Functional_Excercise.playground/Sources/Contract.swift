import Foundation

public class Contract {
    
    public var begin_date: String
    public var end_date: String
    public var enabled: Bool = true

    init(beginDate: String) {
        begin_date = beginDate
        end_date = beginDate
    }
    
}