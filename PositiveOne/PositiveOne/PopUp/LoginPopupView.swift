//
//  SingleButtonPopupView.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/17.
//

import SwiftUI



struct LoginPopupView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var isPresentedLoginView = false
    
    var body: some View {
        VStack {
            VStack(spacing: 0) {
                
                HStack(spacing: 0) {
                    Text("로그인")
                        .font(CustomFont.PretendardBold(size: 16).font)
                        .foregroundColor(.Custom.PositiveYellow)

                    Text("후 이용 가능합니다.")
                        .font(CustomFont.PretendardBold(size: 16).font)
                        .foregroundColor(.Custom.TitleColor)
                }
                .padding(.top, 40)
                
                Text("로그인 페이지로 이동하시겠습니까?")
                    .font(CustomFont.PretendardMedium(size: 14).font)
                    .foregroundColor(.Custom.Black60)
                    .multilineTextAlignment(.center)
                    .padding(.top, 6)
                
                Spacer()
                HStack(spacing: 6) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("취소")
                            .foregroundColor(Color.Custom.Black90)
                            .frame(width: 132, height: 44)
                            .background(Color.Custom.Black10)
                            .cornerRadius(4)
                    }
                    .padding(.bottom, 12)
                    Button {
                       // presentationMode.wrappedValue.dismiss()
                        isPresentedLoginView.toggle()
                        
                    } label: {
                        Text("확인")
                            .foregroundColor(.white)
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
       
        .onTapGesture {
            presentationMode.wrappedValue.dismiss()
        }
        
    }
}

struct SingleButtonPopupView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPopupView()
    }
}
