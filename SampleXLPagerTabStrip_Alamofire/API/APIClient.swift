//
//  APIClient.swift
//  SampleXLPagerTabStrip_Alamofire
//
//  Created by 祥平 on 2022/01/10.
//

import Foundation
import Alamofire

typealias ResultHandler<T> = (Result<T, APIError>) -> Void

struct APIClient {
    func request(handler: @escaping ResultHandler<[Article]>) {
        let urlString = "https://qiita.com/api/v2/items"
        let url = URL(string: urlString)
        guard let url = URL(string: urlString) else {
            handler(.failure(.invalidURL))
            return
        }
        AF.request(urlString)
            .responseJSON { response in
                guard let data = response.data else {
                    handler(.failure(.invalidResponse))
                    return
                }
                
                do {
                    let articles = try JSONDecoder().decode([Article].self, from: data)
                    handler(.success(articles))
                } catch {
                    handler(.failure(.unknown(error)))
                }
            }
    }
}
