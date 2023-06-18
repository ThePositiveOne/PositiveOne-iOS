//
//  TextEditorView.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/15.
//

import SwiftUI
import CryptoKit

struct TextEditorView: View {
    @Binding var content: String
    @State var placeHolder: String = "오늘의 긍정 한마디 (50자 제한)"
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
                
                HStack(spacing: 0) {
                    
                    let limitContent = Binding(get: {
                        content
                    }, set: {
                        content = String($0.prefix(maxTextNum))
                    })
                    Spacer()
                    ZStack {
                        if content.isEmpty {
                            TextEditor(text: $placeHolder)
                                .font(CustomFont.PretendardMedium(size: 14).font)
                                .foregroundColor(.Custom.Black60)
                                .disabled(true)
                                .padding(18)
                        }
                        
                        TextEditor(text: limitContent)
                            .font(CustomFont.PretendardMedium(size: 14).font)
                            .lineSpacing(3)
                            .lineLimit(nil)
                            .foregroundColor(.Custom.TitleColor)
                            .opacity(content.isEmpty ? 0.25 : 1)
                            .padding(18)
                            .onChange(of: content) { newValue in
                                if newValue == placeHolder {
                                    content = ""
                                }
                            }
                        
                    }
                    .frame(width: UIScreen.main.bounds.width-40, height: UIScreen.main.bounds.height*0.2)
                    
                    .background(
                        RoundedRectangle(cornerRadius: 4)
                            .foregroundColor(.white)
                            .shadow(color: Color.black.opacity(content.isEmpty ? 0.05 : 0), radius: 6, x: 2, y: 2)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(content.isEmpty ? Color.clear : Color.Custom.PositiveYellow)
                    )
                    
                    Spacer()
                }
                
                Text("\(content.count)/\(maxTextNum)")
                    .font(CustomFont.PretendardMedium(size: 12).font)
                    .foregroundColor(.Custom.Black70)
                    .offset(x: UIScreen.main.bounds.width*0.38, y: UIScreen.main.bounds.height*0.08)
                
            }
            .padding(.top, 10)
            
            
        }
    }
}

struct TextEditorView_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorView(content: Binding.constant(""))
    }
}
