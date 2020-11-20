#
# Be sure to run `pod lib lint SZTools.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SZTools'
  s.version          = '1.0.21'
  s.summary          = 'Swift 常用方法整理.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
自己项目中 swift 常用的方法整理
                       DESC

  s.homepage         = 'https://github.com/willzh/SZTools'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'willzh' => 'zworrks@163.com' }
  s.source           = { :git => 'https://github.com/willzh/SZTools.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.swift_version = '5.0'
  
  #文件源。所有文件
  s.source_files = 'SZTools/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SZTools' => ['SZTools/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'  #依赖库
  
  
  #子目录 扩展和附加方法
  s.subspec 'Extensions' do |ext|
      ext.source_files = 'SZTools/Classes/Extensions/**/*'
  end
  
  #子目录 常用宏和方法
  s.subspec 'Manager' do |man|
      man.source_files = 'SZTools/Classes/Manager/**/*'
  end
  
  #子目录 文件管理
  s.subspec 'FileManager' do |fm|
      fm.source_files = 'SZTools/Classes/FileManager/**/*'
      fm.dependency 'SZTools/Extensions'
  end
  
  #子目录 自定义UI
  s.subspec 'CustomUI' do |cus|
      cus.source_files = 'SZTools/Classes/CustomUI/**/*'
      cus.dependency 'SZTools/Extensions'
      cus.dependency 'SZTools/Manager'
  end
  
  
  
end
