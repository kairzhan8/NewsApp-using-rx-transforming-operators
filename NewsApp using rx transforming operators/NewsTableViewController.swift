//
//  NewsTableViewController.swift
//  NewsApp using rx transforming operators
//
//  Created by kairzhan on 2/26/21.
//

import UIKit
import RxSwift
import RxCocoa

class NewsTableViewController: UITableViewController {
    
    private var articles = [Article]()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        populateNews()
        print(articles)
    }
    
    private func populateNews() {
        
        URLRequest.load(resourse: ArticleList.all)
            .subscribe(onNext: { [weak self] result in
                if let result = result {
                    self?.articles = result.articles
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                }
            }).disposed(by: disposeBag)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ArticleCell else {
            fatalError("ArticleCell does not exist")
        }
        cell.titleLabel.text = articles[indexPath.row].title
        cell.descrioptionLabel.text = articles[indexPath.row].description
        return cell
    }
}
