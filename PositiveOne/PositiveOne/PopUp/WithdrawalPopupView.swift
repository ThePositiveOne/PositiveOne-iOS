//
//  WithdrawalPopupView.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/07/04.
//

import SwiftUI

struct WithdrawalPopupView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var isPresentedLoginView = false
    
    var body: some View {
        ZStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("")
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .background(Color.black.opacity(0.8))
            })
            
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Text("정말")
                        .font(CustomFont.PretendardBold(size: 16).font)
                        .foregroundColor(.Custom.TitleColor)
                    
                    Text(" 탈퇴")
                        .font(CustomFont.PretendardBold(size: 16).font)
                        .foregroundColor(.Custom.PositiveYellow)

                    Text("하시겠습니까?")
                        .font(CustomFont.PretendardBold(size: 16).font)
                        .foregroundColor(.Custom.TitleColor)
                }
                .padding(.top, 40)
                
                Text("탈퇴하셔도 기록은 유지됩니다.")
                    .font(CustomFont.PretendardMedium(size: 14).font)
                    .foregroundColor(.Custom.Black60)
                    .multilineTextAlignment(.center)
                    .padding(.top, 10)
                
                Spacer()
                HStack(spacing: 6) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("유지할래요")
                            .foregroundColor(Color.Custom.Black90)
                            .font(CustomFont.PretendardMedium(size: 16).font)
                            .frame(width: 132, height: 44)
                            .background(Color.Custom.Black10)
                            .cornerRadius(4)
                    }
                    .padding(.bottom, 12)
                    Button {
                        SettingViewModel().deleteUser()
                        isPresentedLoginView.toggle()
                        
                    } label: {
                        Text("네, 탈퇴할래요")
                            .foregroundColor(.white)
                            .font(CustomFont.PretendardMedium(size: 16).font)
                            .frame(width: 132, height: 44)
                            .background(Color.Custom.PositiveYellow)
                            .cornerRadius(4)
                    }
                    .padding(.bottom, 12)
                }
                .padding(.horizontal, 0)
                
            }
            .frame(width: 300, height: 168)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(.white)
                    .shadow(color: Color.black.opacity(0.05), radius: 3, x: 2, y: 2)
            )
            
            .fullScreenCover(isPresented: $isPresentedLoginView) {
                LoginView()
            }
        }
    }
}

struct WithdrawalPopupView_Previews: PreviewProvider {
    static var previews: some View {
        WithdrawalPopupView()
    }
}
