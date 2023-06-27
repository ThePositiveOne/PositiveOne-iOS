//
//  CalendarCell.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/08.
//

import SwiftUI

struct CalendarCell: View {
    
    @EnvironmentObject var calendarManager: CalendarManager
    @ObservedObject var viewModel: CalendarViewModel
    
    let day: Int
    let positiveOneType: PositiveOneType?
    let isContainMonth: Bool
    let boardId: Int?
    let size = (UIScreen.main.bounds.width-40-6*7)/7
    
    var body: some View {
        if isContainMonth {
            VStack(spacing: 6) {
                ZStack {
                    Circle()
                        .frame(width: size, height: size)
                        .foregroundColor(.Custom.YellowShadow)
                    
                    if let positiveOneType {
                        Image(positiveOneType.rawValue)
                            .resizable()
                            .frame(width: size, height: size)
                    }
                    
                }
                
                Text(String(day))
                    .foregroundColor(calendarManager.verifySelectedDay(day) ? .white : Color.Custom.Black60)
                    .font(CustomFont.PretendardRegular(size: 10).font)
                    .frame(width: 25, height: 13)
                    .background(calendarManager.verifySelectedDay(day) ? Color.Custom.PositiveYellow : .clear)
                    .cornerRadius(2)
            }
            .frame(width: size, height: size+18)
            .onTapGesture {
                HapticManager.instance.impact(style: .light)
                calendarManager.updateSelectedDate(day)
                guard let boardId else {
                    viewModel.boardData = nil
                    return
                }
                viewModel.getBoard(boardId: boardId)
            }

        }
        
        else {
           Text("")
                .frame(width: size, height: size+18)
            .background(.clear)
        }
       
    }
}

struct CalendarCell_Previews: PreviewProvider {
    static var previews: some View {
        CalendarCell(
            viewModel: CalendarViewModel(),
            day: 5,
            positiveOneType: .excitingOne ,
            isContainMonth: true,
            boardId: nil
        )
        .environmentObject(CalendarManager())
    }
}
