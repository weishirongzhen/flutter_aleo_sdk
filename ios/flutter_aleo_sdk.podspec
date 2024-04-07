#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_aleo_sdk.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_aleo_sdk'
  s.version          = '0.0.1'
  s.summary          = 'A sdk for aleo, use flutter_rust_bridge to call rust api'
  s.description      = <<-DESC
A sdk for aleo, use flutter_rust_bridge to call rust api
                       DESC
  s.homepage         = 'https://github.com/weishirongzhen/flutter_aleo_sdk'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'lanniaoershi' => 'lanniaoershi@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '11.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
  s.vendored_frameworks = 'Frameworks/*.xcframework'
end
