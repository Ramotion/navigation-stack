[![header](./header.png)](https://ramotion.com?utm_source=gthb&utm_medium=special&utm_campaign=navigation-stack-logo)
<img src="https://github.com/Ramotion/navigation-stack/blob/master/navigation-stack.gif" width="600" height="450" />
<br><br/>
# navigation-stack
[![Twitter](https://img.shields.io/badge/Twitter-@Ramotion-blue.svg?style=flat)](http://twitter.com/Ramotion)
[![CocoaPods](https://img.shields.io/cocoapods/p/Navigation-stack.svg)](https://cocoapods.org/pods/Navigation-stack)
[![CocoaPods](https://img.shields.io/cocoapods/v/Navigation-stack.svg)](http://cocoapods.org/pods/Navigation-stack)
[![CocoaPods](https://img.shields.io/cocoapods/metrics/doc-percent/Navigation-stack.svg)](https://cdn.rawgit.com/Ramotion/navigation-stack/master/docs/index.html)
[![Travis](https://img.shields.io/travis/Ramotion/navigation-stack.svg)](https://travis-ci.org/Ramotion/navigation-stack)
[![codebeat badge](https://codebeat.co/badges/c322a039-b06b-46d9-bf40-e48cf0365b97)](https://codebeat.co/projects/github-com-ramotion-navigation-stack)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Ramotion/navigation-stack)
[![Donate](https://img.shields.io/badge/Donate-PayPal-blue.svg)](https://paypal.me/Ramotion)

## About
This project is maintained by Ramotion, Inc.<br>
We specialize in the designing and coding of custom UI for Mobile Apps and Websites.<br>

**Looking for developers for your project?**<br>
This project is maintained by Ramotion, Inc. We specialize in the designing and coding of custom UI for Mobile Apps and Websites.

<a href="mailto:alex.a@ramotion.com?subject=Project%20inquiry%20from%20Github">
<img src="https://github.com/ramotion/gliding-collection/raw/master/contact_our_team@2x.png" width="187" height="34"></a>

The [iPhone mockup](https://store.ramotion.com/product/iphone-x-clay-mockups?utm_source=gthb&utm_medium=special&utm_campaign=navigation-stack) available [here](https://store.ramotion.com?utm_source=gthb&utm_medium=special&utm_campaign=navigation-stack).

## Try this UI control in action


<a href="https://itunes.apple.com/app/apple-store/id1182360240?pt=550053&ct=gthb-navigation-stack&mt=8" > <img src="https://github.com/Ramotion/navigation-stack/raw/master/Download_on_the_App_Store_Badge_US-UK_135x40.png" width="170" height="58"></a>

## Requirements

- iOS 9.0+
- Xcode 9

## Installation

Just add the Source folder to your project.

or use [CocoaPods](https://cocoapods.org) with Podfile:
``` ruby
pod 'Navigation-stack'
```

or [Carthage](https://github.com/Carthage/Carthage) users can simply add to their `Cartfile`:
```
github "Ramotion/navigation-stack"
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


This library is a part of a <a href="https://github.com/Ramotion/swift-ui-animation-components-and-libraries"><b>selection of our best UI open-source projects.</b></a>

## License

Navigation-stack is released under the MIT license.
See [LICENSE](./LICENSE) for details.

# Get the Showroom App for iOS to give it a try
Try this UI component and more like this in our iOS app. Contact us if interested.

<a href="https://itunes.apple.com/app/apple-store/id1182360240?pt=550053&ct=navigation-stack&mt=8" >
<img src="https://github.com/ramotion/gliding-collection/raw/master/app_store@2x.png" width="117" height="34"></a>
<a href="mailto:alex.a@ramotion.com?subject=Project%20inquiry%20from%20Github">
<img src="https://github.com/ramotion/gliding-collection/raw/master/contact_our_team@2x.png" width="187" height="34"></a>
<br>
<br>

Follow us for the latest updates<br>
<a href="https://goo.gl/rPFpid" >
<img src="https://i.imgur.com/ziSqeSo.png/" width="156" height="28"></a>
