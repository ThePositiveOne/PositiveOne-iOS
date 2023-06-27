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
    let isLogin: Bool = Keychain.loadToken() != nil
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                VStack(spacing: 0) {
                    CalendarGridView(viewModel: viewModel, calendarDict: $viewModel.calendarDict).environmentObject(calendarManager)
                        .padding(.top, 30)
                    
                    if calendarManager.isPastOfSelectedDate() && viewModel.boardData == nil {
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
                    } else {
                        if let boardData = viewModel.boardData {
                            MyPositiveOneView(boardData: Binding.constant(boardData))
                                .padding(.top, 35)
                        }
                        
                    }
                    Spacer()
                }
     
            } // ZStack
           
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
        CalendarView(isPresentedLoginPopupView: .constant(true), isTabbarHidden: .constant(true), viewModel: CalendarViewModel())
            .environmentObject(CalendarManager())
    }
}
