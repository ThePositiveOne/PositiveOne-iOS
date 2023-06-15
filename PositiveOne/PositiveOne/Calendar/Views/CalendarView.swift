//
//  CalendarView.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/08.
//

import SwiftUI

struct CalendarView: View {
    
    @EnvironmentObject var calendarManager: CalendarManager
   
    var body: some View {
        
        VStack(spacing: 0) {
            MonthTopView().environmentObject(calendarManager)
                .padding(.top, 70)
                .padding(.horizontal, 32)
            
            CalendarGridView().environmentObject(calendarManager)
        }
    }
}



struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView().environmentObject(CalendarManager())
    }
}
