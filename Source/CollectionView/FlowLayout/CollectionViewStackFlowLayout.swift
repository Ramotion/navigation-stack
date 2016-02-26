//
//  CollectionViewStackFlowLayout.swift
//  NavigationStackDemo
//
//  Created by Alex K. on 25/02/16.
//  Copyright © 2016 Alex K. All rights reserved.
//

import UIKit

// MARK: CollectionViewStackFlowLayout

class CollectionViewStackFlowLayout: UICollectionViewFlowLayout {
  
  let itemsCount: Int
  
  init(itemsCount: Int) {
    self.itemsCount = itemsCount
    super.init()
  }

  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }

}

extension CollectionViewStackFlowLayout {
  
  override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    let items = NSArray (array: super.layoutAttributesForElementsInRect(rect)!, copyItems: true)
    var headerAttributes: UICollectionViewLayoutAttributes?
    
    items.enumerateObjectsUsingBlock { (object, idex, stop) -> Void in
      let attributes = object as! UICollectionViewLayoutAttributes
      
      if attributes.representedElementKind == UICollectionElementKindSectionHeader {
        headerAttributes = attributes
      }
      else {
        self.updateCellAttributes(attributes, headerAttributes: headerAttributes)
      }
    }
    return items as? [UICollectionViewLayoutAttributes]
  }
  
  func updateCellAttributes(attributes: UICollectionViewLayoutAttributes, headerAttributes: UICollectionViewLayoutAttributes?) {
    
    guard let collectionView = self.collectionView else {
      return;
    }
    
    let itemWidth = collectionView.bounds.size.width - collectionView.bounds.size.width * 0.2 // hack
    
    let maxScale = 0.8 - CGFloat(itemsCount - attributes.indexPath.row) / 50.0
    let minScale = 0.7 - CGFloat(itemsCount - attributes.indexPath.row) / 50.0
    
    let allWidth = itemWidth * CGFloat(itemsCount - 1)
    
    // scale
    var currentScale = (maxScale + minScale) - (minScale + collectionView.contentOffset.x / (allWidth / (maxScale - minScale)))
    currentScale = currentScale > maxScale ? maxScale : currentScale
    currentScale = currentScale < minScale ? minScale : currentScale
    
    attributes.transform = CGAffineTransformMakeScale(currentScale, currentScale)
    attributes.zIndex = attributes.indexPath.row
    //
//
//    
    if attributes.indexPath.row == 0 {
//      attributes.frame = CGRect(origin: CGPoint(x: attributes.bounds.origin.x + collectionView.contentOffset.x / 4.0, y: attributes.frame.origin.y),
//                                size: attributes.frame.size)
//      attributes.center = CGPoint(x: attributes.bounds.origin.x + collectionView.contentOffset.x / 4.0, y: attributes.center.y)
//      print(attributes.frame)
//      attributes.frame = CGRect(x: attributes.bounds.origin.x + collectionView.contentOffset.x / 4.0,
//        y: attributes.frame.origin.y, width: attributes.frame.size.width, height: attributes.frame.size.height)
//      print(attributes.frame)
    }
  }
  
  override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
    return true
  }
}
