//
//  FirstTableViewController.swift
//  NavigationStackDemo
//
//  Created by Alex K. on 29/02/16.
//  Copyright © 2016 Alex K. All rights reserved.
//

import UIKit

// MARK: FirstTableViewController

class FirstTableViewController: UITableViewController {

    @IBOutlet var search: UISearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController!.interactivePopGestureRecognizer?.delegate = self

        navigationItem.titleView = search
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let navigationController = navigationController {
            navigationController.navigationBar.barTintColor = UIColor(red: 0.4, green: 0.47, blue: 0.62, alpha: 1)
        }
    }

    override func tableView(_: UITableView, didSelectRowAt _: IndexPath) {
        performSegue(withIdentifier: "push", sender: nil)
    }
}

// MARK: UIGestureRecognizerDelegate

extension FirstTableViewController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_: UIGestureRecognizer) -> Bool {

        if navigationController?.viewControllers.count == 2 {
            return true
        }

        if let navigationController = self.navigationController as? NavigationStack {
            navigationController.showControllers()
        }

        return false
    }
}
