//
//  NewsSourcesProtocols.swift
//  Mandiri_Project
//
//  Created by Adhella Subalie on 03/03/22.
//

import Foundation
import UIKit


protocol NewsSourcesViewToPresenterProtocol: AnyObject {
    var view: NewsSourcesPresenterToViewProtocol? { get set }
    var interactor: NewsSourcesPresenterToInteractorProtocol? { get set }
    var router: NewsSourcesPresenterToRouterProtocol? { get set }
    func populateSourcesList(category: NewsCategory)
    func showNewsSourcesController(navigationController:UINavigationController, sourceTitle:String, sourceId: String)
    func startSearching(query: String)
}

protocol NewsSourcesPresenterToViewProtocol: AnyObject {
    var presenter: NewsSourcesViewToPresenterProtocol? { get set }
    func showFailedFetchNotice()
    func showSuccessfulFetchedData(data:[NewsSource])
}

protocol NewsSourcesPresenterToRouterProtocol: AnyObject {
    static func createModule(category: NewsCategory)-> NewsSourcesViewController
    func pushToNewsArticlesScreen(navigationController:UINavigationController, sourceTitle:String, sourceId: String)
}

protocol NewsSourcesPresenterToInteractorProtocol: AnyObject {
    var presenter: NewsSourcesInteractorToPresenterProtocol? { get set }
    func fetchSources(url:String)
    func fetchQueryData(query: String)
    
}

protocol NewsSourcesInteractorToPresenterProtocol: AnyObject {
    func noticeFailedFetch()
    func noticeSuccessfulFetch(data:[NewsSource])
}

