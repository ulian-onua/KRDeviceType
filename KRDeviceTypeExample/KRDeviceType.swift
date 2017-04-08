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
    
    fileprivate static let devices : [DeviceType : CGSize] = [
        .iPhone4s : CGSize.init(width: 320.0, height: 480.0),
        .iPhone5 : CGSize.init(width: 320.0, height: 568.0),
        .iPhone6 : CGSize.init(width: 375.0, height: 667.0),
        .iPhone6Plus : CGSize.init(width: 414.0, height: 736.0),
        .iPad2 : CGSize.init(width: 1024.0, height: 768.0),
        .iPadAir : CGSize.init(width: 1024.0, height: 768.0),
        .iPadMini : CGSize.init(width: 1024.0, height: 768.0),
        .iPadPro_9_7 : CGSize.init(width: 1024.0, height: 768.0),
        .iPadPro_12_9 : CGSize.init(width: 1024.0, height: 1366.0)
    ]
    fileprivate static let scaleValues : [DeviceType : Double] = [
        .iPad2 : 1.0,
        .iPadMini : 2.0,
        .iPadAir : 2.0,
        .iPadPro_9_7 : 2.0,
        .iPadPro_12_9 : 2.0
    ]
    
    enum Equality {
        case equal
        case equalOrLess
        case equalOrGreater
    }


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
        return checkDeviceType(deviceType: .iPhone4s)
    }
    
    static var isiPhone5 : Bool {
        return checkDeviceType(deviceType: .iPhone5)
    }
    
    static var isiPhone6 : Bool {
        return checkDeviceType(deviceType: .iPhone6)
    }
    
    static var isiPhone6Plus : Bool {
        return checkDeviceType(deviceType: .iPhone6Plus)
    }

    //MARK: iPad
    
    static var isiPad2 : Bool {
        return checkDeviceType(deviceType: .iPad2)
    }
    
    static var isiPadMiniOrAir : Bool {
        return checkDeviceType(deviceType: .iPadAir)
    }
    
    static var isiPadPro : Bool {
        return checkDeviceType(deviceType: .iPadPro_12_9)
    }
    
    fileprivate static func checkDeviceType(deviceType : DeviceType, equalType : Equality = .equal) -> Bool {
        guard let size = devices[deviceType] else {return false}
        guard let scale = scaleValues[deviceType] else {
            return isMainScreenMatches(to: size, equalType: equalType)
        }
        return isiPad(scale: Int(scale), size: size)
    }
    
    //MARK: Helpers
    
    static func isMainScreenMatches(to size : CGSize, equalType : Equality = .equal) -> Bool {
        let screenFrame = UIScreen.main.bounds
        var equal : Bool = false
        switch equalType {
        case .equal:
            equal = (screenFrame.size.height == size.height && screenFrame.size.width == size.width) || (screenFrame.size.height == size.width && screenFrame.size.width == size.height)
        case .equalOrLess:
            equal = (screenFrame.size.height <= size.height && screenFrame.size.width <= size.width) || (screenFrame.size.height <= size.width && screenFrame.size.width <= size.height)
        case .equalOrGreater:
            equal = (screenFrame.size.height >= size.height && screenFrame.size.width >= size.width) || (screenFrame.size.height >= size.width && screenFrame.size.width >= size.height)
        }
        return equal
    }
    
    
    fileprivate static func isiPad(scale : Int, size : CGSize, equalType : Equality = .equal) -> Bool {
        let scaleEqual : Bool = Int(UIScreen.main.scale) == scale
        return isMainScreenMatches(to: size, equalType: equalType) && scaleEqual
    }
    
}

//MARK: Operators
extension KRDeviceType {
    static func == (lhs: KRDeviceType, rhs: DeviceType) -> Bool {
        return checkDeviceType(deviceType: rhs, equalType: .equal);
    }
    
    static func <= (lhs : KRDeviceType, rhs : DeviceType) -> Bool {
        return checkDeviceType(deviceType: rhs, equalType: .equalOrLess);
    }
    
    static func >= (lhs : KRDeviceType, rhs : DeviceType) -> Bool {
        return checkDeviceType(deviceType: rhs, equalType: .equalOrGreater);
    }
}
