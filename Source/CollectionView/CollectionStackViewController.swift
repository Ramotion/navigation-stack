//
//  CollectionStackViewController.swift
//  NavigationStackDemo
//
//  Created by Alex K. on 24/02/16.
//  Copyright © 2016 Alex K. All rights reserved.
//

import UIKit

// MARK: CollectionStackViewController

protocol CollectionStackViewControllerDelegate {
  func controllerDidSelected(index index: Int)
}


class CollectionStackViewController: UICollectionViewController {
  private var screens: [UIImage]
  private let overlay: Float
  
  let delegate: CollectionStackViewControllerDelegate
  
  init(images: [UIImage],
    delegate: CollectionStackViewControllerDelegate,
    overlay: Float,
    scaleRatio: Float,
    scaleValue: Float,
    bgColor: UIColor,
    decelerationRate:CGFloat) {
      
      self.screens  = images
      self.delegate = delegate
      self.overlay  = overlay
        
      let layout = CollectionViewStackFlowLayout(itemsCount: images.count, overlay: overlay, scaleRatio: scaleRatio, scale:scaleValue)
      super.init(collectionViewLayout: layout)
      
      if let collectionView = self.collectionView {
        collectionView.backgroundColor = bgColor
        collectionView.decelerationRate = decelerationRate
      }
  }

  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    configureCollectionView()
    scrolltoIndex(screens.count - 1, animated: false, position: .Left) // move to end
  }
  
  override func viewDidAppear(animated: Bool) {
    
    guard let collectionViewLayout = self.collectionViewLayout as? CollectionViewStackFlowLayout else {
      fatalError("wrong collection layout")
    }
    
    collectionViewLayout.openAnimating = true
    scrolltoIndex(0, animated: true, position: .Left) // open animation
  }
}

// MARK: configure

extension CollectionStackViewController {
  
  private func configureCollectionView() {
    guard let collectionViewLayout = self.collectionViewLayout as? UICollectionViewFlowLayout else {
      fatalError("wrong collection layout")
    }
    
    collectionViewLayout.scrollDirection = .Horizontal
    collectionView?.showsHorizontalScrollIndicator = false
    collectionView?.registerClass(CollectionViewStackCell.self, forCellWithReuseIdentifier: String(CollectionViewStackCell))
  }

}

// MARK: CollectionViewDataSource

extension CollectionStackViewController {
  
  override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return screens.count
  }
  
  override func collectionView(collectionView: UICollectionView,
                         willDisplayCell cell: UICollectionViewCell,
                  forItemAtIndexPath indexPath: NSIndexPath) {
    
    if let cell = cell as? CollectionViewStackCell {
      cell.imageView?.image = screens[indexPath.row]
    }
  }
  
  override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier(String(CollectionViewStackCell),
                              forIndexPath: indexPath)
    return cell
  }
  
  override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    delegate.controllerDidSelected(index: indexPath.row)
    
    guard let currentCell = collectionView.cellForItemAtIndexPath(indexPath) else {
      return
    }

    // move cells
    UIView.animateWithDuration(0.3, delay: 0, options:.CurveEaseIn,
    animations: { () -> Void in
      for  cell in self.collectionView!.visibleCells() where cell != currentCell {
        let row = self.collectionView?.indexPathForCell(cell)?.row
        if row > indexPath.row { // move right
          cell.center = CGPoint(x: cell.center.x + self.view.bounds.size.width * 2, y: cell.center.y)
        } else { // move left
          cell.center = CGPoint(x: cell.center.x - self.view.bounds.size.width * 2, y: cell.center.y)
        }
      }
      }, completion: nil)
    
    UIView.animateWithDuration(0.2, delay: 0.2, options:.CurveEaseOut,
      animations: { () -> Void in
        let offset = collectionView.contentOffset.x - (self.view.bounds.size.width - collectionView.bounds.size.width * CGFloat(self.overlay)) * CGFloat(indexPath.row)
        currentCell.center = CGPoint(x: (currentCell.center.x + offset), y: currentCell.center.y)
      }, completion: nil)
  
    // scale current cell
    UIView.animateWithDuration(0.2, delay: 0.6, options:.CurveEaseOut, animations: { () -> Void in
      let scale = CGAffineTransformMakeScale(1, 1)
      
      currentCell.transform = scale
      currentCell.alpha = 1
      
    }) { (success) -> Void in
        self.dismissViewControllerAnimated(false, completion: nil)
    }
  }
}

// MARK: UICollectionViewDelegateFlowLayout

extension CollectionStackViewController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    return view.bounds.size
  }
  
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: NSInteger) -> CGFloat {
    return -collectionView.bounds.size.width * CGFloat(overlay)
  }
}


// MARK: Additional helpers

extension CollectionStackViewController {
  
  private func scrolltoIndex(index: Int, animated: Bool , position: UICollectionViewScrollPosition) {
    let indexPath = NSIndexPath(forItem: index, inSection: 0)
    collectionView?.scrollToItemAtIndexPath(indexPath, atScrollPosition: position, animated: animated)
  }
}
