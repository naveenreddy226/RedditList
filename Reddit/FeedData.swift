//
//  FeedData.swift
//  Reddit
//
//  Created by Naveen Sudireddy on 10/13/21.
//  Copyright © 2021 Naveen Sudireddy. All rights reserved.
//

import Foundation

//protocol FeedDataDelegate {
//    func getFeedData(completion: @escaping (Result<FeedModel, FeedError>) -> Void)
//}

enum FeedError: Error {
    case badURL
    case parseError
    case noresponse
}
class FeedData {
    func getFeedData(completion: @escaping (Result<FeedResponse, FeedError>) -> Void) {
        let session = URLSession.shared
        guard let url = URL(string: "https://www.reddit.com/.json?") else {                       completion(.failure(.badURL))
            return
        }
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            guard error == nil else { return }
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                      completion(.failure(.noresponse))
                return
            }
            guard let data = data else { return }
                        
            if let modelObject =  try? JSONDecoder().decode(FeedResponse.self, from: data) {
                completion(.success(modelObject))
            } else {
                completion(.failure(.parseError))
            }
            
        })
        task.resume()

    }
}
