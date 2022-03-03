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
        navigationController?.isNavigationBarHidden = true
    }
    
    func initializePageTitle() {
        pageTitleLabel.text = category?.rawValue.uppercased()
    }
    func initializeTable() {
        table.delegate = self
        table.dataSource = self
        table.register(SourcesTableViewCell.nib, forCellReuseIdentifier: SourcesTableViewCell.identifier)
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 100
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
        if newsSources.isEmpty{
            return 1
        }
        return newsSources.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: SourcesTableViewCell.identifier, for: indexPath) as! SourcesTableViewCell
        if newsSources.isEmpty {
            cell.setContent(title: "Something went wrong :(", desc: "" )
        } else {
            cell.setContent(title: newsSources[indexPath.row].name ?? "", desc: newsSources[indexPath.row].description ?? "")
        }
        return cell
    }
}
