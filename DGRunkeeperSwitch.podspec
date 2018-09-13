Pod::Spec.new do |s|

  s.name         = "DGRunkeeperSwitch"
  s.version      = "1.1.5"
  s.authors      = { "Danil Gontovnik" => "danil@gontovnik.com" }
  s.homepage     = "https://github.com/gontovnik/DGRunkeeperSwitch"
  s.summary      = "DGRunkeeperSwitch is Runkeeper design switch control"
  s.source       = { :git => "https://github.com/gontovnik/DGRunkeeperSwitch.git",
                     :tag => '1.1.5' }
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.platform     = :ios, '8.0'
  s.source_files = "DGRunkeeperSwitch/**/*.swift"

  s.requires_arc = true

  s.ios.deployment_target = '8.0'
  s.ios.frameworks = ['UIKit', 'Foundation']
  
end
