#
# Be sure to run `pod lib lint raygame.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Raygame'
  s.version          = '0.20.0'
  s.summary          = 'A short description of raygame.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'http://10.60.153.165/caixuemin/raygame_sdk'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'bay2' => 'caixuemin@rayvision.com' }
  s.source           = { :git => 'http://10.60.153.165/caixuemin/raygame_sdk.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  case ENV['OS_TYPE']
  when 'ios'
    s.ios.deployment_target = '11.0'
  when 'osx'
    s.osx.deployment_target = '10.12'
  else
    s.ios.deployment_target = '11.0'
    s.osx.deployment_target = '10.12'
  end

  s.user_target_xcconfig = { 'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES' }


  s.default_subspecs = 'API'
  
  s.pod_target_xcconfig = {
      'ENABLE_BITCODE' => 'No',
      'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) RayGameUseSource'
  }
  
  s.ios.resource_bundles ={
    'RayGame' => ['RayGame/Assets/ios/*.{png,json,xib,storyboard,mp3}']
  }

  s.osx.resource_bundles = { 
    'RayGame' => ['RayGame/Assets/osx/*.{png,json,xib,storyboard}']
  }



  $dir = File.dirname(__FILE__)
  s.xcconfig  = {
    "HEADER_SEARCH_PATHS" => [
    "#$dir/raygame/Lib/include/FFmpeg/include",
    "#$dir/raygame/Lib/include/libyuv",
    ],
  }
  
  s.subspec 'API' do |ss|
    ss.source_files = 'raygame/Classes/api/**/*'
    ss.dependency 'Raygame/Application'
  end
  
  s.subspec 'Application' do |ss|
    ss.ios.source_files = [
      'raygame/Classes/application/*',
      'raygame/Classes/application/ios/**/*',
    ]

    ss.osx.source_files = [
      'raygame/Classes/application/*',
      'raygame/Classes/application/osx/**/*',
    ]

    ss.dependency 'Raygame/Steam'
    ss.dependency 'Raygame/RGModel'
  end
  
  s.subspec 'Video' do |ss|
    
    ss.ios.source_files = 'raygame/Classes/video/**/*'
    ss.ios.exclude_files = [
    'raygame/Classes/video/**/VTDecoder.h',
    'raygame/Classes/video/**/VTDecoder.m',
    ]

    ss.osx.source_files = [
      'raygame/Classes/video/**/RGVideoDecoder.h',
      'raygame/Classes/video/**/RGVideoToolDecoder.h',
      'raygame/Classes/video/**/RGVideoToolDecoder.m',
      'raygame/Classes/video/**/RGVideoRenderer.m',
      'raygame/Classes/video/**/RGVideoRenderer.h',
      'raygame/Classes/video/**/Video.h',
      'raygame/Classes/video/**/VideoDepacketizer.c',
      'raygame/Classes/video/**/FFTDecoder.h',
      'raygame/Classes/video/**/FFTDecoder.m',
      'raygame/Classes/video/**/FFTVideoScale.h',
      'raygame/Classes/video/**/FFTVideoScale.m',
      'raygame/Classes/video/**/FFTConvertUtil.h',
      'raygame/Classes/video/**/FFTConvertUtil.m',
      'raygame/Classes/video/**/VTDecoder.h',
      'raygame/Classes/video/**/VTDecoder.m',
    ]
    
    ss.frameworks = 'VideoToolbox', 'AVFoundation', 'CoreMedia'
    ss.dependency 'Raygame/Utility'
    ss.dependency 'Raygame/Platform'
    ss.dependency 'Raygame/Lib'
    
  end
  
  s.subspec 'Audio' do |ss|

    ss.source_files = 'raygame/Classes/audio/**/*'
    ss.dependency 'Raygame/Utility'
  end
  
  s.subspec 'Clipboard' do |ss|
    ss.source_files = 'raygame/Classes/clipboard/**/*'
  end
  
  
  s.subspec 'Steam' do |ss|
    
    ss.source_files = 'raygame/Classes/steam/**/*'
    ss.frameworks = 'VideoToolbox'
    
    ss.dependency 'Raygame/Lib'
    ss.dependency 'Raygame/Gamepad'
    ss.dependency 'Raygame/Audio'
    ss.dependency 'Raygame/Video'
    ss.dependency 'Raygame/Platform'
    ss.dependency 'Raygame/Clipboard'
    ss.dependency 'Raygame/Analysis'
    
  end
  
  s.subspec 'Analysis' do |ss|
    ss.source_files = 'raygame/Classes/analysis/**/*'
    ss.dependency 'Raygame/Networking'
  end
  
  s.subspec 'Networking' do |ss|
    ss.source_files = 'raygame/Classes/networking/**/*'
  end
  
  s.subspec 'Gamepad' do |ss|
    ss.ios.source_files = 'raygame/Classes/gamepad/*'
    ss.osx.source_files = 'raygame/Classes/gamepad/**/*'
    ss.frameworks = 'GameController'
    
    ss.dependency 'Raygame/Utility'
  end
  
  s.subspec 'Lib' do |ss|
      ss.ios.vendored_libraries = 'RayGame/Lib/ios/**/*.a'
      ss.osx.vendored_libraries = 'RayGame/Lib/osx/**/*.a'
      ss.subspec 'RayStreamNet' do |sss|
          sss.source_files = 'RayGame/Lib/include/RayStreamNet/*.h'
          sss.libraries = 'c++', 'z'
      end
      ss.subspec 'Opus' do |sss|
          sss.source_files = 'RayGame/Lib/include/Opus/*.h'
      end

      ss.subspec 'FFmpeg' do |sss|
        sss.source_files = [
          "raygame/Lib/include/FFmpeg/include/**/*.h",
        ]
        sss.private_header_files = 'raygame/Lib/include/FFmpeg/include/**/*'
        sss.header_mappings_dir = 'raygame/Lib/include/FFmpeg/include/'
      end

      ss.subspec 'libyuv' do |sss|
        sss.source_files = [
          "raygame/Lib/include/libyuv/**/*.h",
        ]
        sss.header_mappings_dir = 'raygame/Lib/include/libyuv/'
        sss.private_header_files = 'raygame/Lib/include/libyuv/**/*'
      end
      
  end
  
  s.subspec 'Utility' do |ss|
    ss.ios.source_files = 'raygame/Classes/utility/*'
    ss.osx.source_files = 'raygame/Classes/utility/**/*'
  end
  
  s.subspec 'Platform' do |ss|
    ss.source_files = 'raygame/Classes/platform/**/*'
  end
  
  s.subspec 'RGModel' do |ss|
    ss.source_files = 'raygame/Classes/RGModel/**/*'
  end
  

end
