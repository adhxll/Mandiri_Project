//
//  NewsArticlesInteractor.swift
//  Mandiri_Project
//
//  Created by Adhella Subalie on 04/03/22.
//

import Foundation

class NewsArticlesInteractor: NewsArticlesPresenterToInteractorProtocol {
    
    var presenter: NewsArticlesInteractorToPresenterProtocol?
    var placeholder: [News] = [] {
        didSet {
            DataManager.NEWSDATA = placeholder
            presenter?.noticeSuccessfulFetch(data: placeholder)
        }
    }
    func fetchArticles(url: String) {
        APIRequest.shared.fetchData(urlString: url) { (result: Result<RootNews,Error>) in
            switch result {
            case .success(let rootnews):
                DispatchQueue.main.async {
                    print("success")
                    self.placeholder = rootnews.articles ?? []
                }
            case .failure(let error):
                print(error.localizedDescription)
                self.presenter?.noticeFailedFetch()
            }
        }
    }
    
    func fetchQueryArticles(query: String) {
        let data = DataManager.NEWSDATA
        let filteredData = data.filter { (news: News)-> Bool in
            return news.title?.lowercased().contains(query.lowercased()) ?? false
        }
        presenter?.noticeSuccessfulFetch(data: filteredData)
    }
    
}


