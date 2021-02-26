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

extension ArticleList {
    
    static var all: Resource<ArticleList> = {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=8b5efbb9647d421fa1596e6eda2ae78e")!
        return Resource(url: url)
    }()
}

struct Article: Decodable {
    let title: String
    let description: String
}
