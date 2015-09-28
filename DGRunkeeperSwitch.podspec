#
#  Be sure to run `pod spec lint DGActivityIndicatorView.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "DGRunkeeperSwitch"
  s.version      = "1.1"
  s.authors      = { "Danil Gontovnik" => "gontovnik.danil@gmail.com" }
  s.homepage     = "https://github.com/gontovnik/DGRunkeeperSwitch"
  s.summary      = "DGRunkeeperSwitch is Runkeeper design switch control (two part segment control)."
  s.source       = { :git => "https://github.com/gontovnik/DGRunkeeperSwitch.git",
                     :tag => '1.1' }
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.platform = :ios, '8.0'
  s.source_files = "DGRunkeeperSwitch/**/*.swift"

  s.requires_arc = true
  
  s.ios.deployment_target = '8.0'
  s.ios.frameworks = ['UIKit', 'Foundation']
end
