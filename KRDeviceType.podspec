Pod::Spec.new do |s|

  s.name         = "KRDeviceType"

  s.version      = "0.0.6"

  s.summary      = "KRDeviceType is a simple class written in Swift that helps to get type of iOS device for layout purposes"

  s.homepage     = "https://github.com/ulian-onua/KRDeviceType"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = { "Julian Drapaylo" => "ulian.onua@gmail.com" }

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/ulian-onua/KRDeviceType.git", :tag => "0.0.6" }

  s.source_files  = "Source/*.{swift}"

  s.pod_target_xcconfig = {
    'SWIFT_VERSION' => '4.2',
  }

  s.frameworks = "Foundation", "UIKit"

  s.requires_arc = true

end
