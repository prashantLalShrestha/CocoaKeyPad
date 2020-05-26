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
    
    static func backImage() -> UIImage {
        return UIGraphicsImageRenderer(size: CGSize(width: 22, height: 16)).image { _ in
            //// Color Declarations
            let strokeColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)

            //// Bezier Drawing
            let bezierPath = UIBezierPath()
            bezierPath.move(to: CGPoint(x: 21, y: 1))
            bezierPath.addLine(to: CGPoint(x: 8, y: 1))
            bezierPath.addLine(to: CGPoint(x: 1, y: 9))
            bezierPath.addLine(to: CGPoint(x: 8, y: 17))
            bezierPath.addLine(to: CGPoint(x: 21, y: 17))
            bezierPath.addCurve(to: CGPoint(x: 23, y: 15), controlPoint1: CGPoint(x: 22.1, y: 17), controlPoint2: CGPoint(x: 23, y: 16.1))
            bezierPath.addLine(to: CGPoint(x: 23, y: 3))
            bezierPath.addCurve(to: CGPoint(x: 21, y: 1), controlPoint1: CGPoint(x: 23, y: 1.9), controlPoint2: CGPoint(x: 22.1, y: 1))
            bezierPath.close()
            strokeColor.setStroke()
            bezierPath.lineWidth = 2
            bezierPath.miterLimit = 4
            bezierPath.lineCapStyle = .round
            bezierPath.lineJoinStyle = .round
            bezierPath.stroke()


            //// Bezier 2 Drawing
            let bezier2Path = UIBezierPath()
            bezier2Path.move(to: CGPoint(x: 18, y: 6))
            bezier2Path.addLine(to: CGPoint(x: 12, y: 12))
            strokeColor.setStroke()
            bezier2Path.lineWidth = 2
            bezier2Path.miterLimit = 4
            bezier2Path.lineCapStyle = .round
            bezier2Path.lineJoinStyle = .round
            bezier2Path.stroke()


            //// Bezier 3 Drawing
            let bezier3Path = UIBezierPath()
            bezier3Path.move(to: CGPoint(x: 12, y: 6))
            bezier3Path.addLine(to: CGPoint(x: 18, y: 12))
            strokeColor.setStroke()
            bezier3Path.lineWidth = 2
            bezier3Path.miterLimit = 4
            bezier3Path.lineCapStyle = .round
            bezier3Path.lineJoinStyle = .round
            bezier3Path.stroke()

        }
    }
    
}
