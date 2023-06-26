//
//  ReportPopupView.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/26.
//

import SwiftUI

struct ReportPopupView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var reportText: String = ""
    let reportType: ReportType
    
    var body: some View {
        VStack {
            VStack(spacing: 0) {
                
                Text("어떤 이유로 신고하시나요?")
                    .font(CustomFont.PretendardBold(size: 16).font)
                    .foregroundColor(.Custom.TitleColor)
                .padding(.top, 27)
                
              
                TextField("타이틀", text: $reportText,
                          prompt: Text("신고할 사항을 입력해주세요")
                    .font(CustomFont.PretendardLight(size: 16).font)
                    .foregroundColor(.Custom.Black60)
                )
                    .padding(.top, 16)
                    .padding(.horizontal, 15)
                
                Divider()
                 .frame(height: 1)
                 .padding(.horizontal, 15)
                 .padding(.top, 4)
                
                Spacer()
                
                HStack(spacing: 6) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("신고하기")
                            .foregroundColor(Color.Custom.Black90)
                            .frame(width: 132, height: 44)
                            .background(Color.Custom.Black10)
                            .cornerRadius(4)
                    }
                    .padding(.bottom, 12)
                    Button {
                       
                        
                    } label: {
                        Text("취소")
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
       
        .onTapGesture {
            presentationMode.wrappedValue.dismiss()
        }
        
    }
}

struct ReportPopupView_Previews: PreviewProvider {
    static var previews: some View {
        ReportPopupView(reportType: .user)
    }
}
