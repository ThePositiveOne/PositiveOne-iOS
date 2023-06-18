//
//  SingleButtonPopupView.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/17.
//

import SwiftUI

struct SingleButtonPopupView: View {
    @Environment(\.presentationMode) var presentationMode
    let orangeText: String
    let blackText: String
    let subText: String
    var body: some View {
        VStack {
            VStack(spacing: 0) {
                
                HStack(spacing: 0) {
                    Text(orangeText)
                        .font(CustomFont.PretendardBold(size: 16).font)
                        .foregroundColor(.Custom.PositiveYellow)

                    Text(blackText)
                        .font(CustomFont.PretendardBold(size: 16).font)
                        .foregroundColor(.Custom.TitleColor)
                }
                .padding(.top, 27)
                
                Text(subText)
                    .font(CustomFont.PretendardMedium(size: 14).font)
                    .foregroundColor(.Custom.Black60)
                    .multilineTextAlignment(.center)
                    .padding(.top, 6)
                
                Spacer()
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("확인")
                        .foregroundColor(.white)
                        .frame(width: 270, height: 44)
                        .background(Color.Custom.PositiveYellow)
                        .cornerRadius(4)
                }
                .padding(.bottom, 12)
            }
            .frame(width: 300, height: 168)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(.white)
                    .shadow(color: Color.black.opacity(0.05), radius: 3, x: 2, y: 2)
            )
        }
        .frame(
              minWidth: 0,
              maxWidth: .infinity,
              minHeight: 0,
              maxHeight: .infinity,
              alignment: .center
            )
        .background(Color.black.opacity(0.8))
        .onTapGesture {
            presentationMode.wrappedValue.dismiss()
        }
        
    }
}

struct SingleButtonPopupView_Previews: PreviewProvider {
    static var previews: some View {
        SingleButtonPopupView(
            orangeText: "수정할 수 있는 시간",
            blackText: "이 지났습니다.",
            subText: """
                    작성완료일을 기준으로
                    당일까지만 수정 및 삭제를 할 수 있습니다.
                    """
        )
    }
}
