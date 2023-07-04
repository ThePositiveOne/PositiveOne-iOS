//
//  SettingViewModel.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/07/04.
//

import Foundation

class SettingViewModel: ObservableObject {
    
    func deleteUser() {
        Task {
            let response = try await deleteUser()
            Keychain.deleteToken()
            print(response)
        }
    }
    
    private func deleteUser() async throws -> PositiveOneResponse {
        return try await PositiveOneAPI.request(target: .deleteUser, dataType: PositiveOneResponse.self)
    }
    
}
