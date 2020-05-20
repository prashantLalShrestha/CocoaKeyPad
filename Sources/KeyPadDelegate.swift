//
//  KeyPadDelegate.swift
//  CocoaKeyPad
//
//  Created by Prashant Shrestha on 5/20/20.
//  Copyright © 2020 Inficare. All rights reserved.
//

import UIKit


public protocol KeyPadDelegate {
    func inputString(text: String)
    func didTapNumber(number: String)
    func didTapClear()
}
