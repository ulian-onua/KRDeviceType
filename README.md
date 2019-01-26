KRDeviceType
===============

KRDeviceType is a simple class written in Swift that helps to get type of iOS device for layout purposes.


## Installation
####CocoaPods

Just add `pod 'KRDeviceType'` to your Podfile and run `pod install` in Terminal from your project folder.

Write `import KRDeviceType` in files where you need to use KRDeviceType. 


## How to use
KRDeviceType should be used only for layout purposes. For example, sometimes you need set different constraints for old devices which screen size doesn't meet requirements of your design project. KRDeviceType class get info about screen size and use this information to check current device type. Don't use this class for accurate detecting of your device type (for example you may wish to check if you device is accurate iPhone 5s);


### Operators ==, <=, >=

To get current device type you can use == operator of KRDevice with DeviceType enumeration.

For example, if you want to check is current device is iPhone you can do it in next way:

```swift
if KRDeviceType() == .iPhone {
    // Perform appropiate operations
}
```

If you wish to check if current device is 4.7 inches iPhone (iPhone 6 or iPhone 6s or iPhone 7 or iPhone 8):
```swift
if KRDeviceType() == .iPhone6 {
    // Perform appropiate operations
}
```

You can also use equalOrLess("<=") or equalOrGreater(">=") equality operators:

```swift
if KRDeviceType() <= .iPhone5 {   //iPhone 5/5s/SE of iPhone 4s
// Perform appropiate operations (for example, set up constraints for those old devices)
}
```

```swift
if KRDeviceType() >= .iPhone6Plus {   //iPhone 6 Plus / 6s Plus / 7 Plus / 8 Plus or greater
// Perform appropiate operations for 3x scale devices (not only iPhone 6 Plus, but possible future devices with higher resolutions screens)
}
```

### Static variables
To get current device type you can use one of next static variables:

```swift
open class var isiPhone: Bool // return true if device is iPhone
open class var isiPad: Bool // return true if device is iPad

// get device type by checking its screen size
open class var isiPhone4s: Bool // iPhone 4s or iPhone 4
open class var isiPhone5: Bool // iPhone 5 or iPhone 5s or iPhone SE
open class var isiPhone6: Bool // iPhone 6 or iPhone 6s or iPhone 7 or iPhone 8
open class var isiPhone6Plus: Bool // iPhone 6 Plus or iPhone 6s Plus or iPhone 7s Plus or iPhone 8 Plus
open class var isiPhoneX: Bool // iPhone X or iPhone XS
open class var isiPhoneXr: Bool // iPhone XR
open class var isiPhoneXsMax: Bool // iPhone XS Max

open class var isiPad2: Bool // iPad 2
open class var isiPadMiniOrAir: Bool  // iPad Mini or iPad Retina or iPad Air or iPad Air 2 
open class var isiPadPro9: Bool // iPad Pro 9.7
open class var isiPadPro12: Bool // iPad Pro 12.9
open class var isiPadPro10: Bool // iPad Pro 10.5 (2017)
open class var isiPadPro10: Bool // iPad Pro 11 (2018)
```
For example:

```swift
if KRDeviceType.isiPad {
    // Perform appropiate operations
} else { // iPhone
    // Perform appropiate operations
}
```

## Requirements

* iOS 8.0 and above
* XCode 7+

## License

KRDeviceType is released under the MIT license. See LICENSE for details.

## Contact

Any suggestion or question? Please create a Github issue or reach me out.

[LinkedIn](https://www.linkedin.com/in/julian-drapaylo)
