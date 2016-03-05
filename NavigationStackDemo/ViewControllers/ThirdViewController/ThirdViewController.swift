//
//  ThirdViewController.swift
//  NavigationStackDemo
//
//  Created by Alex K. on 29/02/16.
//  Copyright © 2016 Alex K. All rights reserved.
//

import UIKit

class ThirdViewController: UITableViewController {
  
  @IBInspectable var navbarColor: UIColor = .blackColor()
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    
  }
  
  @IBAction func backHandler(sender: AnyObject) {
    navigationController?.popViewControllerAnimated(true)
  }
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    performSegueWithIdentifier("push", sender: nil)
  }
  
}
