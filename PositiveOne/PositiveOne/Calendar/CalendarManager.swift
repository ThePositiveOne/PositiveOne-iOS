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
        guard let previousMonth = getPreviousMonth() else { return }
        date = previousMonth
    }
    
    func fetchNextMonth() {
        guard let nextMonth = getNextMonth() else { return }
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
    func getNextMonth() -> Date? {
        guard let changedMonth = Calendar.current.date(byAdding: .month, value: 1, to: date)
        else { return nil }
        
        return changedMonth
    }
    
    // 1개월을 차감합니다.
    func getPreviousMonth() -> Date? {
        guard let changedMonth = Calendar.current.date(byAdding: .month, value: -1, to: date)
        else { return nil }
        
        return changedMonth
    }
    
    // 해당월의 일 수를 Int(Optional)형으로 반환합니다.
    func totalDaysInMonth() -> Int {
        guard let range = calendar.range(of: .day, in: .month, for: date) else {
            return 0
        }
        return range.count
    }
    
    func dayOfMonth(_ date: Date) -> Int? {
        let components = calendar.dateComponents([.day], from: date)
        guard let day = components.day else { return nil }
        return day
    }
    
    func indexOfFirstDayWeek() -> Int {
        let yearMonthcomponents = calendar.dateComponents([.year, .month], from: date)
        guard let theFirstDayOfMonth = calendar.date(from: yearMonthcomponents) else {
            return 0
        }
        let weekDaycomponents = calendar.dateComponents([.weekday], from: theFirstDayOfMonth)
        guard let weekday = weekDaycomponents.weekday else {
            return 0
        }
        return weekday - 1
    }
    
    func monthAndYear() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM"
        return "\(dateFormatter.string(from: date))"
    }
    
}
