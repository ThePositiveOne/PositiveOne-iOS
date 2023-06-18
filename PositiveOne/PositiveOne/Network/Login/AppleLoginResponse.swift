//
//  AppleLoginResponse.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/12.
//

import Foundation

struct AppleLoginResponse: Decodable {
    let success: Bool
    let errorMessage: String?
    let data: TokenData?
}

struct TokenData: Decodable {
    let token: String
}
