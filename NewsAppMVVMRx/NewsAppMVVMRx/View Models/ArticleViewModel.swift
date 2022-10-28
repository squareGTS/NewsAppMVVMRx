//
//  ArticleViewModel.swift
//  NewsAppMVVMRx
//
//  Created by Maxim Bekmetov on 27.10.2022.
//

import Foundation
import RxSwift
import RxCocoa

struct ArticleViewModel {
    let article: Article

    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    var title: Observable<String> {
        return Observable<String>.just(article.title)
    }

    var description: Observable<String> {
        return Observable<String>.just(article.description ?? "")
    }
}

struct ArticleListViewModel {
    let articlesVM: [ArticleViewModel]
}

extension ArticleListViewModel {
    init(_ articles: [Article]) {
        self.articlesVM = articles.compactMap(ArticleViewModel.init)
    }
}

extension ArticleListViewModel {
    func articleAt(_ index: Int) -> ArticleViewModel {
        return self.articlesVM[index]
    }
}
