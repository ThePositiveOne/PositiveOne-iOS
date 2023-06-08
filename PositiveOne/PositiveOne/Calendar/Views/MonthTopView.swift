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
        let year = components.year
        let month = components.month
        
        return "\(year!)년 \(month!)월"
    }
    
    var body: some View {
        HStack(alignment: .center) {
            Button {
               // dateManager.fetchPreviousMonth()
            } label: {
                Image(systemName: "chevron.left").foregroundColor(Color.Custom.Black70)
            }
            
            Text("2023 MAY")
                .font(CustomFont.gangwon(size: 20).font)
                .padding(.horizontal, 20)
            
            Button {
               // dateManager.fetchNextMonth()
            } label: {
                Image(systemName: "chevron.right").foregroundColor(Color.Custom.Black70)
            }
            
            
        }
    }
}

struct MonthTopView_Previews: PreviewProvider {
    static var previews: some View {
        MonthTopView()
    }
}
