//
//  ContentView.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/04.
//

import SwiftUI

struct ContentView: View {
    let isLogin: Bool = Keychain.loadToken() != nil
    var body: some View {
        VStack {
            // 자동로그인
            if isLogin {
                TabbarView()
            } else {
                LoginView()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
