//
//  UITextField+KeyPad.swift
//  CocoaKeyPad
//
//  Created by Prashant Shrestha on 5/20/20.
//  Copyright © 2020 Inficare. All rights reserved.
//

import UIKit

public extension UITextField {
    
    func setInputView(_ inputView: UIView?) {
        self.inputView = inputView
        (inputView as? KeyPadView)?.delegate = self
    }
}

extension UITextField: KeyPadDelegate { }

extension KeyPadDelegate where Self: UITextField {
    public func didTapNumber(number: String) {
        self.insertText(number)
    }
    
    public func didTapClear() {
        self.deleteBackward()
    }
    
    public func inputString(text: String) {
    }
}
