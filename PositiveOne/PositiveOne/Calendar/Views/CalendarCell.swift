//
//  CalendarCell.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/08.
//

import SwiftUI

struct CalendarCell: View {
    
    let day: Int
    var isToday: Bool
    var isWritten: Bool
    var isContainMonth: Bool
    
    var body: some View {
        if isContainMonth {
            VStack {
                ZStack {
                    Circle()
                        .frame(width: 33, height: 33)
                        .foregroundColor(.Custom.YellowShadow)
                    
                    if isWritten {
                        Image("pleasureOne")
                            .frame(width: 37, height: 37)
                    }
                    
                }
                
                Text(String(day))
                    .foregroundColor(isToday ? .white : Color.Custom.Black60)
                    .font(CustomFont.PretendardRegular(size: 10).font)
                    .frame(width: 25, height: 13)
                    .background(isToday ? Color.Custom.PositiveYellow : .clear)
                    .cornerRadius(2)
            }
            .frame(width: 37, height: 56)

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
            isToday: true,
            isWritten: true,
            isContainMonth: true
        )
    }
}
