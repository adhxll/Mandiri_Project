//
//  Constant.swift
//  Mandiri_Project
//
//  Created by Adhella Subalie on 02/03/22.
//

import Foundation

let NEWS_API_KEY = "ff446f83e57d4766b16eb73452a42abd"

// cannot be used by itself because it needs more param
enum Endpoints: String {
    case newsAPI = "https://newsapi.org/v2/everything?"
    case newsSourcesAPI = "https://newsapi.org/v2/top-headlines/sources?"
}

// Possible options: business entertainment general health science sports technology
// this class is used to for constructing the API url
enum NewsCategory: String, CaseIterable {
    case business = "business"
    case entertainment = "entertainment"
    case general = "general"
    case health = "health"
    case science = "science"
    case sports = "sports"
    case technology = "technology"
}
