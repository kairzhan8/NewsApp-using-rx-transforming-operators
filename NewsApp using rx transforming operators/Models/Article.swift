//
//  Article.swift
//  NewsApp using rx transforming operators
//
//  Created by kairzhan on 2/26/21.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String
}
