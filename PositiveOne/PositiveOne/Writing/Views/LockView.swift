//
//  LockView.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/15.
//

import SwiftUI

struct LockView: View {
    
    @Binding var isLocked: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 0) {
                Text("공개")
                    .font(CustomFont.PretendardBold(size: 20).font)
                    .foregroundColor(.Custom.TitleColor)
                
                Image("lock")
                    .padding(.leading, 6)
                   
                Spacer()
                
            }
            .padding(.leading, 20)
            
            Text("피드 노출 여부를 선택해 주세요")
                .font(CustomFont.PretendardMedium(size: 14).font)
                .foregroundColor(.Custom.Black70)
                .padding(.top, 4)
                .padding(.leading, 20)
            
            HStack(spacing: 6) {
                Button {
                    isLocked = false
                } label: {
                    Text("공개")
                        .font(CustomFont.PretendardMedium(size: 14).font)
                        .foregroundColor(.white)
                        .frame(width: (UIScreen.main.bounds.width-40-6)/2, height: 44)
                        .background(isLocked ? Color.Custom.Black30 :  Color.Custom.PositiveYellow)
                        .cornerRadius(4)
                    
                }
                Button {
                    isLocked = true
                } label: {
                    Text("비공개")
                        .font(CustomFont.PretendardMedium(size: 14).font)
                        .foregroundColor(.white)
                        .frame(width: (UIScreen.main.bounds.width-40-6)/2, height: 44)
                        .background(!isLocked ? Color.Custom.Black30 :  Color.Custom.PositiveYellow)
                        .cornerRadius(4)
                    
                }
            }
            .frame(width: UIScreen.main.bounds.width-40)
            .padding(.leading, 20)
            .padding(.top, 16)
        }
       
    }
}

struct LockView_Previews: PreviewProvider {
    static var previews: some View {
        LockView(isLocked: Binding.constant(false))
    }
}
