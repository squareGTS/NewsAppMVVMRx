//
//  NewsTableViewController.swift
//  NewsAppMVVMRx
//
//  Created by Maxim Bekmetov on 27.10.2022.
//

import UIKit
import RxSwift

class NewsTableViewController: UITableViewController {

    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.prefersLargeTitles = true

        populateNews()
    }

    private func populateNews() {
        let resource = Resource<ArticleResponse>(url: URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=c3c25d770bd44a8eb00c0064f06067b5")!)

        URLRequest.load(resource: resource).subscribe(onNext: {
            print($0)
        }).disposed(by: disposeBag)



    }

    // override func numberOfSections(in tableView: UITableView) -> Int { 0 }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 1 }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {


        return UITableViewCell()
    }
}
