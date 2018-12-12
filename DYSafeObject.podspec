#
# Be sure to run `pod lib lint DYSafeObject.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DYSafeObject'
  s.version          = '0.1.1'
  s.summary          = '防止 字典value为nil、数组越界、<null>、NSNull对象导致的Crash.'
  s.homepage         = 'https://github.com/DefaultYuan/DYSafeObject'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'defaultyuan' => '15921462994@163.com' }
  s.source           = { :git => 'https://github.com/DefaultYuan/DYSafeObject.git', :tag => s.version.to_s }
  s.social_media_url = 'https://weibo.com/u/2792951481'

  s.ios.deployment_target = '7.0'
  s.source_files = 'DYSafeObject/DYSafeObject/Classes/**/*.{h,m}'

  no_arc_files = ['DYSafeObject/DYSafeObject/Classes/NSMutableArray+DYSafe.h',
                  'DYSafeObject/DYSafeObject/Classes/NSMutableArray+DYSafe.m'
                ]
  files = Pathname.glob("DYSafeObject/DYSafeObject/Classes/**/*.{h,m}")
  files = files.map {|file| file.to_path}
  files = files.reject {|file| no_arc_files.include?(file) }
  s.requires_arc = files.sort

  s.frameworks = 'UIKit'

  # s.resource_bundles = {
  #   'DYSafeObject' => ['DYSafeObject/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.dependency 'AFNetworking', '~> 2.3'
end
