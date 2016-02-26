//
//  CollectionViewStackCell.swift
//  NavigationStackDemo
//
//  Created by Alex K. on 24/02/16.
//  Copyright © 2016 Alex K. All rights reserved.
//

import UIKit

// MARK: CollectionViewStackCell

class CollectionViewStackCell: UICollectionViewCell {
  
  internal var imageView: UIImageView?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    imageView = createImageView()
  }

  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
  
  internal override func prepareForReuse() {
    imageView?.image = nil
  }
}

// MARK: configure

extension CollectionViewStackCell {

  private func createImageView() -> UIImageView {

    let imageView = UIImageView(frame: CGRect.zero)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    contentView.addSubview(imageView)
    
    contentView.addConstraints([
      createConstraint(imageView, toItem: contentView, attribute: .Top),
      createConstraint(imageView, toItem: contentView, attribute: .Bottom),
      createConstraint(imageView, toItem: contentView, attribute: .Left),
      createConstraint(imageView, toItem: contentView, attribute: .Right),
    ])
    
    return imageView
  }
  
  private func createConstraint(item: UIImageView, toItem: UIView, attribute: NSLayoutAttribute) -> NSLayoutConstraint {
   return NSLayoutConstraint(item: item,
                        attribute: attribute,
                        relatedBy: .Equal,
                           toItem: toItem,
                        attribute: attribute,
                       multiplier: 1,
                         constant: 0)
  }
}
