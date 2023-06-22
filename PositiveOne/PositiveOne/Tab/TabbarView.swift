//
//  TabView.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/08.
//

import SwiftUI

struct TabbarView: View {
    
    @State var selectedTab: Tab = .calendar
    @State var isTabbarHidden: Bool = false
    @State var isPresentedLoginPopupView: Bool = false
    
    var body: some View {
        
        ZStack {
            VStack(spacing: 0) {
                switch selectedTab {
                case .calendar:
                    CalendarView(isPresentedLoginPopupView: $isPresentedLoginPopupView, isTabbarHidden: $isTabbarHidden, viewModel: CalendarViewModel())
                        .environmentObject(CalendarManager())
                case .feed:
                    FeedView(isTabbarHidden: $isTabbarHidden, isPresentedLoginPopupView: $isPresentedLoginPopupView)
                }
                
                if !isTabbarHidden {
                    CustomTabView(selectedTab: $selectedTab)
                        .padding(.bottom, 15)
                }
                
            }
            .edgesIgnoringSafeArea(.bottom)
            
            VStack {
                
            }
            .frame(
                  minWidth: 0,
                  maxWidth: .infinity,
                  minHeight: 0,
                  maxHeight: .infinity,
                  alignment: .center
                )
            .background(Color.black.opacity(isPresentedLoginPopupView ? 0.5 : 0))
            
            .fullScreenCover(isPresented: $isPresentedLoginPopupView) {
                LoginPopupView()
                    .clearModalBackground()
            }
        }
        

    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
