//
//  Article.swift
//  NewsAppMVVMRx
//
//  Created by Maxim Bekmetov on 27.10.2022.
//

import Foundation

struct ArticleResponse: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String?
}
