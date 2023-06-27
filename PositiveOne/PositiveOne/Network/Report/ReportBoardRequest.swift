//
//  ReportBoardRequest.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/27.
//

import Foundation

struct ReportBoardRequest: Codable {
    let reportBoardId: Int
    let reportReason: String
}
