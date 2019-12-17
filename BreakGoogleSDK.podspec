Pod::Spec.new do |s|
  s.static_framework = true
  s.name = 'ZattooUIKit'
  s.authors = { 'iOS Developers' => 'ios-dev@zattoo.com' }
  s.version = '2.1.0'
  s.license = 'Zattoo'
  s.summary = 'Elegant and delightful SDK for ZattooUI'
  s.homepage = 'https://github.com/zattoo/ZattooUIKit'
  s.source = { git: 'https://github.com/zattoo/ZattooUIKit.git' }
  s.swift_version = '4.2'
  s.ios.deployment_target = '10.3'
  s.tvos.deployment_target = '11.0'

  s.dependency 'ZattooFoundation'
  s.dependency 'AlamofireImage', '~> 3.4.1'
  s.dependency 'Cartography', '~> 3.1.0'
  s.dependency 'MarqueeLabel/Swift', '~> 3.2.0'
  s.dependency 'ZattooGradientView', '~> 1.0.0'
  s.ios.dependency 'GoogleAds-IMA-iOS-SDK', '~> 3.8.0'
  s.tvos.dependency 'FocusTvButton', '~> 2.2.0'
  s.tvos.dependency 'GoogleAds-IMA-tvOS-SDK', '~> 4.2.0'

  s.source_files = 'ZattooUIKit/Source/**/*.swift'
  s.ios.resources = ['ZattooUIKit/Source/**/*~ios.xib', 'ZattooUIKit/Resources/*', 'ZattooUIKit/Source/**/*~ios.storyboard']
  s.tvos.resources = ['ZattooUIKit/Source/**/*~tvos.xib', 'ZattooUIKit/Resources/*']
  s.tvos.exclude_files = [
    'ZattooUIKit/Source/ActionSheet',
    'ZattooUIKit/Source/VideoPlayer/Ads/ZattooVideoPlayer+GoogleIMA.swift',
    'ZattooUIKit/Source/VideoPlayer/ZattooVideoPlayer.swift'
  ]
end