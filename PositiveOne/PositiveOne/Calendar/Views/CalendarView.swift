//
//  CalendarView.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/08.
//

import SwiftUI

struct CalendarView: View {
    
    @EnvironmentObject var calendarManager: CalendarManager
    @State var isPresented = false
    
    var body: some View {
        
        NavigationStack {
            VStack(spacing: 0) {
                ZStack() {
                    MonthTopView().environmentObject(calendarManager)
                        .padding(.top, 10)
                        .padding(.horizontal, 32)
                    
                    NavigationLink {
                        SettingsView()
                    } label: {
                        Image("gear")
                    }
                    .offset(y: 3)
                    .padding(.leading, UIScreen.main.bounds.width*0.85)

                }
                .padding(.top, 6)
               
                
                CalendarGridView().environmentObject(calendarManager)
                    .padding(.top, 35)
                
    //            HStack {
    //                Spacer()
    //                Button {
    //                    isPresented.toggle()
    //                } label: {
    //                    Image("writing")
    //                }
    //                .frame(width: 44, height: 44)
    //                .fullScreenCover(isPresented: $isPresented) {
    //                    WritingView()
    //                }
    //            }
    //            .padding(.trailing, 20)
    //            .padding(.top, 12)
                
                MyPositiveOneView()
                    .padding(.top, 35)
                
                Spacer()
            }
        }
    }
}



struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView().environmentObject(CalendarManager())
    }
}
