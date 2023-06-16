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
    @Binding var isTabbarHidden: Bool
    let isToday = false
    var body: some View {
        
        NavigationStack {
            VStack(spacing: 0) {
                
                CalendarGridView().environmentObject(calendarManager)
                    .padding(.top, 30)
                
                if isToday {
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
                } else {
                    MyPositiveOneView()
                        .padding(.top, 35)
                }
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                   MonthTopView()
                }
            }
           
            .toolbar {
                ToolbarItem {
                    NavigationLink(
                        destination: SettingsView(isTabbarHidden: $isTabbarHidden)
                    ) {
                        Image("gear")
                            .foregroundColor(Color.Custom.Black70)
                            .offset(x: -3)
                    }
                    
                }
            }
        }
    }
}



//struct CalendarView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        CalendarView().environmentObject(CalendarManager())
//    }
//}
