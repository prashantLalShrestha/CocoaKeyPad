//
//  KeyboardConfig.swift
//  CoreUIKit
//
//  Created by Prashant Shrestha on 1/10/20.
//  Copyright © 2020 Prashant Shrestha. All rights reserved.
//

import Foundation
import DeviceX

struct KeyboardConfig {
    struct BaseDimension {
        static var topMargin: CGFloat {
            switch DeviceX.current.size {
            case .screen4Inches:
                return 16
            case .screen4Dot7Inches, .screen5Dot5Inches:
                return 20.0
            case .screen5Dot8Inches, .screen6Dot1Inches, .screen6Dot5Inches:
                return 28.0
            default:
                return 28.0
            }
        }
        static var bottomMargin: CGFloat {
            switch DeviceX.current.size {
            case .screen4Inches:
                return 24
            case .screen4Dot7Inches, .screen5Dot5Inches:
                return 36.0
            case .screen5Dot8Inches, .screen6Dot1Inches, .screen6Dot5Inches:
                return 48.0
            default:
                return 48.0
            }
        }
        static var sideMargin: CGFloat {
            switch DeviceX.current.size {
            case .screen4Inches:
                return 26
            case .screen4Dot7Inches, .screen5Dot5Inches:
                return 32.0
            case .screen5Dot8Inches, .screen6Dot1Inches, .screen6Dot5Inches:
                return 40.0
            default:
                return 40.0
            }
        }
        
        static var horizontalSpacing: CGFloat {
            switch DeviceX.current.size {
            case .screen4Inches:
                return 16.0
            case .screen4Dot7Inches, .screen5Dot5Inches:
                return 20.0
            case .screen5Dot8Inches, .screen6Dot1Inches, .screen6Dot5Inches:
                return 20
            default:
                return 20
            }
        }
        static var verticalSpacing: CGFloat {
            switch DeviceX.current.size {
            case .screen4Inches:
                return 26.0
            case .screen4Dot7Inches, .screen5Dot5Inches:
                return 32.0
            case .screen5Dot8Inches, .screen6Dot1Inches, .screen6Dot5Inches:
                return 40.0
            default:
                return 40.0
            }
        }
        public static var buttonHeight: CGFloat {
            switch DeviceX.current.size {
            case .screen4Inches:
                return 50.0
            case .screen4Dot7Inches, .screen5Dot5Inches:
                return 57.0
            case .screen5Dot8Inches, .screen6Dot1Inches, .screen6Dot5Inches:
                return 70.0
            default:
                return 70.0
            }
        }
    }
    struct Font {
        static var buttonFont: UIFont {
            switch DeviceX.current.size {
            case .screen4Inches:
                return UIFont(name: "HelveticaNeue-Light", size: 30.0)!
            case .screen4Dot7Inches, .screen5Dot5Inches:
                return UIFont(name: "HelveticaNeue-Light", size: 35.0)!
            case .screen5Dot8Inches, .screen6Dot1Inches, .screen6Dot5Inches:
                return UIFont(name: "HelveticaNeue-Light", size: 40.0)!
            default:
                return UIFont(name: "HelveticaNeue-Light", size: 40.0)!
            }
        }
    }
}
