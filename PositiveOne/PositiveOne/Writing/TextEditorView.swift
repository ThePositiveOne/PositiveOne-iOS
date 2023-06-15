//
//  TextEditorView.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/15.
//

import SwiftUI

struct TextEditorView: View {
    @State var content: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 0) {
                Text("기록")
                    .font(CustomFont.PretendardBold(size: 20).font)
                    .foregroundColor(.Custom.TitleColor)
                Spacer()
            }
            .padding(.leading, 20)
            
            Text("오늘의 긍정을 기록해보세요")
                .font(CustomFont.PretendardMedium(size: 14).font)
                .foregroundColor(.Custom.Black70)
                .padding(.top, 4)
                .padding(.leading, 20)
            
            
            ZStack {
                HStack(spacing: 0) {
                    Spacer()
                    TextEditor(text: $content)
                        .frame(width: UIScreen.main.bounds.width-40, height: UIScreen.main.bounds.height*0.2)
                        .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.05),radius: 2, x: 2, y: 2)
                        .foregroundColor(.Custom.Black100)
                        .font(CustomFont.PretendardMedium(size: 14).font)
                        .lineSpacing(20)
                    
                    Spacer()
                }
                let placeHolder = "오늘의 긍정 한마디 (30자 제한)"
                if content.isEmpty {
                    Text(placeHolder)
                        .foregroundColor(.Custom.Black40)
                        .font(CustomFont.PretendardMedium(size: 14).font)
                        .padding(.top, -UIScreen.main.bounds.height*0.075)
                        .padding(.leading, -UIScreen.main.bounds.width*0.4)
                }
                
                Text("\(content.count)/50")
                    .font(CustomFont.PretendardMedium(size: 12).font)
                    .foregroundColor(.Custom.Black70)
                    .offset(x: UIScreen.main.bounds.width*0.39, y: UIScreen.main.bounds.height*0.08)
                
            }
            .padding(.top, 10)
            
                
        }
    }
}

struct TextEditorView_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorView()
    }
}
