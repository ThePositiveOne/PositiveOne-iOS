//
//  CalendarView.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/08.
//

import SwiftUI

struct CalendarView: View {
    
    @EnvironmentObject var calendarManager: CalendarManager
    let weekNames: [String] = ["S", "M", "T", "W", "T", "F", "S"]
    let width = UIScreen.main.bounds.width
    let totalDays = CalendarManager().totalDaysInMonth()
    var dayNum = 1
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                MonthTopView()
                    .padding(.top, 24)
                HStack(spacing: 0) {
                    ForEach(weekNames, id: \.self) { weekday in
                        Text(weekday)
                            .font(CustomFont.PretendardBold(size: 14).font)
                            .foregroundColor(.Custom.Black70)
                    }
                    .frame(width: (width-40-10)/7)
                }
                .padding(.top, 35)
                
                ZStack {
                    daysView
                        .frame(width: width-40, height: width-10)
                }
                .frame(width: width-40, height: width-10)
                .background(Color.Custom.YellowShadow50)
                .cornerRadius(4)
                Spacer()
            }
        }
        .navigationTitle("haha")
    }
    
    var daysView: some View {
        VStack(spacing: 6) {
            ForEach(0..<6) { row in
                HStack(spacing: (width-40)*0.034) {
                    ForEach(0..<7) { column in
                        CalendarCell(day: dayNum, isToday: false, isWritten: false, isContainMonth: true)
                    }
                }
                .frame(width: width-40)
            }
        }
        .frame(width: width-40, height: width-10)
    }
}



struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
