#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_carplay_plus.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_carplay_plus'
  s.version          = '0.0.1'
  s.summary          = 'Flutter plugin to allow integration with Apple Carplay devices.'
  # s.description      = <<-DESC
  #   A new Flutter plugin project.
  #                      DESC
  s.homepage         = 'https://github.com/RedC4ke/flutter_carplay_plus'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Michał Wyczarski (Redc4ke)' => 'mwyczarski@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '14.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
