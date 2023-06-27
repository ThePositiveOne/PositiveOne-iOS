//
//  ContentView.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/04.
//

import SwiftUI

struct ContentView: View {
    
    let isLogin: Bool = Keychain.loadToken() != nil
    @State private var showMainView = false
    
    var body: some View {
        if showMainView {
            VStack {
                // 자동로그인
                if isLogin {
                    TabbarView()
                } else {
                    LoginView()
                }
            }
            .edgesIgnoringSafeArea(.all)
        } else {
            SplashView()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                        withAnimation {
                            showMainView = true
                        }
                    }
                    
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
