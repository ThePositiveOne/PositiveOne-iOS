//
//  WritingViewModel.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/18.
//

import Foundation

class WritingViewModel: ObservableObject {
    
    func postBoard(request: CalendarRequest) {
        Task {
            let response = try await postBoard(request: request)
            print(response)
        }
    }
   
    private func postBoard(request: CalendarRequest) async throws -> PositiveOneResponse {
        return try await PositiveOneAPI.request(target: .postBoard(parameters: request.asDictionary()), dataType: PositiveOneResponse.self)
    }
    
}
