//  KRDeviceType.swift
//  KRDeviceType
//
//  Created by Julian Drapaylo.
//  Copyright © 2019 Julian Drapaylo. All rights reserved.
//

import UIKit

public enum DeviceType: String {
    case iPhone
    case iPad
    case iPhone4s
    case iPhone5
    case iPhone6
    case iPhone6Plus
    case iPhoneX
    case iPhoneXr
    case iPhoneXsMax
    case iPad2
    case iPadMini
    case iPadAir
    case iPadPro_9_7
    case iPadPro_12_9
    case iPadPro_10
    case iPadPro_11
}

open class KRDeviceType {
    private static let devices: [DeviceType: CGSize] = [
        .iPhone4s: CGSize(width: 320.0, height: 480.0),
        .iPhone5: CGSize(width: 320.0, height: 568.0),
        .iPhone6: CGSize(width: 375.0, height: 667.0),
        .iPhone6Plus: CGSize(width: 414.0, height: 736.0),
        .iPhoneX: CGSize(width: 375.0, height: 812.0),
        .iPhoneXr: CGSize(width: 414.0, height: 896.0),
        .iPhoneXsMax: CGSize(width: 414.0, height: 896.0),
        .iPad2: CGSize(width: 1024.0, height: 768.0),
        .iPadAir: CGSize(width: 1024.0, height: 768.0),
        .iPadMini: CGSize(width: 1024.0, height: 768.0),
        .iPadPro_9_7: CGSize(width: 1024.0, height: 768.0),
        .iPadPro_12_9: CGSize(width: 1024.0, height: 1366.0),
        .iPadPro_10: CGSize(width: 1112.0, height: 834.0),
        .iPadPro_11: CGSize(width: 834.0, height: 1194.0)
    ]
    
    private static let scaleValues: [DeviceType: Double] = [
        .iPad2: 1.0,
        .iPadMini: 2.0,
        .iPadAir: 2.0,
        .iPadPro_9_7: 2.0,
        .iPadPro_12_9: 2.0,
        .iPadPro_10: 2.0,
        .iPadPro_11: 2.0,
        .iPhoneXr: 2.0,
        .iPhoneXsMax: 3.0
    ]
    
    public enum Equality {
        case equal
        case equalOrLess
        case equalOrGreater
    }
    
    open class var deviceType: UIUserInterfaceIdiom {
        return UIDevice.current.userInterfaceIdiom
    }
    
    open class var isiPhone: Bool {
        return deviceType == .phone
    }
    
    open class var isiPad: Bool {
        return deviceType == .pad
    }
    
// MARK: - iPhone
    
    open class var isiPhone4s: Bool {
        return checkDeviceType(deviceType: .iPhone4s)
    }
    
    open class var isiPhone5: Bool {
        return checkDeviceType(deviceType: .iPhone5)
    }
    
    open class var isiPhone6: Bool {
        return checkDeviceType(deviceType: .iPhone6)
    }
    
    open class var isiPhone6Plus: Bool {
        return checkDeviceType(deviceType: .iPhone6Plus)
    }
    
    open class var isiPhoneX: Bool {
        return checkDeviceType(deviceType: .iPhoneX)
    }
    
    open class var isiPhoneXr: Bool {
        return checkDeviceType(deviceType: .iPhoneXr)
    }
    
    open class var isiPhoneXsMax: Bool {
        return checkDeviceType(deviceType: .iPhoneXsMax)
    }
    
// MARK: - iPad
    
    open class var isiPad2: Bool {
        return checkDeviceType(deviceType: .iPad2)
    }
    
    open class var isiPadMiniOrAir: Bool {
        return checkDeviceType(deviceType: .iPadAir)
    }
    
    open class var isiPadPro9: Bool {
        return checkDeviceType(deviceType: .iPadPro_9_7)
    }
    
    open class var isiPadPro12: Bool {
        return checkDeviceType(deviceType: .iPadPro_12_9)
    }
    
    open class var isiPadPro10: Bool {
        return checkDeviceType(deviceType: .iPadPro_10)
    }
    
    open class var isiPadPro11: Bool {
        return checkDeviceType(deviceType: .iPadPro_11)
    }
    
    private class func checkDeviceType(deviceType: DeviceType,
                                       equalType: Equality = .equal) -> Bool {
        guard let size = devices[deviceType] else { return false }
        guard let scale = scaleValues[deviceType] else {
            return isMainScreenMatches(to: size, equalType: equalType)
        }
        return isiPad(scale: Int(scale), size: size)
    }
    
// MARK: - Helpers
    
    open class func isMainScreenMatches(to size: CGSize,
                                        equalType: Equality = .equal) -> Bool {
        let screenFrame = UIScreen.main.bounds
        var equal: Bool = false
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
    
    private static func isiPad(scale: Int,
                               size: CGSize,
                               equalType: Equality = .equal) -> Bool {
        let scaleEqual: Bool = Int(UIScreen.main.scale) == scale
        return isMainScreenMatches(to: size, equalType: equalType) && scaleEqual
    }
    
}

// MARK: - Operators

extension KRDeviceType {
    final class func == (lhs: KRDeviceType, rhs: DeviceType) -> Bool {
        return checkDeviceType(deviceType: rhs, equalType: .equal);
    }
    
    final class func <= (lhs: KRDeviceType, rhs: DeviceType) -> Bool {
        return checkDeviceType(deviceType: rhs, equalType: .equalOrLess);
    }
    
    final class func >= (lhs: KRDeviceType, rhs: DeviceType) -> Bool {
        return checkDeviceType(deviceType: rhs, equalType: .equalOrGreater);
    }
}
