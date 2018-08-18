#
# Be sure to run `pod lib lint LeakTest.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LeakTest'
  s.version          = '0.0.1'
  s.summary          = 'A View, ViewController or Object memory leak check tool.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  Check the View, ViewController or Object memory is memory leak or not.
                       DESC

  s.homepage         = 'https://github.com/mykoma/LeakTest'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'mykoma' => '23775517@qq.com' }
  s.source           = { :git => 'https://github.com/mykoma/LeakTest.git', :tag => s.version.to_s }
  s.swift_version = '4.0'
  s.module_name   = 'LeakTest'
  s.ios.deployment_target = '8.0'

  s.source_files = 'LeakTest/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LeakTest' => ['LeakTest/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
   s.dependency 'Quick', '~> 1.2.0'
   s.dependency 'Nimble', '~> 7.0.2'
end
