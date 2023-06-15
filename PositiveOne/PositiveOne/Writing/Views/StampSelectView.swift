//
//  StampSelectView.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/15.
//

import SwiftUI

struct StampSelectView: View {
    
    let stampViews = [
        BigStampView(type: .pleasureOne),
        BigStampView(type: .excitingOne),
        BigStampView(type: .thanksOne),
        BigStampView(type: .movedOne)
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 0) {
                Text("도장")
                    .font(CustomFont.PretendardBold(size: 20).font)
                    .foregroundColor(.Custom.TitleColor)
                
                Image("stamp")
                    .padding(.leading, 6)
                   
                Spacer()
                
            }
            .padding(.leading, 20)
            
            Text("오늘의 긍정을 도장으로 나타내보세요")
                .font(CustomFont.PretendardMedium(size: 14).font)
                .foregroundColor(.Custom.Black70)
                .padding(.top, 4)
                .padding(.leading, 20)
            
            HStack(spacing: 15) {
                ForEach(stampViews) { view in
                    view
                }
            }
            .frame(width: UIScreen.main.bounds.width-40)
            .padding(.leading, 20)
            .padding(.top, 10)
        }
        
    }
}

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
        .frame(width: (UIScreen.main.bounds.width-40-(15*4))/4,
               height: 96)
        .background(
               RoundedRectangle(cornerRadius: 4)
                   .foregroundColor(.white)
                   .shadow(color: Color.Custom.Black40, radius: 1, x: 2, y: 2)
                   .opacity(0.15)
               )
    }

    
    
}

struct StampSelectView_Previews: PreviewProvider {
    static var previews: some View {
        StampSelectView()
    }
}
