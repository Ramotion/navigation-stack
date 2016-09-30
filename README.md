[![header](https://raw.githubusercontent.com/Ramotion/navigation-stack/master/header.png)](https://ramotion.com?utm_source=gthb&utm_medium=special&utm_campaign=navigation-stack-logo)

# navigation-stack
[![Twitter](https://img.shields.io/badge/Twitter-@Ramotion-blue.svg?style=flat)](http://twitter.com/Ramotion)
[![CocoaPods](https://img.shields.io/cocoapods/p/Navigation-stack.svg)](https://cocoapods.org/pods/Navigation-stack)
[![CocoaPods](https://img.shields.io/cocoapods/v/Navigation-stack.svg)](http://cocoapods.org/pods/Navigation-stack)
[![CocoaPods](https://img.shields.io/cocoapods/metrics/doc-percent/Navigation-stack.svg)](https://cdn.rawgit.com/Ramotion/navigation-stack/master/docs/index.html)
[![Travis](https://img.shields.io/travis/Ramotion/navigation-stack.svg)](https://travis-ci.org/Ramotion/navigation-stack)
[![codebeat badge](https://codebeat.co/badges/c322a039-b06b-46d9-bf40-e48cf0365b97)](https://codebeat.co/projects/github-com-ramotion-navigation-stack)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Ramotion/navigation-stack)

## About
This project is maintained by Ramotion, an agency specialized in building dedicated engineering teams and developing custom software.<br><br> [Contact our team](https://ramotion.com?utm_source=gthb&utm_medium=special&utm_campaign=navigation-stack-contact-us) and we’ll help you work with the best engineers from Eastern Europe.

![Animation](https://raw.githubusercontent.com/Ramotion/navigation-stack/master/Navigation-Stack.gif)

The [iPhone mockup](https://store.ramotion.com/product/iphone-6-mockups?utm_source=gthb&utm_medium=special&utm_campaign=navigation-stack) available [here](https://store.ramotion.com/product/iphone-6-mockups?utm_source=gthb&utm_medium=special&utm_campaign=navigation-stack).

## Requirements

- iOS 9.0+
- Xcode 7.3

## Installation

Just add the Source folder to your project.

or use [CocoaPods](https://cocoapods.org) with Podfile:
``` ruby
pod 'Navigation-stack'
```

or [Carthage](https://github.com/Carthage/Carthage) users can simply add to their `Cartfile`:
```
github "Ramotion/navigation-stack", "~> 0.0.8" swift 2

github "Ramotion/navigation-stack", "~> 1.0.0" swift 3
```

## Usage

1) YourNavigationController inherit from `NavigationStack`

2) add code to root viewViewController

``` swift
override func viewDidLoad() {
    super.viewDidLoad()
    navigationController!.interactivePopGestureRecognizer?.delegate = self
  }
```

``` swift
extension YourViewController: UIGestureRecognizerDelegate {
  func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {

    if navigationController?.viewControllers.count == 2 {
      return true
    }

    if let navigationController = self.navigationController as? NavigationStack {
      navigationController.showControllers()
    }

    return false
  }
}
```

## License

Navigation-stack is released under the MIT license.
See [LICENSE](./LICENSE) for details.


## Follow Us

[![Twitter URL](https://img.shields.io/twitter/url/http/shields.io.svg?style=social)](https://twitter.com/intent/tweet?text=https://github.com/ramotion/navigation-stack)
[![Twitter Follow](https://img.shields.io/twitter/follow/ramotion.svg?style=social)](https://twitter.com/ramotion)
