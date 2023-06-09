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
    @ObservedObject var viewModel: CalendarViewModel
    @State var isPresentedDeletePopupView = false
    
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
                    let _ = print(boardData)
                    WritingView(
                        selectedType: PositiveOneType(rawValue: boardData.stamp) ?? .excitingOne,
                        content: boardData.text,
                        isLocked: boardData.secret,
                        boardId: boardData.boardId,
                        viewModel: WritingViewModel()
                    )
                }
                
                Button {
                    isPresentedDeletePopupView.toggle()
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
                    .font(CustomFont.PretendardMedium(size: 13).font)
                    .foregroundColor(.Custom.Black90)
                    .lineSpacing(3)
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
            
            .fullScreenCover(isPresented: $isPresentedDeletePopupView, content: {
                DeletePopupView(viewModel: viewModel, boardId: boardData.boardId)
                    .clearModalBackground()
            })
            
        }
    }
}

struct MyPositiveOneView_Previews: PreviewProvider {
    static var previews: some View {
        MyPositiveOneView(boardData: Binding.constant(BoardData(boardId: 3, stamp: "excitingOne", text: "오늘 계속 테스트해보고\n 어쩌고 저쩌고", date: "23.05.03", secret: true)), viewModel: CalendarViewModel())
    }
}
