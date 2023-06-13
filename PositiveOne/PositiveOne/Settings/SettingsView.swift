//
//  SettingsView.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/13.
//

import SwiftUI

struct SettingsView: View {
    
    init() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = UIColor(Color.white)
        navBarAppearance.titleTextAttributes = [.font : UIFont(name: "GangwonEduPowerExtraBold", size: 20)!]
        navBarAppearance.shadowColor = .clear
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().standardAppearance = navBarAppearance
    }
    
    var body: some View {
        NavigationView {
            List {
                Text("로그인")
                    .foregroundColor(.Custom.Black70)
                    .font(CustomFont.PretendardMedium(size: 16).font)
                    .listRowInsets(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: -20))
                Text("이용약관")
                    .foregroundColor(.Custom.Black70)
                    .font(CustomFont.PretendardMedium(size: 16).font)
                Text("개인정보 정책")
                    .foregroundColor(.Custom.Black70)
                    .font(CustomFont.PretendardMedium(size: 16).font)
            }
            .listRowInsets(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 30))
            .listStyle(PlainListStyle())
            
            .toolbar(.hidden, for: .tabBar)
            .scrollContentBackground(.hidden)
            .background(.white)
            .frame(width: UIScreen.main.bounds.width-40)
            .padding(.leading, -20)
            .navigationTitle("설정")
        }
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
