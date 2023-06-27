//
//  ReportUserRequest.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/27.
//

import Foundation

struct ReportUserRequest: Codable {
    let reportMemberId: Int
    let reportReason: String
}
