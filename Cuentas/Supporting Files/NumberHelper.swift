//
//  NumberHelper.swift
//  Cuentas
//
//  Created by Daniel Bonini on 10/24/18.
//  Copyright © 2018 Daniel Bonini. All rights reserved.
//

import Foundation

public extension Int{
    public var stringValue : String {
        return "\(self)"
    }
}


public extension Int16 {
    public var stringValue : String {
        return "\(self)"
    }
}

public extension Int32 {
    public var stringValue : String {
        return "\(self)"
    }
}

public extension Int64 {
    public var stringValue : String {
        return "\(self)"
    }
}


public extension Double {
    func string(with style: NumberFormatter.Style) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = style
        
        return formatter.string(from: NSNumber(value: self))
    }
}
