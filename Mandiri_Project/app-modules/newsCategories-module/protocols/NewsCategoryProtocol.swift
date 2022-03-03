//
//  NewsCategoryProtocol.swift
//  Mandiri_Project
//
//  Created by Adhella Subalie on 03/03/22.
//

import Foundation
import UIKit


protocol NewsCategoryViewToPresenterProtocol: AnyObject {
    var view: NewsCategoryPresenterToViewProtocol? { get set }
    var interactor: NewsCategoryPresenterToInteractorProtocol? { get set }
    var router: NewsCategoryPresenterToRouterProtocol? { get set }
    func populateCategoryList() -> [NewsCategory]
    func showNewsSourcesController(navigationController:UINavigationController, category: NewsCategory)
    
}

protocol NewsCategoryPresenterToViewProtocol: AnyObject {
    var presenter: NewsCategoryViewToPresenterProtocol? { get set }
}

protocol NewsCategoryPresenterToRouterProtocol: AnyObject {
    static func createModule()-> NewsCategoryViewController
    func pushToNewsSourcesScreen(navigationController:UINavigationController, category: NewsCategory)
}

protocol NewsCategoryPresenterToInteractorProtocol: AnyObject {
    var presenter: NewsCategoryInteractorToPresenterProtocol? { get set }
    func fetchCategories() -> [NewsCategory]
    
}

protocol NewsCategoryInteractorToPresenterProtocol: AnyObject {
    
}
