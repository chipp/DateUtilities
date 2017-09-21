source 'https://github.com/CocoaPods/Specs.git'

use_frameworks!

abstract_target 'Common' do
  pod 'DateUtilities', :path => '.'
  pod 'Nimble', :git => 'git@github.com:Quick/Nimble', :commit => 'a63252b16eba6cdebec4e4936388c90552165a68'

  target 'iOSTests' do
    platform :ios, '8.0'
  end

  target 'tvOSTests' do
    platform :tvos, '9.0'
  end

  target 'macOSTests' do
    platform :osx, '10.10'
  end
end
