//
//  CalendarManager.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/08.
//

import Foundation

final class CalendarManager: ObservableObject {
    @Published var date: Date = Date()
    @Published var selectedDate: Date = Date()
    let calendar = Calendar.current
    
    func fetchPreviousMonth() {
        guard let previousMonth = getPreviousMonth(date) else { return }
        date = previousMonth
    }
    
    func fetchNextMonth() {
        guard let nextMonth = getNextMonth(date) else { return }
        date = nextMonth
    }
    
    func fetchCurrentDate() {
        date = Date()
    }
    
    func updateSelectedDate(_ selectedDay: Int) {
        let originalDay = Calendar.current.dateComponents([.day], from: date).day!
        guard let changedDate = Calendar.current.date(byAdding: .day, value: selectedDay - originalDay, to: date) else { return }

        self.selectedDate = changedDate
    }
    
    func verifyFutureDate(_ today: Int) -> Bool {
        let globalDate: Date = Date()
        let componentsOfGlobalDate = Calendar.current.dateComponents([.year, .month, .day], from: globalDate)
        let componentsOfCurrentDate = Calendar.current.dateComponents([.year, .month, .day], from: date)
        
        // 미래 연도의 경우 모든 경우의 수를 true로 반환합니다.
        if componentsOfCurrentDate.year! > componentsOfGlobalDate.year! { return true } // 미래 연도

        // 동일 연도의 경우 미래 월인 경우는 항상 true를, 같은 달의 경우 미래 일을 true로 반환합니다.
        if componentsOfCurrentDate.year! == componentsOfGlobalDate.year! {
            if componentsOfCurrentDate.month! > componentsOfGlobalDate.month! { return true } // 미래 월
            if componentsOfCurrentDate.month! == componentsOfGlobalDate.month! && today > componentsOfGlobalDate.day! { return true }// 동월 내 미래 일
        }
        
        return false
    }
    
    func verifySelectedDay(_ today: Int) -> Bool {
        let currentYear = Calendar.current.dateComponents([.year], from: date).year!
        let currentMonth = Calendar.current.dateComponents([.month], from: date).month!
        let selectedYear = Calendar.current.dateComponents([.year], from: selectedDate).year!
        let selectedMonth = Calendar.current.dateComponents([.month], from: selectedDate).month!
        let selectedDay = Calendar.current.dateComponents([.day], from: selectedDate).day!

        if currentYear == selectedYear &&
           currentMonth == selectedMonth &&
           selectedDay == today {
             return true
        }
        
        return false
    }

}

extension CalendarManager {
    
    // 1개월을 증가시킵니다.
    func getNextMonth(_ date: Date) -> Date? {
        guard let changedMonth = Calendar.current.date(byAdding: .month, value: 1, to: date)
        else { return nil }

        return changedMonth
    }

    // 1개월을 차감합니다.
    func getPreviousMonth(_ date: Date) -> Date? {
        guard let changedMonth = Calendar.current.date(byAdding: .month, value: -1, to: date)
        else { return nil }
        
        return changedMonth
    }

    // 해당월의 일 수를 Int(Optional)형으로 반환합니다.
    func totalDaysInMonth() -> Int? {
        guard let range = calendar.range(of: .day, in: .month, for: date) else { return nil }
        return range.count
    }
    
    func dayOfMonth(_ date: Date) -> Int? {
        let components = calendar.dateComponents([.day], from: date)
        guard let day = components.day else { return nil }
        return day
    }
    
    func theFirstDayOfMonth(_ date: Date) -> Date? {
        let components = calendar.dateComponents([.year, .month], from: date)
        guard let date = calendar.date(from: components) else { return nil }
        return date
    }
    
    func weekDay(_ date: Date) -> Int? {
        let components = calendar.dateComponents([.weekday], from: date)
        guard let weekday = components.weekday else { return nil }
        return weekday - 1
    }
    
}
