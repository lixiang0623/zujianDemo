#
# Be sure to run `pod lib lint qili.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'qili'
  s.version          = '1.1.3'
  s.summary          = '配置渠道崩溃问题'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://git.woa.com/YuewenGroup/Games/Client/iOS/channelSDK/qili'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'p_ilxiangli' => 'p_ilxiangli@tencent.com' }
  s.source           = { :git => 'git@git.woa.com/YuewenGroup/Games/Client/iOS/channelSDK/qili.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.static_framework = true
  
  s.source_files = ['qili/Classes/**/*','qili/Classes/IQKeyboardManager/**/*','qili/Classes/IQKeyboardManager/Categories/**/*','qili/Classes/IQKeyboardManager/Constants/**/*','qili/Classes/IQKeyboardManager/IQTextView/**/*','qili/Classes/IQKeyboardManager/IQToolbar/**/*']
  
    
  s.vendored_frameworks = 'qili/Frameworks/*.framework'
  
  s.user_target_xcconfig = {
      'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64',
    'CHANNEL_NAME' => 'QiliChannelDelegate'
  }
  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  
   s.resource_bundles = {
     'qili' => ['qili/Assets/Resources/QiLiBundle.bundle','qili/Assets/Resources/*.xcassets']
   }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
