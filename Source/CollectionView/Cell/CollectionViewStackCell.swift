//
//  CollectionViewStackCell.swift
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

// MARK: CollectionViewStackCell

class CollectionViewStackCell: UICollectionViewCell {
  
  internal var imageView: UIImageView?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    imageView = createImageView()
    createShadow()
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

  fileprivate func createImageView() -> UIImageView {

    let imageView = UIImageView(frame: CGRect.zero)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.layer.shouldRasterize = true
    contentView.addSubview(imageView)
    
    contentView.addConstraints([
      createConstraint(imageView, toItem: contentView, attribute: .top),
      createConstraint(imageView, toItem: contentView, attribute: .bottom),
      createConstraint(imageView, toItem: contentView, attribute: .left),
      createConstraint(imageView, toItem: contentView, attribute: .right),
    ])
    
    return imageView
  }
  
  fileprivate func createConstraint(_ item: UIImageView, toItem: UIView, attribute: NSLayoutAttribute) -> NSLayoutConstraint {
   return NSLayoutConstraint(item: item,
                        attribute: attribute,
                        relatedBy: .equal,
                           toItem: toItem,
                        attribute: attribute,
                       multiplier: 1,
                         constant: 0)
  }
  
  fileprivate func createShadow() {
    layer.masksToBounds = false;
    layer.shadowOpacity = 0.30;
    layer.shadowRadius = 10.0;
    layer.shadowOffset = CGSize.zero;
    layer.shadowPath = UIBezierPath(rect: bounds).cgPath
    layer.shouldRasterize = true;
  }
  
  fileprivate func addBlurOnImage(_ image: UIImageView) {
    
    let blurEffect = UIBlurEffect(style: .dark)
    let blurView = UIVisualEffectView(effect: blurEffect)
    blurView.translatesAutoresizingMaskIntoConstraints = false
    imageView!.insertSubview(blurView, at: 3)

    let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
    let vibrancyView = UIVisualEffectView(effect: vibrancyEffect)
    vibrancyView.translatesAutoresizingMaskIntoConstraints = false
    blurView.contentView.addSubview(vibrancyView)
    
  }

}
