//
//  NavigationStack.swift
//  NavigationStackDemo
//
//  Created by Alex K. on 24/02/16.
//  Copyright © 2016 Alex K. All rights reserved.
//

import UIKit

// MARK: NavigationStack

public class NavigationStack: UINavigationController {
  
  @IBInspectable var overlay: Float = 0.8
  @IBInspectable var scaleRatio: Float = 14.0
  @IBInspectable var scaleValue: Float = 0.99
  
  @IBInspectable var bgColor: UIColor = .blackColor()
  
  private var screens = [UIImage]()
  
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    delegate = self
  }
}

// MARK: pulbic methods

extension NavigationStack {
  public func showControllers() {
    var allScreens = screens
    allScreens.append(view.takeScreenshot())
    let collectioView = CollectionStackViewController(images: allScreens,
      delegate: self,
      overlay: overlay,
      scaleRatio: scaleRatio,
      scaleValue: scaleValue,
      bgColor: bgColor)
    
    presentViewController(collectioView, animated: false, completion: nil)
  }
}

// MARK: Additional helpers

extension NavigationStack {
  
  private func popToIndex(index: Int, animated: Bool) {
    let viewController = viewControllers[index]
    popToViewController(viewController, animated: animated)
  }
}


// MARK: UINavigationControllerDelegate

extension NavigationStack: UINavigationControllerDelegate {
  
  public func navigationController(navigationController: UINavigationController,
    willShowViewController viewController: UIViewController,
    animated: Bool) {
  
      if navigationController.viewControllers.count > screens.count + 1 {
        screens.append(view.takeScreenshot())
      } else
      if navigationController.viewControllers.count == screens.count && screens.count > 0 {
        screens.removeLast()
      }
  }
}

extension NavigationStack: CollectionStackViewControllerDelegate {
  func controllerDidSelected(index index: Int) {
    popToIndex(index, animated: false)
    screens.removeRange(index..<screens.count)
  }
}

// MARK: UIView

extension UIView {
  
  func takeScreenshot() -> UIImage {
    
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.mainScreen().scale)
    drawViewHierarchyInRect(self.bounds, afterScreenUpdates: true)
    
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return image
  }
}
