//
//  SettingsView.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/13.
//

import SwiftUI

struct SettingsView: View {
    
    init() {
        
    }
    
    var body: some View {
        
        List {
            Text("로그인")
                .foregroundColor(.Custom.Black70)
                .font(CustomFont.PretendardMedium(size: 16).font)
            Text("이용약관")
                .foregroundColor(.Custom.Black70)
                .font(CustomFont.PretendardMedium(size: 16).font)
            Text("개인정보 정책")
                .foregroundColor(.Custom.Black70)
                .font(CustomFont.PretendardMedium(size: 16).font)
        }
        .listStyle(PlainListStyle())
        //.toolbar(.hidden, for: .tabBar)
        .navigationTitle("설정")
        .scrollContentBackground(.hidden)
        .background(.white)
        .frame(width: UIScreen.main.bounds.width-40)
        .padding(.leading, -20)
        .padding(.top, 20)
        
    }
    
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
