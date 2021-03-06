//
//  ViewController.swift
//  KRDeviceTypeExample
//
//  Created by Julian Drapaylo on 4/4/17.
//  Copyright © 2019 Julian Drapaylo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        checkDeviceType()
    }

    func checkDeviceType() {
        if KRDeviceType() == .iPhone {
            print("iPhone")
        }

        if KRDeviceType() == .iPad {
            print("iPad")
        }
        
        if KRDeviceType.isiPhone4s {
            print("iPhone 4s")
        }
        
        if KRDeviceType.isiPhone5 {
            print("iPhone 5 or iPhone 5s or iPhone SE")
        }
        
        if KRDeviceType.isiPhone6 && KRDeviceType() == .iPhone6 {
            print("iPhone 6 or iPhone 6s or iPhone 7")
        }
        
        if KRDeviceType.isiPhone6Plus {
            print("iPhone 6 Plus or iPhone 6s Plus or iPhone 7s Plus")
        }
        
        if KRDeviceType.isiPhoneX {
            print("iPhone X or XS")
        }
        
        if KRDeviceType.isiPhoneXr {
            print("iPhone Xr")
        }
        
        if KRDeviceType.isiPhoneXsMax {
            print("iPhone XS Max")
        }
        
        if KRDeviceType.isiPad2 {
            print("iPad 2")
        }
        
        if KRDeviceType.isiPadMiniOrAir {
            print("iPad Mini or iPad Retina or iPad Air or iPad Air 2 or iPad Pro 9.7")
        }
        
        if KRDeviceType.isiPadPro12 {
            print("iPad Pro 12")
        }
        
        if KRDeviceType.isiPadPro10 {
            print("iPad Pro 10")
        }
        
        if KRDeviceType.isiPadPro11 {
            print("iPad Pro 11")
        }
        
        if KRDeviceType() <= .iPhone5 {
            print("iPhone 5/5s/SE or iPhone 4s")
        }
        
        if KRDeviceType() >= .iPhone5 {
            print("iPhone 5/5s/SE or greater")
        }
    }
}
