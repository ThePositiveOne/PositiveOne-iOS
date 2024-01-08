//
//  CustomTabView.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/16.
//

import SwiftUI
import FirebaseAnalytics

enum Tab {
    case calendar
    case feed
}

struct CustomTabView: View {
    
    @Binding var selectedTab: Tab

    var body: some View {
        HStack(alignment: .center) {
    
            Button {
                selectedTab = .calendar
            } label: {
                VStack(spacing: 8) {
                    Image(selectedTab == .calendar ? "calendarSelected" : "calendarUnSelected")
                    
                    Text("캘린더")
                        .foregroundColor(selectedTab == .calendar ? .Custom.PositiveYellow : .Custom.Black60)
                        .font(CustomFont.PretendardSemiBold(size: 14).font)
                }
                .offset(x: -10)
            }
            .padding(.horizontal, UIScreen.main.bounds.width/4 - 30)
            
           
            
            Button {
                selectedTab = .feed
                Analytics.logEvent("feed_tab", parameters: nil)
            } label: {
                VStack(spacing: 8) {
                    Image(selectedTab == .feed ? "feedSelected" : "feedUnSelected")
                    
                    Text("피드")
                        .foregroundColor(selectedTab == .feed ? .Custom.PositiveYellow : .Custom.Black60)
                        .font(CustomFont.PretendardSemiBold(size: 14).font)
                }
                .offset(x: 10)
            }
            .padding(.horizontal, UIScreen.main.bounds.width/4 - 30)
        }
        .frame(width: UIScreen.main.bounds.width, height: 85)
    }
}


struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView(selectedTab: .constant(.calendar))
    }
}

