//
//  NavigationStack.swift
//  NavigationStackDemo
//
// Copyright (c) 26/02/16 Ramotion Inc. (http://ramotion.com)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.


import UIKit

/// UINavigationcontroller with animation show lists of UIViewControllers
open class NavigationStack: UINavigationController {
  
  var overlay: Float = 0.8
  var scaleRatio: Float = 14.0
  var scaleValue: Float = 0.99
  
  /// A floating-point value that determines the rate of deceleration after the user lifts their finger.
  @IBInspectable open var decelerationRate: CGFloat = UIScrollViewDecelerationRateNormal
  
  /// The color to use for the background of the lists of UIViewcontrollers.
  @IBInspectable open var bgColor: UIColor = .black
  
  /// The background UIView of the lists of UIViewcontrollers.
  open var bgView: UIView? = nil
  fileprivate var screens = [UIImage]()
  
  /// The delegate of the navigation controller object. Use this instead delegate.
  weak open var stackDelegate: UINavigationControllerDelegate?
  
  /**
   The initialized navigation controller object or nil if there was a problem initializing the object.
   
   - parameter aDecoder: aDecoder
   
   - returns: The initialized navigation controller object or nil if there was a problem initializing the object.
   */
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    delegate = self
  }
  
  /**
   Initializes and returns a newly created navigation controller.
   
   - parameter rootViewController: The view controller that resides at the bottom of the navigation stack.
   
   - returns: The initialized navigation controller object or nil if there was a problem initializing the object.
   */
  override init(rootViewController: UIViewController) {
    super.init(rootViewController: rootViewController)
    
    delegate = self
  }
}

// MARK: pulbic methods

extension NavigationStack {
  
  /**
   Show list of ViewControllers.
   */
  public func showControllers() {
    if screens.count == 0 {
      return
    }
    
    var allScreens = screens
    allScreens.append(view.takeScreenshot())
    let collectioView = CollectionStackViewController(images: allScreens,
      delegate: self,
      overlay: overlay,
      scaleRatio: scaleRatio,
      scaleValue: scaleValue,
      bgColor: bgColor,
      bgView: bgView,
      decelerationRate: decelerationRate)
        
    present(collectioView, animated: false, completion: nil)
  }
}


// MARK: UINavigationControllerDelegate

extension NavigationStack: UINavigationControllerDelegate {
  
  public func navigationController(_ navigationController: UINavigationController,
    willShow viewController: UIViewController,
    animated: Bool) {
      
      stackDelegate?.navigationController?(navigationController, willShow: viewController, animated: animated)
  
      if navigationController.viewControllers.count > screens.count + 1 {
        screens.append(view.takeScreenshot())
      } else
      if navigationController.viewControllers.count == screens.count && screens.count > 0 {
        screens.removeLast()
      }
  }
  
  public func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
    stackDelegate?.navigationController?(navigationController, didShow: viewController, animated: animated)
  }

//  ???
//  public func navigationControllerSupportedInterfaceOrientations(navigationController: UINavigationController) -> UIInterfaceOrientationMask {
//    return stackDelegate?.navigationControllerSupportedInterfaceOrientations?(navigationController)
//  }
  
//  ???
//  optional public func navigationControllerPreferredInterfaceOrientationForPresentation(navigationController: UINavigationController) -> UIInterfaceOrientation
//  

  public func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
    return stackDelegate?.navigationController?(navigationController, interactionControllerFor: animationController)
  }

  public func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return stackDelegate?.navigationController?(navigationController, animationControllerFor: operation, from: fromVC, to: toVC)
  }
  
}

extension NavigationStack: CollectionStackViewControllerDelegate {
  func controllerDidSelected(index: Int) {
    
    let newViewControllers = Array(viewControllers[0...index])
    setViewControllers(newViewControllers, animated: false)
    screens.removeSubrange(index..<screens.count)
  }
}

// MARK: UIView

extension UIView {
  
  func takeScreenshot() -> UIImage {
    
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
    drawHierarchy(in: self.bounds, afterScreenUpdates: true)
    
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return image!
  }
}
