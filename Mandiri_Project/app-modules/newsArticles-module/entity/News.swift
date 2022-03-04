//
//  NewsModel.swift
//  Mandiri_Project
//
//  Created by Adhella Subalie on 03/03/22.
//

import Foundation

struct RootNews: Codable {
    var status: String?
    var totalResults: Int?
    var articles:[News]?
}

struct News: Codable{
    var source: ArticleSource?
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
}

struct ArticleSource: Codable {
    var id: String?
    var name: String?
}
