//
//  CalendarViewModel.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/18.
//

import Foundation
import SwiftUI

class CalendarViewModel: ObservableObject {
    
    @Published var calendarDict: [Int: (boardId: Int, type: PositiveOneType)] = [:]
    @Published var boardData: BoardData?
    @EnvironmentObject var calendarManager: CalendarManager
    
    init(boardData: BoardData? = nil) {
        self.boardData = boardData
        getCalendar(date: CalendarManager().monthAndYear() ?? "")
    }
 
    func getCalendar(date: String) {
        Task {
            let response = try await fetchCalendar(date: date)
            if response.success {
                self.getcalendarDict(response.data)
            }
        }
        
    }
    
    func getBoard(boardId: Int) {
        Task {
            let response = try await getBoard(boardId: boardId)
            if response.success {
                DispatchQueue.main.async { [weak self] in
                    self?.boardData = response.data
                }
            }
        }
    }
    
    func deleteBoard(boardId: Int) {
        Task {
            let response = try await deleteBoard(boardId: boardId)
            print(response)
        }
    }
    
    private func fetchCalendar(date: String) async throws -> CalendarListResponse {
        return try await PositiveOneAPI.request(target: .getCalendar(date: date), dataType: CalendarListResponse.self)
    }
    
    private func getBoard(boardId: Int) async throws -> BoardResponse {
        return try await PositiveOneAPI.request(target: .getBoard(boardId: boardId), dataType: BoardResponse.self)
    }
    
    private func deleteBoard(boardId: Int) async throws -> PositiveOneResponse {
        return try await PositiveOneAPI.request(target: .deleteBoard(boardId: boardId), dataType: PositiveOneResponse.self)
    }
    
    func getcalendarDict(_ calendarList: [CalendarListData]?) {
        DispatchQueue.main.async { [weak self] in
            if let calendarList = calendarList {
                calendarList.forEach { data in
                    self?.calendarDict[Int(data.date) ?? Int.min] = (data.boardId, PositiveOneType(rawValue: data.stamp) ?? .excitingOne)
                }
            }
        }
    }
    
    func removeAllData() {
        calendarDict = [:]
        boardData = nil
    }
    
}
