#
# Be sure to run `pod lib lint SnowShoe-Swift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "SnowShoeStampSdk"
  s.version          = "3.0.0"
  s.summary          = "Swift SDK Client for the Snowshoe API"
  s.description      = <<-DESC
  SnowShoe is an authentication tool for smartphones. This library provides a simple Swift wrapper.
                       DESC

  s.homepage         = "https://github.com/snowshoestamp/snowshoe-sdk-swift"
  s.license          = 'MIT'
  s.author           = { "SnowShoe" => "engineering@snowshoestamp.com" }
  s.source           = { :git => "https://github.com/snowshoestamp/snowshoe-sdk-swift.git", :tag => s.version.to_s }

  s.platform     = :ios, '9.0'
  s.swift_version = '5'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  #s.resource_bundles = {
  #  'SnowShoe-Swift' => ['Pod/Assets/*.png']
  #}

  s.dependency 'OAuthSwift', '2.0.0'
  s.dependency 'ObjectMapper', '3.5'
end
