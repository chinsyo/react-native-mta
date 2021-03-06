require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "RCTMta"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.homepage     = package["homepage"]
  s.license      = package["license"]
  s.author       = package["author"]
  s.platform     = :ios, "10.0"
  s.source       = { :git => "https://github.com/chinsyo/react-native-mta.git", :tag => "v#{s.version}" }
  s.source_files = "ios/**/*.{h,m}"
  s.requires_arc = true
  s.vendored_libraries = "ios/**/*.a"
  s.libraries = "z", "sqlite3"
  s.frameworks = "CFNetwork", "SystemConfiguration", "CoreTelephony"
  s.dependency "React"
end

