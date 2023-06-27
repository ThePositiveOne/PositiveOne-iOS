//
//  SettingsView.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/13.
//

import SwiftUI

struct SettingsView: View {
    
    let isLogin = Keychain.loadToken() != nil
    let notloggedInSettingList = ["로그인", "이용약관", "개인정보 정책"]
    let loggedInSettingList = ["로그아웃", "회원탈퇴", "이용약관", "개인정보 정책"]
    @State var isPresentedLoginView = false
    @Binding var isTabbarHidden: Bool
    
    var body: some View {
        
        List {
            ForEach(isLogin ? loggedInSettingList : notloggedInSettingList, id: \.self) { item in
                Button {
                    switch item {
                    case "로그인":
                        isPresentedLoginView.toggle()
                    case "로그아웃":
                        Keychain.deleteToken()
                        isPresentedLoginView.toggle()
                    default:
                        break
                    }
                } label: {
                    Text(item)
                        .foregroundColor(.Custom.Black70)
                        .font(CustomFont.PretendardMedium(size: 16).font)
                }
            }
        }
        .listStyle(PlainListStyle())
        .scrollContentBackground(.hidden)
        .background(.white)
        .frame(width: UIScreen.main.bounds.width-40)
        .padding(.leading, -20)
        .padding(.top, 20)
        
        .fullScreenCover(isPresented: $isPresentedLoginView) {
            LoginView()
        }
        
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                NavigationBackItem()
            }
        }
        
        .toolbar {
            ToolbarItem(placement: .principal) {
                VStack {
                    Text("설정")
                        .font(CustomFont.gangwon(size: 20).font)
                        .foregroundColor(.Custom.TitleColor)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        
        .onAppear {
            isTabbarHidden = true
        }
        .onDisappear {
            isTabbarHidden = false
        }
        
    }
    
    
}

//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView()
//    }
//}
