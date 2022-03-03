//
//  NewsCategoryInteractor.swift
//  Mandiri_Project
//
//  Created by Adhella Subalie on 03/03/22.
//

import Foundation

class NewsCategoryInteractor: NewsCategoryPresenterToInteractorProtocol{
    var presenter: NewsCategoryInteractorToPresenterProtocol?
    
    func fetchCategories() -> [NewsCategory]{
        var categories: [NewsCategory] = []
        
        for c in NewsCategory.allCases{
            categories.append(c)
        }
        return categories
    }
}
