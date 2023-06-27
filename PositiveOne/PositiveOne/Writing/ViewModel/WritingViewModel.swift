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
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: .reloadCalendar, object: nil)
            }
        }
    }
    
    func putBoard(boardId: Int, request: CalendarRequest) {
        Task {
            let response = try await postBoard(request: request)
            print(response)
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: .reloadCalendar, object: nil)
            }
        }
    }
   
    private func postBoard(request: CalendarRequest) async throws -> PositiveOneResponse {
        return try await PositiveOneAPI.request(target: .postBoard(parameters: request.asDictionary()), dataType: PositiveOneResponse.self)
    }
    
    private func putBoard(boardId: Int, request: CalendarRequest) async throws -> PositiveOneResponse {
        return try await PositiveOneAPI.request(target: .putBoard(boardId: boardId, parameters: request.asDictionary()), dataType: PositiveOneResponse.self)
    }
    
}
