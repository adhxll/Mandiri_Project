//
//  NewsSourcesRouter.swift
//  Mandiri_Project
//
//  Created by Adhella Subalie on 03/03/22.
//

import Foundation
import UIKit

class NewsSourcesRouter : NewsSourcesPresenterToRouterProtocol {
    static func createModule(category:NewsCategory) -> NewsSourcesViewController {
        let view = NewsSourcesViewController(nibName: "NewsSourcesViewController", bundle: nil)
        let presenter: NewsSourcesInteractorToPresenterProtocol & NewsSourcesViewToPresenterProtocol = NewsSourcesPresenter()
        let interactor: NewsSourcesPresenterToInteractorProtocol = NewsSourcesInteractor()
        let router: NewsSourcesPresenterToRouterProtocol = NewsSourcesRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        // passing the data
        view.category = category
        
        return view
    }
    
    func pushToNewsArticlesScreen(navigationController: UINavigationController, source: String) {
        
    }
    
    
}
