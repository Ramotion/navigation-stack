//
//  ThirdViewController.swift
//  NavigationStackDemo
//
//  Created by Alex K. on 29/02/16.
//  Copyright © 2016 Alex K. All rights reserved.
//

import UIKit

class ThirdViewController: UITableViewController {
  
  @IBInspectable var navbarColor: UIColor = .black
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
  }
  
  @IBAction func backHandler(_ sender: AnyObject) {
    let _ = navigationController?.popViewController(animated: true)
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    performSegue(withIdentifier: "push", sender: nil)
  }
  
}
