//
//  MyPositiveOneView.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/16.
//

import SwiftUI

struct MyPositiveOneView: View {
    
    @State var isPresented = false
    @Binding var boardData: BoardData
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 18) {
                Spacer()
                Button {
                    isPresented.toggle()
                } label: {
                    Image("pen")
                }
                .fullScreenCover(isPresented: $isPresented) {
                    SingleButtonPopupView(
                        orangeText: "수정할 수 있는 시간",
                        blackText: "이 지났습니다.",
                        subText: """
                                작성완료일을 기준으로
                                당일까지만 수정 및 삭제를 할 수 있습니다.
                                """
                    )
                    .clearModalBackground()
                    
                }
                Button {
                    
                } label: {
                    Image("trash")
                }
            }
            .padding(.trailing, 29)
            .padding(.bottom, 15)
            
            HStack(spacing: 24) {
                BigStampView(type: PositiveOneType(rawValue: boardData.stamp) ?? .movedOne)
                    .frame(height: 90)
                    .padding(.vertical, 2)
                    .padding(.leading, 24)
                
                Text(boardData.text)
                .font(CustomFont.PretendardMedium(size: 12).font)
                .foregroundColor(.Custom.Black90)
                .lineSpacing(4)
                .padding(.vertical, 15)
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width-40, height: 98)
            
            .background(
                RoundedRectangle(
                    cornerRadius: 4
                )
                .foregroundColor(Color.white)
                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 2, y: 2)
            )
            
        }
    }
}

struct MyPositiveOneView_Previews: PreviewProvider {
    static var previews: some View {
        MyPositiveOneView(boardData: Binding.constant(BoardData(boardId: 3, stamp: "excitingOne", text: "gg", date: "23.05.03")))
    }
}
