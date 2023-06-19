//
//  BoardResponse.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/19.
//

import Foundation

struct BoardResponse: Codable {
    let success: Bool
    let data: BoardData?
    let errorMessage: String?
}

struct BoardData: Codable {
    let boardId: Int
    let stamp, text, date: String
}
