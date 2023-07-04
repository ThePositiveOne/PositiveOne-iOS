//
//  BigStampView.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/15.
//

import SwiftUI

struct BigStampView: View, Identifiable {
    
    let id = UUID()
    let type: PositiveOneType
    var isSelected: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Circle()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.Custom.Black10)
                    .offset(y: -4)
                Image(type.rawValue)
                    .frame(width: 45, height: 45)
            }
            
            HStack(spacing: 0) {
                Text(type.koreanName())
                    .foregroundColor(.Custom.Black90)
                    .font(CustomFont.PretendardBold(size: 12).font)
                Text("하나")
                    .foregroundColor(.Custom.Black90)
                    .font(CustomFont.PretendardMedium(size: 12).font)
                    .padding(.leading, 3)
            }
            .padding(.top, 6)
        }
        .frame(width: 76, height: 96)
        .background(
            RoundedRectangle(cornerRadius: 4)
                .foregroundColor(.white)
        )
    }
}

struct BigStampView_Previews: PreviewProvider {
    static var previews: some View {
        BigStampView(type: .movedOne)
    }
}

