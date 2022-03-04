//
//  NewsArticlesRouter.swift
//  Mandiri_Project
//
//  Created by Adhella Subalie on 04/03/22.
//

import Foundation
import UIKit

class NewsArticlesRouter: NewsArticlesPresenterToRouterProtocol {
    static func createModule(sourceTitle: String, sourceId: String) -> NewsArticlesViewController {
        let view = NewsArticlesViewController(nibName: "NewsArticlesViewController", bundle: nil)
        let interactor: NewsArticlesPresenterToInteractorProtocol = NewsArticlesInteractor()
        let presenter: NewsArticlesViewToPresenterProtocol & NewsArticlesInteractorToPresenterProtocol = NewsArticlesPresenter()
        let router = NewsArticlesRouter()
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router
        
        view.sourceTitle = sourceTitle
        view.sourceId = sourceId
        
        return view
    }
    
    func pushToNewsArticlesScreen(navigationController: UINavigationController, url: String) {
        let vc = WebViewController()
        vc.urlString = url
        navigationController.pushViewController(vc, animated: true)
    }
}
