//
//  CalendarViewModel.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/18.
//

import Foundation

class CalendarViewModel: ObservableObject {
    
    @Published var calendarListResponse: CalendarListResponse?
    
    func getCalendar(date: String) {
        Task {
            let response = try await fetchCalendar(date: date)
            print(response)
        }
    }
    
    func fetchCalendar(date: String) async throws -> CalendarListResponse {
        return try await PositiveOneAPI.request(target: .getCalendar(date: date), dataType: CalendarListResponse.self)
    }
   
    
}
