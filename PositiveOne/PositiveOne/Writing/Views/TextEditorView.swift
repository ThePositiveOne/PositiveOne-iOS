//
//  TextEditorView.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/15.
//

import SwiftUI
import CryptoKit

struct TextEditorView: View {
    @State var content: String = ""
    let maxTextNum = 50
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 0) {
                Text("기록")
                    .font(CustomFont.PretendardBold(size: 20).font)
                    .foregroundColor(.Custom.TitleColor)
                
                Image("docs")
                    .padding(.leading, 6)
                   
                Spacer()
                
            }
            .padding(.leading, 20)
            
            Text("오늘의 긍정을 기록해보세요")
                .font(CustomFont.PretendardMedium(size: 14).font)
                .foregroundColor(.Custom.Black70)
                .padding(.top, 4)
                .padding(.leading, 20)
            
            
            ZStack {
                let placeHolder = "오늘의 긍정 한마디 (\(maxTextNum)자 제한)"
                if content.isEmpty {
                    Text(placeHolder)
                        .font(CustomFont.PretendardMedium(size: 14).font)
                        .foregroundColor(.Custom.TitleColor)
                        .padding(.top, -UIScreen.main.bounds.height*0.075)
                        .padding(.leading, -UIScreen.main.bounds.width*0.4)
                }
                
                HStack(spacing: 0) {
                    let limitContent = Binding(get: {
                        content
                    }, set: {
                        content = String($0.prefix(maxTextNum))
                    })
                    Spacer()
                    TextEditor(text: limitContent)
                        .font(CustomFont.PretendardMedium(size: 14).font)
                        .frame(width: UIScreen.main.bounds.width-40, height: UIScreen.main.bounds.height*0.2)
                        .shadow(color: Color.black.opacity(content.isEmpty ? 0.05 : 0), radius: 7, x: 2, y: 2)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(content.isEmpty ? Color.clear : Color.Custom.PositiveYellow)
                        )
                        .foregroundColor(.Custom.Black100)
                        .lineSpacing(10)
                        .opacity(content.isEmpty ? 0.8 : 1)
                       
                    
                    Spacer()
                }
                
                Text("\(content.count)/\(maxTextNum)")
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
