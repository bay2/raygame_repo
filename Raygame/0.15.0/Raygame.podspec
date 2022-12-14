Pod::Spec.new do |s|
  s.name = "Raygame"
  s.version = "0.15.0"
  s.summary = "A short description of raygame."
  s.license = {"type"=>"MIT", "file"=>"LICENSE"}
  s.authors = {"bay2"=>"caixuemin@rayvision.com"}
  s.homepage = "http://10.60.153.165/caixuemin/raygameframework"
  s.description = "TODO: Add long description of the pod here."
  s.source = { :git => 'git@10.60.153.165:caixuemin/raygameframework.git', :tag => s.version.to_s }

  s.osx.deployment_target    = '10.12'
  s.osx.vendored_framework   = 'osx/Raygame.framework'
  s.osx.resources = "osx/RayGame.bundle"
  s.osx.frameworks = 'VideoToolbox', 'AVFoundation', 'CoreMedia', 'VideoToolbox', 'GameController', 'AudioToolbox', 'SystemConfiguration'
  s.osx.libraries = 'c++', 'z'
end
