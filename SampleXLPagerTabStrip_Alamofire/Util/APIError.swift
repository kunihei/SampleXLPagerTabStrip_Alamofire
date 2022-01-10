//
//  APIError.swift
//  SampleXLPagerTabStrip_Alamofire
//
//  Created by 祥平 on 2022/01/10.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case invalidResponse
    case unknown(Error)
}

extension APIError {
    var title: String {
        switch self {
        case .invalidResponse: return "無効なレスポンスです。"
        case .invalidURL: return "無効なURLです。"
        case .unknown(let error): return "予期せぬエラーが発生しました。\(error)"
        }
    }
}
