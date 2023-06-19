//
//  CalendarGridView.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/15.
//

import SwiftUI

struct CalendarGridView: View {
    
    @EnvironmentObject var calendarManager: CalendarManager
    @ObservedObject var viewModel: CalendarViewModel
    let weekNames: [String] = ["S", "M", "T", "W", "T", "F", "S"]
    let width = UIScreen.main.bounds.width
    @Binding var calendarDict: [Int: (boardId: Int, type: PositiveOneType)]
    
    var body: some View {
        
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                ForEach(weekNames, id: \.self) { weekday in
                    Text(weekday)
                        .font(CustomFont.PretendardBold(size: 14).font)
                        .foregroundColor(.Custom.Black70)
                }
                .frame(width: (width-40-10)/7)
            }
            
            daysView
                .padding(.vertical, 17)
                .background(Color.Custom.YellowShadow50)
                .padding(.top, 10)
                .cornerRadius(4)
        }
        
    }
    
    var daysView: some View {
        VStack(spacing: 5) {
            let currentMonthTotalDays = calendarManager.totalDaysInMonth()
            let indexOfFirstDayWeek = calendarManager.indexOfFirstDayWeek()
            let dayNums = Array(-indexOfFirstDayWeek+1...42)
            let isFiveLine  =
            (calendarManager.totalDaysInMonth() + calendarManager.indexOfFirstDayWeek()) <= 35
            ? true : false
           
            ForEach(0..<6) { row in
                if (isFiveLine && row != 5) || !isFiveLine {
                    HStack(spacing: (width-40)*0.034) {
                        ForEach(0..<7) { column in
                            let dayNum = dayNums[(row*7)+column]
                            if dayNum > 0 && dayNum <= currentMonthTotalDays {
                                if let data = calendarDict[dayNum] {
                                    CalendarCell(
                                        viewModel: viewModel,
                                        day: dayNum,
                                        positiveOneType: data.type,
                                        isContainMonth: true,
                                        boardId: data.boardId
                                    )
                                } else {
                                    CalendarCell(
                                        viewModel: viewModel,
                                        day: dayNum,
                                        positiveOneType: nil,
                                        isContainMonth: true,
                                        boardId: nil
                                    )
                                }
                            
                            } else {
                                CalendarCell(
                                    viewModel: viewModel,
                                    day: dayNum,
                                    positiveOneType: nil,
                                    isContainMonth: false,
                                    boardId: nil
                                )
                            }
                        }
                    }
                    .frame(width: width-40)
                }
                
            }
        }
    }
    
}

//struct CalendarGridView_Previews: PreviewProvider {
//    static var previews: some View {
//        CalendarGridView(calendarDict: [:]).environmentObject(CalendarManager())
//    }
//}
