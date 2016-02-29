//
//  TableViewController.swift
//  NavigationStackDemo
//
//  Created by Alex K. on 29/02/16.
//  Copyright © 2016 Alex K. All rights reserved.
//

import UIKit

// MARK: TableViewController

class TableViewController: UITableViewController {
  
  let items = [
    UIColor(red:0.97, green:0.74, blue:0.58, alpha:1),
    UIColor(red:0.95, green:0.86, blue:0.58, alpha:1),
    UIColor(red:0.78, green:0.89, blue:0.58, alpha:1),
    UIColor(red:0.61, green:0.86, blue:0.87, alpha:1),
    UIColor(red:0.77, green:0.76, blue:0.92, alpha:1)
  ]

  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let navigationController = navigationController {
      navigationController.navigationBar.barTintColor = UIColor(red:0.93, green:0.93, blue:0.95, alpha:1)
    }
  }
  
}

// MARK: UITableViewDataSource

extension TableViewController {
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    return tableView.dequeueReusableCellWithIdentifier(String(TableViewCell), forIndexPath: indexPath)
  }
}

// MARK: UITableViewDelegate

extension TableViewController {
  override func tableView(tableView: UITableView, willDisplayCell
    cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
      
      guard let cell = cell as? TableViewCell else {
        return
      }
      cell.circleView.backgroundColor = items[indexPath.row]
      cell.contantHeight.constant = CGFloat(arc4random_uniform(150) + 30)
  }
}