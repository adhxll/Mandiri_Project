//
//  NewsCategoryRouter.swift
//  Mandiri_Project
//
//  Created by Adhella Subalie on 03/03/22.
//

import Foundation
import UIKit

class NewsCategoryRouter : NewsCategoryPresenterToRouterProtocol {
    
    static func createModule() -> NewsCategoryViewController {
        let view = NewsCategoryViewController(nibName: "NewsCategoryViewController", bundle: nil)
        let presenter: NewsCategoryInteractorToPresenterProtocol & NewsCategoryViewToPresenterProtocol = NewsCategoryPresenter()
        let interactor: NewsCategoryPresenterToInteractorProtocol = NewsCategoryInteractor()
        let router :NewsCategoryPresenterToRouterProtocol = NewsCategoryRouter()
        
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    func pushToNewsSourcesScreen(navigationController: UINavigationController, category: NewsCategory) {
        let vc = NewsSourcesRouter.createModule(category: category)
        navigationController.pushViewController(vc, animated: true)
    }

}
