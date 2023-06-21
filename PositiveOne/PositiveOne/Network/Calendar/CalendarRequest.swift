//
//  CalendarResponse.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/18.
//

import Foundation

struct CalendarRequest: Encodable {
    let text: String
    let stamp: String
    let secret: Bool
}
