//
//  CalendarViewModel.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/18.
//

import Foundation
import SwiftUI

class CalendarViewModel: ObservableObject {
    
    // @Published var calendarList: [CalendarListData]?
    var calendarDict: [Int: (boardId: Int, type: PositiveOneType)] = [:]
    
    func getCalendar(date: String) {
        Task {
            let response = try await fetchCalendar(date: date)
            if response.success {
                //calendarDict = [:]
                self.getcalendarDict(response.data)
                
                
            }
        }
        
    }
    
    func fetchCalendar(date: String) async throws -> CalendarListResponse {
        return try await PositiveOneAPI.request(target: .getCalendar(date: date), dataType: CalendarListResponse.self)
    }
    
    func getcalendarDict(_ calendarList: [CalendarListData]?) {
        if let calendarList = calendarList {
            calendarList.forEach { data in
                calendarDict[Int(data.date) ?? Int.min] = (data.boardId, PositiveOneType(rawValue: data.stamp) ?? .excitingOne)
            }
        }
    }
    
    
}
