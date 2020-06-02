//
//  BoundTextField.swift
//  PH-Observable
//
//  Created by Yinan Qiu on 6/1/20.
//  Copyright © 2020 Yinan. All rights reserved.
//

import UIKit

class BoundTextField: UITextField {
    
    func bind(to observable: Observable<String>) {
        
        addTarget(self, action: #selector(updated), for: .editingChanged)
        
        updatedClosure = { [weak self] in
            observable.viewUpdatedValue(to: self?.text ?? "")
        }
        
        observable.valueUpdated = { [weak self] newValue in
            self?.text = newValue
        }
        
    }
    
    @objc func updated() { updatedClosure?() }
    
    var updatedClosure: ( () -> () )?
    
}
