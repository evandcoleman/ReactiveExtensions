# ReactiveExtensions
> ReactiveSwift extensions for various third-party frameworks.

[![Swift Version][swift-image]][swift-url]
[![License][license-image]][license-url]
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/ReactiveExtensions.svg)](https://img.shields.io/cocoapods/v/ReactiveExtensions.svg)  
[![Platform](https://img.shields.io/cocoapods/p/ReactiveExtensions.svg?style=flat)](http://cocoapods.org/pods/ReactiveExtensions)

`ReactiveExtensions` provides `ReactiveSwift` extensions for several third-party Frameworks. Frameworks that are currently supported are:

* [Alamofire](https://github.com/Alamofire/Alamofire)
* [Eureka](https://github.com/xmartlabs/Eureka)
* [FBSDKCoreKit](https://github.com/facebook/facebook-ios-sdk)
* [FBSDKLoginKit](https://github.com/facebook/facebook-ios-sdk)
* [Kingfisher](https://github.com/onevcat/Kingfisher)

If your favorite framework isn't supported, I'll happily review PRs.

## Installation

#### CocoaPods
You can use [CocoaPods](http://cocoapods.org/) to install `ReactiveExtensions` by adding it to your `Podfile`:

```ruby
use_frameworks!

pod 'ReactiveExtensions'
```

This will add all supported extensions to your project. You can install extensions for individual frameworks using subspecs. For example, to only install Alamofire extensions, add `pod 'ReactiveExtensions/Alamofire'` to your `Podfile`.

#### Manually
1. Download and drop the `Sources` directory into your project.  
2. There is no step two.  

## Documentation

See source code comments or view on [CocoaDocs](http://cocoadocs.org/docsets/ReactiveExtensions).

## Contribute

I would love for you to contribute to **ReactiveExtensions**, check the ``LICENSE`` file for more info. I'd be happy to review any pull requests.

## Meta

You can find me on Twitter [@edc1591](https://twitter.com/edc1591)

[Hire me!](http://edc.me)

Distributed under the MIT license. See ``LICENSE`` for more information.

[swift-image]:https://img.shields.io/badge/swift-3.0-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE
[codebeat-image]: https://codebeat.co/badges/c19b47ea-2f9d-45df-8458-b2d952fe9dad
[codebeat-url]: https://codebeat.co/projects/github-com-vsouza-awesomeios-com