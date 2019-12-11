Pod::Spec.new do |s|

  s.name         = "DGRunkeeperSwitch"
  s.version      = "1.2.1"
  s.authors      = { "Danil Gontovnik" => "danil@gontovnik.com" }
  s.homepage     = "https://github.com/gontovnik/DGRunkeeperSwitch"
  s.summary      = "DGRunkeeperSwitch is Runkeeper design switch control"
  s.source       = { :git => "https://github.com/hathway/DGRunkeeperSwitch.git",
                     :tag => '1.2.0' }
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.platform     = :ios, '10.0'
  s.source_files = "DGRunkeeperSwitch/**/*.swift"

  s.requires_arc = true

  s.ios.deployment_target = '10.0'
  s.ios.frameworks = ['UIKit', 'Foundation']
  
end
