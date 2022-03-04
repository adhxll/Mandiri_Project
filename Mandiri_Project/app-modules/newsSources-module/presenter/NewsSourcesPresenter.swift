//
//  NewsSourcesPresenter.swift
//  Mandiri_Project
//
//  Created by Adhella Subalie on 03/03/22.
//

import Foundation
import UIKit

class NewsSourcesPresenter: NewsSourcesViewToPresenterProtocol {
    
    var view: NewsSourcesPresenterToViewProtocol?
    
    var interactor: NewsSourcesPresenterToInteractorProtocol?
    
    var router: NewsSourcesPresenterToRouterProtocol?
    
    func populateSourcesList(category:NewsCategory){
        let APIURL = getAPIURL(urlString: category)
        interactor?.fetchSources(url: APIURL)
    }
    
    func showNewsSourcesController(navigationController: UINavigationController, sourceTitle:String, sourceId: String) {
        router?.pushToNewsArticlesScreen(navigationController: navigationController, sourceTitle: sourceTitle, sourceId: sourceId)
    }
    
    func getAPIURL(urlString: NewsCategory) -> String {
        let url = Endpoints.newsSourcesAPI.rawValue + "category=" + urlString.rawValue + "&apiKey=" + NEWS_API_KEY
        return url
    }
    
    func startSearching(query: String) {
        interactor?.fetchQueryData(query: query)
    }
    
}

extension NewsSourcesPresenter: NewsSourcesInteractorToPresenterProtocol {
    func noticeFailedFetch() {
        view?.showFailedFetchNotice()
    }
    
    func noticeSuccessfulFetch(data: [NewsSource]) {
        view?.showSuccessfulFetchedData(data: data)
    }
    
    
}
