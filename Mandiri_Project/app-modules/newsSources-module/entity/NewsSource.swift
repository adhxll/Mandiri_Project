//
//  NewsSourceEntity.swift
//  Mandiri_Project
//
//  Created by Adhella Subalie on 03/03/22.
//

import Foundation

struct RootNewsSource: Codable {
    var status: String?
    var sources: [NewsSource]?
}
struct NewsSource: Codable {
    var id: String?
    var name: String?
    var description: String?
    var url: String? //or maybe url
    var category: String?
    var language: String?
    var country: String?
}
