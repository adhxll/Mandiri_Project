//
//  Mandiri_ProjectTests.swift
//  Mandiri_ProjectTests
//
//  Created by Adhella Subalie on 01/03/22.
//

import XCTest
@testable import Mandiri_Project

class Mandiri_ProjectTests: XCTestCase {

    func testSourceFetching() throws {
        var data: [NewsSource] = []
        data = NewsSourcesInteractor().fetchSources(url: "https://newsapi.org/v2/top-headlines/sources?category=sports&apiKey=ff446f83e57d4766b16eb73452a42abd")
        print(data.count)
        XCTAssertFalse(data.count > 0)
    }

}
