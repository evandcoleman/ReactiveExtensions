Pod::Spec.new do |s|
  s.name             = 'ReactiveExtensions'
  s.version          = '0.1.0'
  s.summary          = 'ReactiveSwift extensions for a variety of third-party frameworks.'
  s.homepage         = 'https://github.com/edc1591/ReactiveExtensions'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Evan Coleman' => 'e@edc.me' }
  s.source           = { :git => 'https://github.com/edc1591/ReactiveExtensions.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/edc1591'

  s.ios.deployment_target = '8.0'  
  s.dependency 'ReactiveSwift', '~> 1.0'
  s.default_subspec = 'All'

  s.subspec 'All' do |sp|
    sp.dependency 'ReactiveExtensions/Alamofire'
    sp.dependency 'ReactiveExtensions/Eureka'
    sp.dependency 'ReactiveExtensions/FBSDKCoreKit'
    sp.dependency 'ReactiveExtensions/FBSDKLoginKit'
    sp.dependency 'ReactiveExtensions/Kingfisher'
  end

  s.subspec 'Alamofire' do |sp|
    sp.source_files = 'Sources/Alamofire/*'
    sp.dependency 'Alamofire', '~> 4.3'
  end

  s.subspec 'Eureka' do |sp|
    sp.source_files = 'Sources/Eureka/*'
    sp.dependency 'Eureka', '~> 2.0.0-beta.1'
  end

  s.subspec 'FBSDKCoreKit' do |sp|
    sp.source_files = 'Sources/FBSDKCoreKit/*'
    sp.dependency 'FBSDKCoreKit', '~> 4.19'
  end

  s.subspec 'FBSDKLoginKit' do |sp|
    sp.source_files = 'Sources/FBSDKLoginKit/*'
    sp.dependency 'FBSDKLoginKit', '~> 4.19'
  end

  s.subspec 'Kingfisher' do |sp|
    sp.source_files = 'Sources/Kingfisher/*'
    sp.dependency 'Kingfisher', '~> 3.3'
  end
end
