source 'https://cdn.cocoapods.org/'
use_frameworks!
inhibit_all_warnings!

pod 'ZattooFoundation', git: 'https://github.com/zattoo/ZattooFoundation.git'

# tvOS
target 'BreakGoogleSDK' do
  platform :tvos, '11.0'
  pod 'GoogleAds-IMA-tvOS-SDK', '~> 4.2.0'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    next unless ['iOSSnapshotTestCase-iOS', 'iOSSnapshotTestCase-tvOS'].include? target.name

    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '4.2'
    end
  end
end
