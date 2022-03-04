//
//  NewsArticlesViewController.swift
//  Mandiri_Project
//
//  Created by Adhella Subalie on 04/03/22.
//

import UIKit

class NewsArticlesViewController: UIViewController {
    var presenter: NewsArticlesViewToPresenterProtocol?
    @IBOutlet var table: UITableView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var searchBar: UISearchBar!
    
    var articles: [News] = []
    var sourceTitle: String?
    var sourceId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeTable()
        initializeLabel()
        initializeSearchBar()
        presenter?.populateSourcesList(sourceId: sourceId ?? "")
    }

    func initializeTable(){
        table.delegate = self
        table.dataSource = self
        table.register(ArticlesTableViewCell.nib, forCellReuseIdentifier: ArticlesTableViewCell.identifier)
        table.rowHeight = 100
    }
    func initializeLabel(){
        titleLabel.text = sourceTitle
    }
    
    func initializeSearchBar(){
        searchBar?.delegate = self
        searchBar?.placeholder = "Search news..."
        definesPresentationContext = true
    }
}

extension NewsArticlesViewController: NewsArticlesPresenterToViewProtocol {
    
    func showFailedFetchNotice() {
        print("Something went wrong :(")
    }
    
    func showSuccessfulFetchedData(data: [News]) {
        articles = data
        table.reloadData()
    }
    
}

extension NewsArticlesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: ArticlesTableViewCell.identifier, for: indexPath) as! ArticlesTableViewCell
        cell.setContent(title: articles[indexPath.row].title ?? "", snippet: articles[indexPath.row].description ?? "", imageURL: articles[indexPath.row].urlToImage)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showNewsSourcesController(navigationController: navigationController!, url: articles[indexPath.row].url ?? "")
    }
}


extension NewsArticlesViewController :UISearchBarDelegate {
    func beginSearching(searchText: String){
        presenter?.startSearching(query: searchText)
    }
    
    func finishedSearching(){
        articles = DataManager.NEWSDATA
        table.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            finishedSearching()
        } else {
            beginSearching(searchText: searchText)
        }
    }
}
