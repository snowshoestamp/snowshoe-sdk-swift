#
# Be sure to run `pod lib lint SnowShoe-Swift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "SnowShoe-Swift"
  s.version          = "2.0.1"
  s.summary          = "iOS wrapper for SnowShoe in Swift"
  s.description      = <<-DESC
  SnowShoe is an authentication tool for smartphones. This library provides a simple Swift wrapper.
                       DESC

  s.homepage         = "https://github.com/snowshoestamp/snowshoe-swift"
  s.license          = 'MIT'
  s.author           = { "SnowShoe" => "support@snowshoestamp.com" }
  s.source           = { :git => "https://github.com/snowshoestamp/snowshoe-swift.git", :tag => s.version.to_s }

  s.platform     = :ios, '9.0'
  s.swift_version = '5'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  #s.resource_bundles = {
  #  'SnowShoe-Swift' => ['Pod/Assets/*.png']
  #}

  s.dependency 'OAuthSwift', '1.3.0'
  s.dependency 'ObjectMapper', '3.4.2'
end
