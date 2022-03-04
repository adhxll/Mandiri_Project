//
//  NewsArticlesProtocols.swift
//  Mandiri_Project
//
//  Created by Adhella Subalie on 04/03/22.
//

import Foundation
import UIKit


protocol NewsArticlesViewToPresenterProtocol: AnyObject {
    var view: NewsArticlesPresenterToViewProtocol? { get set }
    var interactor: NewsArticlesPresenterToInteractorProtocol? { get set }
    var router: NewsArticlesPresenterToRouterProtocol? { get set }
    func populateSourcesList(sourceId: String)
    func showNewsSourcesController(navigationController:UINavigationController, url: String)
    func startSearching(query: String)
    
}

protocol NewsArticlesPresenterToViewProtocol: AnyObject {
    var presenter: NewsArticlesViewToPresenterProtocol? { get set }
    var sourceTitle: String? { get set }
    var sourceId: String? { get set }
    func showFailedFetchNotice()
    func showSuccessfulFetchedData(data: [News])
}

protocol NewsArticlesPresenterToRouterProtocol: AnyObject {
    static func createModule(sourceTitle: String, sourceId: String)-> NewsArticlesViewController
    func pushToNewsArticlesScreen(navigationController:UINavigationController, url: String)
}

protocol NewsArticlesPresenterToInteractorProtocol: AnyObject {
    var presenter: NewsArticlesInteractorToPresenterProtocol? { get set }
    func fetchArticles(url:String)
    func fetchQueryArticles(query: String)
    
}

protocol NewsArticlesInteractorToPresenterProtocol: AnyObject {
    func noticeFailedFetch()
    func noticeSuccessfulFetch(data:[News])
}
