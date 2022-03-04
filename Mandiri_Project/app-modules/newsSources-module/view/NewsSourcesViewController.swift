//
//  NewsSourcesViewController.swift
//  Mandiri_Project
//
//  Created by Adhella Subalie on 03/03/22.
//

import UIKit

class NewsSourcesViewController: UIViewController {
    var presenter: NewsSourcesViewToPresenterProtocol?
    var category: NewsCategory?
    var newsSources: [NewsSource] = [] {
        didSet {
            table.reloadData()
        }
    }
    @IBOutlet var table: UITableView!
    @IBOutlet var pageTitleLabel: UILabel!
    @IBOutlet var searchBar: UISearchBar!
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.populateSourcesList(category: category!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializePageTitle()
        initializeTable()
        initializeSearchbar()
    }
    
    func initializePageTitle() {
        let title = category?.rawValue.uppercased()
        pageTitleLabel.text = title
        navigationController?.title = title
    }
    
    func initializeTable() {
        table.delegate = self
        table.dataSource = self
        table.register(SourcesTableViewCell.nib, forCellReuseIdentifier: SourcesTableViewCell.identifier)
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 100
    }
    
    func initializeSearchbar(){
        searchBar.delegate = self
        searchBar.placeholder = "Search news source..."
        definesPresentationContext = true
    }

}

extension NewsSourcesViewController: NewsSourcesPresenterToViewProtocol {
    func showFailedFetchNotice() {
        print("Something went wrong :(")
    }
    
    func showSuccessfulFetchedData(data: [NewsSource]) {
        newsSources = data
        table.reloadData()
    }
    
}

extension NewsSourcesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsSources.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: SourcesTableViewCell.identifier, for: indexPath) as! SourcesTableViewCell
      
        cell.setContent(title: newsSources[indexPath.row].name ?? "", desc: newsSources[indexPath.row].description ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showNewsSourcesController(navigationController: navigationController!, sourceTitle: newsSources[indexPath.row].name ?? "", sourceId: newsSources[indexPath.row].id ?? "")
    }
}

extension NewsSourcesViewController: UISearchBarDelegate {
    func beginSearching(searchText: String){
        presenter?.startSearching(query: searchText)
    }
    
    func finishedSearching(){
        newsSources = DataManager.NEWSSOURCES
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
