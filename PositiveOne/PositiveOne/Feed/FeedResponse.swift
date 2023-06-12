//
//  FeedResponse.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/12.
//

import Foundation

struct FeedResponse: Decodable {
    let success: String
    let data: [FeedContent]
}

struct FeedContent: Decodable {
    let text: String
    let date: String
    let likeCheck: Bool
    let name: String
}
