//
//  KRDeviceType.swift
//  Connectoo
//
//  Created by ulian_onua on 3/20/17.
//  Copyright © 2017 ulian_onua. All rights reserved.
//

import Foundation
import UIKit

enum DeviceType : String {
    case iPhone
    case iPad
    case iPhone4s
    case iPhone5
    case iPhone6
    case iPhone6Plus
    case iPad2
    case iPadMini
    case iPadAir
    case iPadPro_9_7
    case iPadPro_12_9
}


class KRDeviceType {

    static var deviceType : UIUserInterfaceIdiom {
        return UIDevice.current.userInterfaceIdiom
    }
    
    static var isiPhone : Bool {
        return deviceType == .phone
    }
    
    static var isiPad : Bool {
        return deviceType == .pad
    }
    
    //MARK: iPhone
    
    static var isiPhone4s : Bool {
        return isMainScreenEqual(to: CGSize.init(width: 320.0, height: 480.0))
    }
    
    static var isiPhone5 : Bool {
        return isMainScreenEqual(to: CGSize.init(width: 320.0, height: 568.0))
    }
    
    static var isiPhone6 : Bool {
        return isMainScreenEqual(to: CGSize.init(width: 375.0, height: 667.0))
    }
    
    static var isiPhone6Plus : Bool {
        return isMainScreenEqual(to: CGSize.init(width: 414.0, height: 736.0))
    }

    //MARK: iPad
    
    static var isiPad2 : Bool {
        return self.isiPad(scale: 1, size: CGSize.init(width: 1024, height: 768))
    }
    
    static var isiPadMiniOrAir : Bool {
        return self.isiPad(scale: 2, size: CGSize.init(width: 1024, height: 768))
    }
    
    static var isiPadPro : Bool {
        return self.isiPad(scale: 2, size: CGSize.init(width: 1024, height: 1366))

    }
    
    //MARK: Helpers
    
    static func isMainScreenEqual(to size : CGSize) -> Bool {
        let screenFrame = UIScreen.main.bounds
        let equal : Bool = (screenFrame.size.height == size.height && screenFrame.size.width == size.width) || (screenFrame.size.height == size.width && screenFrame.size.width == size.height)
        return equal;
    }
    
    private static func isiPad(scale : Int, size : CGSize) -> Bool {
        let scaleEqual : Bool = Int(UIScreen.main.scale) == scale
        return isMainScreenEqual(to: size) && scaleEqual
    }
}

//MARK: Operators
extension KRDeviceType {
    static func == (lhs: KRDeviceType, rhs: DeviceType) -> Bool {
        switch rhs {
        case .iPhone:
            return KRDeviceType.isiPhone
        case .iPad:
            return KRDeviceType.isiPad
        case .iPhone4s:
            return KRDeviceType.isiPhone4s
        case .iPhone5:
            return KRDeviceType.isiPhone5
        case .iPhone6:
            return KRDeviceType.isiPhone6
        case .iPhone6Plus:
            return KRDeviceType.isiPhone6Plus
        case .iPad2:
            return KRDeviceType.isiPad2
        case .iPadMini, .iPadAir, .iPadPro_9_7:
            return KRDeviceType.isiPadMiniOrAir
        case .iPadPro_12_9:
            return KRDeviceType.isiPadPro
        }
    }
}
