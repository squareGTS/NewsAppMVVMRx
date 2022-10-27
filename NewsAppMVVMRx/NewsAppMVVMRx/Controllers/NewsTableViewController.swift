//
//  NewsTableViewController.swift
//  NewsAppMVVMRx
//
//  Created by Maxim Bekmetov on 27.10.2022.
//

import UIKit

class NewsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    // MARK: - Table view data source

   // override func numberOfSections(in tableView: UITableView) -> Int { 0 }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 1 }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {


        return UITableViewCell()
    }
}
