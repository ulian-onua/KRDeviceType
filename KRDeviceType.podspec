Pod::Spec.new do |s|

  s.name         = "KRDeviceType"
  s.version      = "0.0.1"
  s.summary      = "KRDeviceType is a simple class written in Swift that helps to get type of iOS device for layout purposes"

  s.homepage     = "https://github.com/ulian-onua/KRDeviceType"

  s.license      = { :type => "MIT", :file => "LICENSE" }



  s.author             = { "Julian Drapaylo" => "ulian.onua@gmail.com" }
#s.social_media_url   = "http://www.linkedin.com/in/julian-drapaylo"



  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/ulian-onua/KRDeviceType.git", :tag => "0.0.4" }


  s.source_files  = "Source/*.{swift}"
#s.public_header_files = "Source/*.{swift}"

  s.frameworks = "Foundation", "UIKit"
  s.requires_arc = true

end