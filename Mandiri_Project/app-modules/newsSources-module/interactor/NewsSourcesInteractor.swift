//
//  NewsSourceInteractor.swift
//  Mandiri_Project
//
//  Created by Adhella Subalie on 03/03/22.
//

import Foundation

class NewsSourcesInteractor: NewsSourcesPresenterToInteractorProtocol {
    var presenter: NewsSourcesInteractorToPresenterProtocol?
    private var placeholder: [NewsSource] = [] {
        didSet{
            DataManager.NEWSSOURCES = placeholder
            presenter?.noticeSuccessfulFetch(data: placeholder)
        }
    }
    func fetchSources(url:String){
        APIRequest.shared.fetchData(urlString: url) { (result: Result<RootNewsSource,Error>) in
            switch result {
            case .success(let sources):
                DispatchQueue.main.async {
                    print("success")
                    self.placeholder = sources.sources ?? []
                }
            case .failure(let error):
                self.presenter?.noticeFailedFetch()
                print(error.localizedDescription)
            }
        }
    }
    func fetchQueryData(query: String) {
        let data = DataManager.NEWSSOURCES
        let filteredData = data.filter { (source:NewsSource) -> Bool in
            return source.name?.lowercased().contains(query.lowercased()) ?? false
        }
        presenter?.noticeSuccessfulFetch(data: filteredData)
    }

}
