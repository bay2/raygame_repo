Pod::Spec.new do |s|
  s.name = "RaygameiOS"
  s.version = "0.2.4"
  s.summary = "A short description of raygame."
  s.license = {"type"=>"MIT", "file"=>"LICENSE"}
  s.authors = {"bay2"=>"caixuemin@rayvision.com"}
  s.homepage = "http://10.60.153.165/caixuemin/raygameframework_ios"
  s.description = "TODO: Add long description of the pod here."
  s.source = { :git => 'git@10.60.153.165:caixuemin/raygameframework_ios.git', :tag => s.version.to_s }

  s.pod_target_xcconfig = {
    'ENABLE_BITCODE' => 'No',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }


  s.ios.deployment_target    = '11.0'
  s.ios.vendored_framework   = 'ios/Raygame.framework'
  s.ios.resources = "ios/RayGame.bundle"
  s.ios.frameworks = 'VideoToolbox', 'AVFoundation', 'CoreMedia', 'VideoToolbox', 'GameController', 'AudioToolbox', 'SystemConfiguration', 'CoreServices'
  s.ios.libraries = 'c++', 'z'
end
