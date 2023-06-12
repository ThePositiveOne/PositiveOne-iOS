//
//  AppleLoginResponse.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/12.
//

import Foundation

struct AppleLoginResponse: Decodable {
    let responseCode: Int
    let success: Bool
}
