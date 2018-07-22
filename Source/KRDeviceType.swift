//  KRDeviceType.swift
//  KRDeviceType
//
//  Created by Julian Drapaylo.
//  Copyright © 2018 Julian Drapaylo. All rights reserved.
//

import UIKit

public enum DeviceType : String {
    case iPhone
    case iPad
    case iPhone4s
    case iPhone5
    case iPhone6
    case iPhone6Plus
    case iPhoneX
    case iPad2
    case iPadMini
    case iPadAir
    case iPadPro_9_7
    case iPadPro_12_9
    case iPad10
}

open class KRDeviceType {
    fileprivate static let devices : [DeviceType : CGSize] = [
        .iPhone4s : CGSize.init(width: 320.0, height: 480.0),
        .iPhone5 : CGSize.init(width: 320.0, height: 568.0),
        .iPhone6 : CGSize.init(width: 375.0, height: 667.0),
        .iPhone6Plus : CGSize.init(width: 414.0, height: 736.0),
        .iPhoneX : CGSize.init(width: 375.0, height: 812.0),
        .iPad2 : CGSize.init(width: 1024.0, height: 768.0),
        .iPadAir : CGSize.init(width: 1024.0, height: 768.0),
        .iPadMini : CGSize.init(width: 1024.0, height: 768.0),
        .iPadPro_9_7 : CGSize.init(width: 1024.0, height: 768.0),
        .iPadPro_12_9 : CGSize.init(width: 1024.0, height: 1366.0),
        .iPad10 : CGSize.init(width: 1112.0, height: 834.0)
        
    ]
    fileprivate static let scaleValues : [DeviceType : Double] = [
        .iPad2 : 1.0,
        .iPadMini : 2.0,
        .iPadAir : 2.0,
        .iPadPro_9_7 : 2.0,
        .iPadPro_12_9 : 2.0,
        .iPad10 : 2.0
    ]
    
    public enum Equality {
        case equal
        case equalOrLess
        case equalOrGreater
    }
    
    
    open class var deviceType : UIUserInterfaceIdiom {
        return UIDevice.current.userInterfaceIdiom
    }
    
    open class var isiPhone : Bool {
        return deviceType == .phone
    }
    
    open class var isiPad : Bool {
        return deviceType == .pad
    }
    
    //MARK: iPhone
    
    open class var isiPhone4s : Bool {
        return checkDeviceType(deviceType: .iPhone4s)
    }
    
    open class var isiPhone5 : Bool {
        return checkDeviceType(deviceType: .iPhone5)
    }
    
    open class var isiPhone6 : Bool {
        return checkDeviceType(deviceType: .iPhone6)
    }
    
    open class var isiPhone6Plus : Bool {
        return checkDeviceType(deviceType: .iPhone6Plus)
    }
    
    open class var iPhoneX : Bool {
        return checkDeviceType(deviceType: .iPhoneX)
    }
    
    //MARK: iPad
    
    open class var isiPad2 : Bool {
        return checkDeviceType(deviceType: .iPad2)
    }
    
    open class var isiPadMiniOrAir : Bool {
        return checkDeviceType(deviceType: .iPadAir)
    }
    
    open class var isiPadPro : Bool {
        return checkDeviceType(deviceType: .iPadPro_12_9)
    }
    
    open class var isiPad10 : Bool {
        return checkDeviceType(deviceType: .iPad10)

    }
    
    fileprivate class func checkDeviceType(deviceType : DeviceType, equalType : Equality = .equal) -> Bool {
        guard let size = devices[deviceType] else {return false}
        guard let scale = scaleValues[deviceType] else {
            return isMainScreenMatches(to: size, equalType: equalType)
        }
        return isiPad(scale: Int(scale), size: size)
    }
    
    //MARK: Helpers
    
    open class func isMainScreenMatches(to size : CGSize, equalType : Equality = .equal) -> Bool {
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
    final class func == (lhs: KRDeviceType, rhs: DeviceType) -> Bool {
        return checkDeviceType(deviceType: rhs, equalType: .equal);
    }
    
    final class func <= (lhs : KRDeviceType, rhs : DeviceType) -> Bool {
        return checkDeviceType(deviceType: rhs, equalType: .equalOrLess);
    }
    
    final class func >= (lhs : KRDeviceType, rhs : DeviceType) -> Bool {
        return checkDeviceType(deviceType: rhs, equalType: .equalOrGreater);
    }
}
