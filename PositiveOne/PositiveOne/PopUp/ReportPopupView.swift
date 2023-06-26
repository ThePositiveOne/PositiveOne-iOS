//
//  ReportPopupView.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/26.
//

import SwiftUI

struct ReportPopupView: View {
    
    let reportLists = ["계정 신고", "피드 신고", "계정 가리기", "피드 가리기"]
    let boardId: Int
    
    var body: some View {
        VStack {
            Spacer()
            List {
                ForEach(reportLists, id: \.self) { item in
                    Button {
                        
                    } label: {
                        Text(item)
                            .foregroundColor(item=="계정 신고" || item=="피드 신고" ? .Custom.Red : .Custom.Black60)
                            .font(CustomFont.PretendardSemiBold(size: 16).font)
                    }
                    .frame(height: 75)
                    .buttonStyle(PlainButtonStyle())
                    .scrollContentBackground(.hidden)
                    .listRowInsets(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: -10))
                    .listRowSeparatorTint(.Custom.Black40)

                }
            }
            .frame(width: 390, height: 297)
            .listStyle(.plain)
            .cornerRadius(10)
        } // VStack
        .background(Color.black.opacity(1))
        .edgesIgnoringSafeArea(.bottom)
        
    }
}

struct ReportPopupView_Previews: PreviewProvider {
    static var previews: some View {
        ReportPopupView(boardId: 4)
    }
}
