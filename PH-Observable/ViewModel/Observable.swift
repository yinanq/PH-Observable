//
//  Observable.swift
//  PH-Observable
//
//  Created by Yinan Qiu on 6/1/20.
//  Copyright © 2020 Yinan. All rights reserved.
//

import Foundation

class Observable<ObservedType> {
    
    var valueUpdated: ((ObservedType?) -> ())?
    
    private var valuePrivate: ObservedType?
    
    public var value: ObservedType? {
        get {
            return valuePrivate
        }
        set {
            valuePrivate = newValue
            valueUpdated?(valuePrivate)
        }
    }
    
    init(_ value: ObservedType) {
        self.valuePrivate = value
    }
    
    func viewUpdatedValue(to value: ObservedType) {
        valuePrivate = value
        print("valuePrivate is updated to \(valuePrivate)")
    }
    
}
