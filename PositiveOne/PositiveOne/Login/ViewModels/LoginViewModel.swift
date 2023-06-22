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
    @Published var isLoginSuccess: Bool = false
    
    func postAppleLogin(_ request: AppleLoginRequest) {
        Task {
            let response = try await requestAppleLogin(request)
            print("response \(response)")
            guard let jwt = response.data?.token else {
                return
            }
            print("jwt")
            print(jwt)
            UserDefaults.standard.write(key: .userIdentifier, value: request.identityToken)
            Keychain.saveToken(data: jwt)
            DispatchQueue.main.async {
                self.isLoginSuccess = true
            }
        }
    }
    
    func requestAppleLogin(_ request: AppleLoginRequest) async throws -> AppleLoginResponse {
        return try await PositiveOneAPI.request(target: .signInApple(paramters: request.asDictionary()), dataType: AppleLoginResponse.self)
        
    }
    
}
