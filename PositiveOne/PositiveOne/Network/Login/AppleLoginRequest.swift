//
//  AppleLoginRequest.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/09.
//

import Foundation

struct AppleLoginRequest: Encodable {
    let identityToken: String
    let authorization_code: String
}
