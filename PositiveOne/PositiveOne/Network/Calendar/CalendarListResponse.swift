//
//  CalendarListResponse.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/18.
//

import Foundation

struct CalendarListResponse: Decodable {
    let success: Bool
    let errorMessage: String?
    let data: [CalendarListData]?
}

struct CalendarListData: Decodable {
    let boardId: Int
    let stamp: String
    let date: String
}
