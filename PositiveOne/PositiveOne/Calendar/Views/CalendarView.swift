//
//  CalendarView.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/08.
//

import SwiftUI

struct CalendarView: View {
    
    @EnvironmentObject var calendarManager: CalendarManager
    @State var isPresentedWritingView = false
    @Binding var isPresentedLoginPopupView: Bool
    @Binding var isTabbarHidden: Bool
    @ObservedObject var viewModel = CalendarViewModel()
    @State var isRedraw = false
    let isLogin: Bool = Keychain.loadToken() != nil
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                ZStack {
                    VStack(spacing: 0) {
                        CalendarGridView(viewModel: viewModel, calendarDict: $viewModel.calendarDict).environmentObject(calendarManager)
                            .padding(.top, 30)
                        
                        
                        if let selectedDay = calendarManager.selectedDay(),
                           viewModel.calendarDict[selectedDay] != nil {
                            if let boardData = viewModel.boardData {
                                MyPositiveOneView(boardData: Binding.constant(boardData), viewModel: viewModel)
                                    .padding(.top, 10)
                            }
                        }
                        
                        else if calendarManager.isPastOfSelectedDate() {
                            HStack {
                                Spacer()
                                Button {
                                    isLogin ? isPresentedWritingView.toggle() : isPresentedLoginPopupView.toggle()
                                } label: {
                                    Image("writing")
                                }
                                .frame(width: 44, height: 44)
                                .fullScreenCover(isPresented: $isPresentedWritingView) {
                                    WritingView(boardId: nil, viewModel: WritingViewModel()).environmentObject(calendarManager)
                                }
                            }
                            .padding(.trailing, 20)
                            .padding(.top, 12)
                        }
                        Spacer()
                    }
                    
                } // ZStack
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
            .onReceive(NotificationCenter.default.publisher(for: Notification.Name.reloadCalendar)) { _ in
                calendarManager.selectedDate = nil
                viewModel.removeAllData()
                viewModel.getCalendar(date: calendarManager.monthAndYear() ?? "")
                isRedraw.toggle()
                
            }
            
            .onAppear {
                calendarManager.selectedDate = nil
                viewModel.getCalendar(date: CalendarManager().monthAndYear() ?? "")
                
            }
        }
    }
}



struct CalendarView_Previews: PreviewProvider {
    
    static var previews: some View {
        CalendarView(isPresentedLoginPopupView: .constant(true), isTabbarHidden: .constant(true), viewModel: CalendarViewModel())
            .environmentObject(CalendarManager())
    }
}
