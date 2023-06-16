//
//  TabView.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/08.
//

import SwiftUI

struct TabbarView: View {
    
    @State var selectedTab: Tab = .feed
    
    var body: some View {
        
        VStack(spacing: 0) {
            switch selectedTab {
            case .calendar:
                CalendarView()
                    .environmentObject(CalendarManager())
            case .feed:
                FeedView()
            }
            CustomTabView(selectedTab: $selectedTab)
                .padding(.bottom, 15)
        }
        .edgesIgnoringSafeArea(.bottom)

    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
