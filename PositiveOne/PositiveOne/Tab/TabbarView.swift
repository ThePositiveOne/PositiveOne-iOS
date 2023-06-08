//
//  TabView.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/08.
//

import SwiftUI

struct TabbarView: View {
    
    init() {
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.init(name: "Pretendard-SemiBold", size: 14)! ], for: .normal)
    }
    
    var body: some View {
        TabView {
            CalendarView()
                .tabItem {
                    Image("calendarSelected")
                        .renderingMode(.template)
                    Text("캘린더")
                }
            
            Text("피드")
                .tabItem {
                    Image("feedUnSelected")
                       .renderingMode(.template)
                    Text("피드")
                        .font(Font.system(size: 18, weight: .bold))
                }
        }
        .accentColor(.Custom.PositiveYellow)
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
