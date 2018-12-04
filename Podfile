source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '11.4'

use_frameworks!
inhibit_all_warnings!

target 'Hero Guide' do
  pod 'CCBottomRefreshControl', '~> 0.5'
  pod 'Kingfisher', '~> 4.0'
  pod 'SwiftHash', '~> 2.0'
  pod 'Alamofire', '~> 4.7'
  pod 'ObjectMapper', '~> 3.2'
  pod 'RxSwift', '~> 4.0'
  pod 'RxCocoa', '~> 4.0'

  target 'Hero GuideTests' do
    inherit! :complete
  end
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '4.1'
      config.build_settings['ONLY_ACTIVE_ARCH'] = 'NO'
    end
  end
end
