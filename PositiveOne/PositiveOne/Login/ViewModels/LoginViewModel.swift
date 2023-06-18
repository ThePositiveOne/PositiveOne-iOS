//
//  LoginViewModel.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/09.
//

import Foundation
import AuthenticationServices
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var loginResponse: AppleLoginResponse?
    
    func postAppleLogin(_ request: AppleLoginRequest) {
        Task {
            let response = try await requestAppleLogin(request)
            print("response \(response)")
        }
    }
    
    func requestAppleLogin(_ request: AppleLoginRequest) async throws -> AppleLoginResponse {
        return try await PositiveOneAPI.request(target: .signInApple(paramters: request.asDictionary()), dataType: AppleLoginResponse.self)
        
    }
    
}
