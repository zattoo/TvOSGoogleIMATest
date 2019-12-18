# frozen_string_literal: true

Pod::Spec.new do |s|
  s.static_framework = true
  s.name = 'TvOSGoogleIMATest'
  s.authors = { 'iOS Developers' => 'ios-dev@zattoo.com' }
  s.version = '1.0.0'
  s.license = 'Zattoo'
  s.summary = 'A test pod to show the error problems for Zattoo'
  s.homepage = 'https://github.com/zattoo/TvOSGoogleIMATest'
  s.source = { git: 'https://github.com/zattoo/TvOSGoogleIMATest.git' }
  s.swift_version = '4.2'
  s.ios.deployment_target = '10.3'
  s.tvos.deployment_target = '11.0'

  s.tvos.dependency 'GoogleAds-IMA-tvOS-SDK', '~> 4.2.0'
end
