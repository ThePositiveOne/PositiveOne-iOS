//
//  CalendarGridView.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/15.
//

import SwiftUI

struct CalendarGridView: View {
    
    @EnvironmentObject var calendarManager: CalendarManager
    @State var isPresented = false
    let weekNames: [String] = ["S", "M", "T", "W", "T", "F", "S"]
    let width = UIScreen.main.bounds.width
   
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
            .padding(.top, 35)
            
            ZStack {
                daysView
                    .frame(width: width-40, height: width-10)
            }
            .frame(width: width-40, height: width+10)
            .background(Color.Custom.YellowShadow50)
            .cornerRadius(4)
            .padding(.top, 8)
            
            HStack {
                Spacer()
                Button {
                    isPresented.toggle()
                } label: {
                    Image("writing")
                }
                .frame(width: 44, height: 44)
                .fullScreenCover(isPresented: $isPresented) {
                    WritingView()
                }
            }
            .padding(.trailing, 20)
            .padding(.top, 12)
            

            Spacer()
        }
        
    }
    
    var daysView: some View {
        VStack(spacing: 6) {
            let currentMonthTotalDays = calendarManager.totalDaysInMonth()
            let indexOfFirstDayWeek = calendarManager.indexOfFirstDayWeek()
            let dayNums = Array(-indexOfFirstDayWeek+1...42)
            
            ForEach(0..<6) { row in
                HStack(spacing: (width-40)*0.034) {
                    ForEach(0..<7) { column in
                        let dayNum = dayNums[(row*7)+column]
                        if dayNum > 0 && dayNum <= currentMonthTotalDays {
                            CalendarCell(day: dayNum, isToday: false, isWritten: false, isContainMonth: true)
                        } else {
                            CalendarCell(day: dayNum, isToday: false, isWritten: false, isContainMonth: false)
                        }
                    }
                }
                .frame(width: width-40)
            }
        }
        .frame(width: width-40, height: width-10)
        .padding(.top, 19)
    }
    
}

struct CalendarGridView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarGridView().environmentObject(CalendarManager())
    }
}