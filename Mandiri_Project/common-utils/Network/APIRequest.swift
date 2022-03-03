//
//  APIRequest.swift
//  Mandiri_Project
//
//  Created by Adhella Subalie on 02/03/22.
//

import Foundation

class APIRequest {
    
    static let shared = APIRequest()
    private init() {}
    
    func fetchData<T: Codable>(urlString: String, completion: @escaping (Result<T, Error>) -> Void) {
        let url = URL(string: urlString)!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                fatalError("Data cannot be found")
            }
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch(let error) {
                completion(.failure(error))
            }
        }.resume()
    }
    
}
