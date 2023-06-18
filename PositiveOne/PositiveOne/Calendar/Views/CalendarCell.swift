//
//  CalendarCell.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/08.
//

import SwiftUI

struct CalendarCell: View {
    
    @EnvironmentObject var calendarManager: CalendarManager
    let day: Int
    let positiveOneType: PositiveOneType?
    let isContainMonth: Bool
    let boardId: Int?
    
    var body: some View {
        if isContainMonth {
            VStack(spacing: 6) {
                ZStack {
                    Circle()
                        .frame(width: 33, height: 33)
                        .foregroundColor(.Custom.YellowShadow)
                    
                    if let positiveOneType {
                        Image(positiveOneType.rawValue)
                            .resizable()
                            .frame(width: 37, height: 37)
                    }
                    
                }
                
                Text(String(day))
                    .foregroundColor(calendarManager.verifySelectedDay(day) ? .white : Color.Custom.Black60)
                    .font(CustomFont.PretendardRegular(size: 10).font)
                    .frame(width: 25, height: 13)
                    .background(calendarManager.verifySelectedDay(day) ? Color.Custom.PositiveYellow : .clear)
                    .cornerRadius(2)
            }
            .frame(width: 37, height: 56)
            .onTapGesture {
                calendarManager.updateSelectedDate(day)
            }

        }
        
        else {
           Text("")
            .frame(width: 37, height: 56)
            .background(.clear)
        }
       
    }
}

struct CalendarCell_Previews: PreviewProvider {
    static var previews: some View {
        CalendarCell(
            day: 5,
            positiveOneType: .excitingOne ,
            isContainMonth: true,
            boardId: nil
        )
        .environmentObject(CalendarManager())
    }
}
