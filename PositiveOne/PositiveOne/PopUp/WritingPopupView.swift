//
//  WritingPopupView.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/27.
//

import SwiftUI

struct WritingPopupView: View {
    
    @ObservedObject var viewModel: WritingViewModel
    @Binding var isPresentedPopupView: Bool
    let request: CalendarRequest
    @State var isPostSuccess = false
    
    var body: some View {
        ZStack {
            Button(action: {
                
            }, label: {
                Text("")
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .background(Color.black.opacity(0.8))
            })
            
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Text("작성")
                        .font(CustomFont.PretendardBold(size: 16).font)
                        .foregroundColor(.Custom.PositiveYellow)

                    Text("하시겠습니까?")
                        .font(CustomFont.PretendardBold(size: 16).font)
                        .foregroundColor(.Custom.TitleColor)
                }
                .padding(.top, 30)
                
                Text("공개로 설정하시면 작성하신 글이\n피드에 노출됩니다.")
                    .font(CustomFont.PretendardMedium(size: 14).font)
                    .foregroundColor(.Custom.Black60)
                    .multilineTextAlignment(.center)
                    .lineSpacing(1.5)
                    .padding(.top, 6)
                
                Spacer()
                HStack(spacing: 8) {
                    Button {
                        isPresentedPopupView = false
                    } label: {
                        Text("취소")
                            .foregroundColor(Color.Custom.Black90)
                            .frame(width: 132, height: 44)
                            .background(Color.Custom.Black10)
                            .cornerRadius(4)
                    }
                    .padding(.bottom, 12)
                    Button {
                        if !isPostSuccess {
                            isPostSuccess = true
                            viewModel.postBoard(request: request)
                            isPresentedPopupView = false
                        }
                        
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
        }
    }
}

struct WritingPopupView_Previews: PreviewProvider {
    static var previews: some View {
        WritingPopupView(viewModel: WritingViewModel(), isPresentedPopupView: .constant(true), request: CalendarRequest(text: "dd", stamp: "a", secret: true, date: "Dsa"))
    }
}
