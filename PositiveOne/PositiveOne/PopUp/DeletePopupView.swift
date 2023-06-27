//
//  DeletePopupView.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/27.
//

import SwiftUI

struct DeletePopupView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: CalendarViewModel
    let boardId: Int
    
    var body: some View {
        ZStack {
            
            Text("")
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .background(Color.black.opacity(0.8))
            
            
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Text("기록")
                        .font(CustomFont.PretendardBold(size: 16).font)
                        .foregroundColor(.Custom.PositiveYellow)
                    
                    Text("을 삭제하시겠습니까?")
                        .font(CustomFont.PretendardBold(size: 16).font)
                        .foregroundColor(.Custom.TitleColor)
                }
                .padding(.top, 40)
                
                Text("한 번 삭제하시면 복구가 불가합니다. ")
                    .font(CustomFont.PretendardMedium(size: 14).font)
                    .foregroundColor(.Custom.Black60)
                    .multilineTextAlignment(.center)
                    .padding(.top, 9)
                
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
                        viewModel.deleteBoard(boardId: boardId)
                        presentationMode.wrappedValue.dismiss()
                        
                    } label: {
                        Text("네, 삭제할래요")
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
          
        }
    }
}

struct DeletePopupView_Previews: PreviewProvider {
    static var previews: some View {
        DeletePopupView(viewModel: CalendarViewModel(), boardId: 3)
    }
}
