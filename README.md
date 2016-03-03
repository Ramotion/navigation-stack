![header](./header.png)
# navigation-stack
[![Twitter](https://img.shields.io/badge/Twitter-@Ramotion-blue.svg?style=flat)](http://twitter.com/Ramotion)
[![CocoaPods](https://img.shields.io/cocoapods/p/Navigation-stack.svg)](https://cocoapods.org/pods/Navigation-stack)
[![CocoaPods](https://img.shields.io/cocoapods/v/Navigation-stack.svg)](http://cocoapods.org/pods/Navigation-stack)
[![Travis](https://img.shields.io/travis/Ramotion/navigation-stack.svg)](https://travis-ci.org/Ramotion/navigation-stack)
[![codebeat badge](https://codebeat.co/badges/6f67da5d-c416-4bac-9fb7-c2dc938feedc)](https://codebeat.co/projects/github-com-ramotion-navigation-stack)
## Requirements

- iOS 9.0+
- Xcode 7.2

## Installation

Just add the Source folder to your project.

or use [CocoaPods](https://cocoapods.org) with Podfile:
``` ruby
pod 'Navigation-stack', '~> 0.0.1'
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

## Licence

Navigation-stack is released under the MIT license.
See [LICENSE](./LICENSE) for details.


## About
The project maintained by [app development agency](https://ramotion.com?utm_source=gthb&utm_medium=special&utm_campaign=navigation-stack) [Ramotion Inc.](https://ramotion.com?utm_source=gthb&utm_medium=special&utm_campaign=foolding-cell)
See our other [open-source projects](https://github.com/ramotion) or [hire](https://ramotion.com?utm_source=gthb&utm_medium=special&utm_campaign=navigation-stack) us to design, develop, and grow your product.

[![Twitter URL](https://img.shields.io/twitter/url/http/shields.io.svg?style=social)](https://twitter.com/intent/tweet?text=https://github.com/ramotion/navigation-stack)
[![Twitter Follow](https://img.shields.io/twitter/follow/ramotion.svg?style=social)](https://twitter.com/ramotion)
