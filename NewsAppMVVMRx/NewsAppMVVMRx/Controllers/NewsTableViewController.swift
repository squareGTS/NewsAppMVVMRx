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
    private var articleListVM: ArticleListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.prefersLargeTitles = true

        populateNews()
    }

    private func populateNews() {
        let resource = Resource<ArticleResponse>(url: URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=c3c25d770bd44a8eb00c0064f06067b5")!)

        URLRequest.load(resource: resource).subscribe(onNext: { articleResponse in
            let articles = articleResponse.articles
            self.articleListVM = ArticleListViewModel(articles)

            DispatchQueue.main.async {
                self.tableView.reloadData()
            }

        }).disposed(by: disposeBag)
    }

    // override func numberOfSections(in tableView: UITableView) -> Int { 0 }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM == nil ? 0 : self.articleListVM.articlesVM.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell in not found")
        }

        let articleVM = self.articleListVM.articleAt(indexPath.row)

        articleVM.title.asDriver(onErrorJustReturn: "").drive(cell.titleLabel.rx.text).disposed(by: disposeBag)
        articleVM.description.asDriver(onErrorJustReturn: "").drive(cell.descriptionLabel.rx.text).disposed(by: disposeBag)

        return cell
    }
}
