//
//  MonthTopView.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/08.
//

import SwiftUI

struct MonthTopView: View {
    @EnvironmentObject var dateManager: CalendarManager
    
    var currentYearAndMonth: String {
        let components = Calendar.current.dateComponents([.year, .month], from: dateManager.date)
        let year = components.year ?? 2023
        let month = components.month ?? 0
        
      
        return "\(year).\(getMonthToEnglishName(month))"
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 18) {
            Button {
               dateManager.fetchPreviousMonth()
            } label: {
                Image(systemName: "chevron.left").foregroundColor(Color.Custom.Black70)
            }
            
           
            
            Text(currentYearAndMonth)
                .font(CustomFont.gangwon(size: 20).font)
               // .padding(.horizontal, 20)
           
            
            Button {
               dateManager.fetchNextMonth()
            } label: {
                Image(systemName: "chevron.right").foregroundColor(Color.Custom.Black70)
            }
            
            
        }
    }
}


extension MonthTopView {
    func getMonthToEnglishName(_ month: Int) -> String {
        switch month {
        case 1:
            return "JAN"
        case 2:
            return "FEB"
        case 3:
            return "MAR"
        case 4:
            return "APR"
        case 5:
            return "MAY"
        case 6:
            return "JUN"
        case 7:
            return "JUL"
        case 8:
            return "AUG"
        case 9:
            return "SEP"
        case 10:
            return "OCT"
        case 11:
            return "NOV"
        case 12:
            return "DEC"
        default:
            return "nil"
        }
    }
}

struct MonthTopView_Previews: PreviewProvider {
    static var previews: some View {
        MonthTopView().environmentObject(CalendarManager())
    }
}
