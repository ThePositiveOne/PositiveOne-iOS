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
    @ObservedObject var viewModel: CalendarViewModel
    
    init(calendarManager: CalendarManager = CalendarManager(), isPresented: Bool = false, isTabbarHidden: Bool, viewModel: CalendarViewModel) {
        self._isPresented = State(initialValue: isPresented)
        self._isTabbarHidden = Binding.constant(isTabbarHidden)
        self.viewModel = viewModel
        viewModel.getCalendar(date: calendarManager.monthAndYear() ?? "")
    }
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                VStack(spacing: 0) {
                    CalendarGridView(viewModel: viewModel, calendarDict: $viewModel.calendarDict).environmentObject(calendarManager)
                        .padding(.top, 30)
                    
                    if calendarManager.isTodayOfSelectedDay() && viewModel.boardData == nil {
                        HStack {
                            Spacer()
                            Button {
                                isPresented.toggle()
                            } label: {
                                Image("writing")
                            }
                            .frame(width: 44, height: 44)
                            .fullScreenCover(isPresented: $isPresented) {
                                WritingView(boardId: nil, viewModel: WritingViewModel())
                            }
                        }
                        .padding(.trailing, 20)
                        .padding(.top, 12)
                    } else {
                        if let boardData = viewModel.boardData {
                            MyPositiveOneView(boardData: Binding.constant(boardData))
                                .padding(.top, 35)
                        }
                        
                    }
                    Spacer()
                }
                
     
            }
            
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    MonthTopView(viewModel: viewModel)
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



struct CalendarView_Previews: PreviewProvider {

    static var previews: some View {
        CalendarView(isTabbarHidden: true, viewModel: CalendarViewModel())
            .environmentObject(CalendarManager())
    }
}
