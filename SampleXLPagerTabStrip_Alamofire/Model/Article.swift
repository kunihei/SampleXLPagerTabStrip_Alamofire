//
//  Article.swift
//  SampleXLPagerTabStrip_Alamofire
//
//  Created by 祥平 on 2022/01/10.
//

import Foundation
import Alamofire

struct Article: Codable {
    let title: String
    let user: User
}

struct User: Codable {
    let id: String
}
