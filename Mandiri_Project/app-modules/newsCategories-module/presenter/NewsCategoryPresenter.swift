//
//  File.swift
//  Mandiri_Project
//
//  Created by Adhella Subalie on 03/03/22.
//

import Foundation
import UIKit

class NewsCategoryPresenter: NewsCategoryViewToPresenterProtocol {
    var view: NewsCategoryPresenterToViewProtocol?
    var interactor: NewsCategoryPresenterToInteractorProtocol?
    var router: NewsCategoryPresenterToRouterProtocol?
    
    func populateCategoryList() -> [NewsCategory] {
        return interactor?.fetchCategories() ?? []
    }
    
    func showNewsSourcesController(navigationController: UINavigationController, category: NewsCategory) {
        router?.pushToNewsSourcesScreen(navigationController: navigationController, category: category)
    }
}

extension NewsCategoryPresenter: NewsCategoryInteractorToPresenterProtocol {
    
}
