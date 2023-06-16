//
//  MyPositiveOneView.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/16.
//

import SwiftUI

struct MyPositiveOneView: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 18) {
                Spacer()
                Button {
                    
                } label: {
                    Image("pen")
                }
                Button {
                    
                } label: {
                    Image("trash")
                }
            }
            .padding(.trailing, 29)
            .padding(.bottom, 15)
            
            HStack(spacing: 24) {
                BigStampView(type: .movedOne)
                    .frame(height: 90)
                    .padding(.vertical, 2)
                    .padding(.leading, 24)
                
                Text("""
                    운선님이랑 영선이랑 회의 했다.
                    순조로운 시작인 것 같아 매우 즐겁다~
                    가나다라 마바사 아자차카타파하
                    """)
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
               .shadow(
                color: Color.Custom.Black10,
                 radius: 2,
                 x: 2,
                 y: 2
               )
            )
            
        }
    }
}

struct MyPositiveOneView_Previews: PreviewProvider {
    static var previews: some View {
        MyPositiveOneView()
    }
}
