//
//  KRDeviceType.swift
//  Connectoo
//
//  Created by ulian_onua on 3/20/17.
//  Copyright © 2017 ulian_onua. All rights reserved.
//

import Foundation
import UIKit


class KRDeviceType {
    static var deviceType : UIUserInterfaceIdiom {
        return UIDevice.current.userInterfaceIdiom
    }
    
    static var iPhone : Bool {
        return deviceType == .phone
    }
    
    static var iPad : Bool {
        return deviceType == .pad
    }
    
    //MARK: iPhone
    
    static var iPhone4s : Bool {
        return isMainScreenEqual(to: CGSize.init(width: 320.0, height: 480.0))
    }
    
    static var iPhone5 : Bool {
        return isMainScreenEqual(to: CGSize.init(width: 320.0, height: 568.0))
    }
    
    static var iPhone6 : Bool {
        return isMainScreenEqual(to: CGSize.init(width: 375.0, height: 667.0))
    }
    
    static var iPhone6Plus : Bool {
        return isMainScreenEqual(to: CGSize.init(width: 414.0, height: 736.0))
    }

    
    //MARK: Helpers
    
    static func isMainScreenEqual(to size : CGSize) -> Bool {
        let screenFrame = UIScreen.main.bounds
        let equal : Bool = (screenFrame.size.height == size.height && screenFrame.size.width == size.width) || (screenFrame.size.height == size.width && screenFrame.size.width == size.height)
        return equal;
    }
    
}
