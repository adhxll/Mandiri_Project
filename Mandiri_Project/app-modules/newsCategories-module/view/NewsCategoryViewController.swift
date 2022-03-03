//
//  NewsCategoryViewController.swift
//  Mandiri_Project
//
//  Created by Adhella Subalie on 03/03/22.
//

import UIKit

class NewsCategoryViewController: UIViewController {
    var presenter: NewsCategoryViewToPresenterProtocol?
    @IBOutlet var table: UITableView!
    var categories: [NewsCategory] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setCategories()
        initializeTableView()
        // Do any additional setup after loading the view.
    }
    
    func initializeTableView() {
        table.delegate = self
        table.dataSource = self
        table.register(CategoryTableViewCell.nib, forCellReuseIdentifier: CategoryTableViewCell.identifier)
    }
    
    func setCategories() {
        categories = presenter?.populateCategoryList() ?? []
    }

}

extension NewsCategoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier, for: indexPath) as! CategoryTableViewCell
        
        cell.textLabel?.text = categories[indexPath.row].rawValue.uppercased()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showNewsSourcesController(navigationController: navigationController!, category: categories[indexPath.row])
    }
     
}

extension NewsCategoryViewController: NewsCategoryPresenterToViewProtocol {
    
    
}

