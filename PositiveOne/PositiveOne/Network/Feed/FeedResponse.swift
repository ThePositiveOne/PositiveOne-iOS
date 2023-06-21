//
//  FeedResponse.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/12.
//

import Foundation


struct FeedResponse: Codable {
    let success: Bool
    let data: FeedData?
    let errorMessage: String?
}

struct FeedData: Codable {
    let boardDTOs: [boardDTO]?
    let totalPages, pageNumber, size, totalElements: Int
    let last: Bool
}

struct boardDTO: Codable {
    let boardId: Int
    let stamp, text, date, name: String
    let memberId, likeCnt: Int
    let likeCheck: Bool
}

struct FeedContent: Identifiable, Equatable {
    var id = UUID()
    let boardId: Int
    let stamp, text, date, name: String
    let memberId: Int
    var likeCnt: Int
    var likeCheck: Bool
}
