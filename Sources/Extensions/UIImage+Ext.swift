//
//  UIImage+Ext.swift
//  CocoaKeyPad
//
//  Created by Prashant Shrestha on 5/20/20.
//  Copyright © 2020 Inficare. All rights reserved.
//

import UIKit

extension UIImage {
    convenience init?(podImageName: String) {
        let podBundle = Bundle(for: KeyPadView.self)
        guard let url = podBundle.url(forResource: "KeyboardAsset", withExtension: "bundle") else {
            return nil
        }
        self.init(named: podImageName, in: Bundle(url: url), compatibleWith: nil)
    }
}
