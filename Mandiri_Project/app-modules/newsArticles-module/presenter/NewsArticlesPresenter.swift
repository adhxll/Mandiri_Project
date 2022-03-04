//
//  NewsArticlesPresenter.swift
//  Mandiri_Project
//
//  Created by Adhella Subalie on 04/03/22.
//

import Foundation
import UIKit

class NewsArticlesPresenter: NewsArticlesViewToPresenterProtocol {
    
    var view: NewsArticlesPresenterToViewProtocol?
    
    var interactor: NewsArticlesPresenterToInteractorProtocol?
    
    var router: NewsArticlesPresenterToRouterProtocol?
    
    func getAPIURL(sourceId:String) -> String {
        return Endpoints.newsAPI.rawValue + "sources=" + sourceId + "&apiKey=" + NEWS_API_KEY
    }
    
    func populateSourcesList(sourceId: String) {
        let url = getAPIURL(sourceId: sourceId)
        print(url)
        interactor?.fetchArticles(url: url)
    }
    
    func showNewsSourcesController(navigationController: UINavigationController, url: String) {
        router?.pushToNewsArticlesScreen(navigationController: navigationController, url: url)
    }
    func startSearching(query: String) {
        interactor?.fetchQueryArticles(query: query)
    }
}

extension NewsArticlesPresenter: NewsArticlesInteractorToPresenterProtocol {
    func noticeFailedFetch() {
        view?.showFailedFetchNotice()
    }
    
    func noticeSuccessfulFetch(data: [News]) {
        view?.showSuccessfulFetchedData(data: data)
    }
    
    
}
