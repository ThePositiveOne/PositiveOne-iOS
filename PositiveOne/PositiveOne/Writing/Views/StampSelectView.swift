//
//  StampSelectView.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/15.
//

import SwiftUI

struct StampSelectView: View {
    
    @Binding var selectedType: PositiveOneType?
    
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
            
            StampViews(selectedType: $selectedType)
            .padding(.leading, 20)
            .padding(.top, 10)
        }
        
    }
}

struct StampViews: View {
    
    var stampViews = [
        BigStampView(type: .pleasureOne),
        BigStampView(type: .excitingOne),
        BigStampView(type: .thanksOne),
        BigStampView(type: .movedOne)
    ]
    
    @Binding var selectedType: PositiveOneType?
    
    var body: some View {
        HStack(spacing: 15) {
            ForEach(0..<4) { i in
                stampViews[i]
                    .onTapGesture {
                        HapticManager.instance.impact(style: .light)
                        selectedType = stampViews[i].type
                    }
                  
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .shadow(color: Color.black.opacity(selectedType == stampViews[i].type ? 0 : 0.05), radius: 7, x: 2, y: 2)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(selectedType == stampViews[i].type ? Color.Custom.PositiveYellow : Color.clear)
                    )
                    
            }
        }
        .frame(width: UIScreen.main.bounds.width-40)
    }
}


struct StampSelectView_Previews: PreviewProvider {
    static var previews: some View {
        StampSelectView(selectedType: Binding.constant(.excitingOne))
    }
}
