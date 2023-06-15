//
//  WritingView.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/13.
//

import SwiftUI

struct WritingView: View {
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Button {
                
                } label: {
                    Image(systemName: "xmark")
                }
                .foregroundColor(Color.Custom.Black70)
                .frame(width: 12, height: 12)
                
                Spacer()
                Text("기록하기")
                    .font(CustomFont.PretendardSemiBold(size: 18).font)
                    .foregroundColor(.Custom.Black90)
                    .padding(.leading, 46.5)
                    
                Spacer()
                
                Button {
                    
                } label: {
                    Text("작성")
                        .font(CustomFont.PretendardMedium(size: 14).font)
                        .foregroundColor(.white)
                        .padding(.horizontal, 18)
                        .padding(.vertical, 8)
                        .background(Color.Custom.Black30)
                        .cornerRadius(4)
                }

            }
            .frame(width: UIScreen.main.bounds.width-40)
           

            TextEditorView()
                .padding(.top, 49)
            
            StampSelectView()
                .padding(.top, 60)
            Spacer()
        }
    }
}

struct WritingView_Previews: PreviewProvider {
    static var previews: some View {
        WritingView()
    }
}
