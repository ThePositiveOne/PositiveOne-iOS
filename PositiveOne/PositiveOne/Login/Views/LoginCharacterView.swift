//
//  LoginCharacterView.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/04.
//

import SwiftUI

struct LoginCharacterView: View {
    var body: some View {
        VStack {
            Image("LoginCharacters")
                .frame(width: 133, height: 133)
                .padding(.bottom, 25)
            
            Text("긍정하나")
                .font(CustomFont.gangwon(size: 34).font)
                .foregroundColor(.Custom.TitleColor)
                .padding(.bottom, 0)
            
            Text("Positive one")
                .font(CustomFont.PretendardMedium(size: 14).font)
                .foregroundColor(.Custom.Black40)
        }
    }
}

struct LoginCharacterView_Previews: PreviewProvider {
    static var previews: some View {
        LoginCharacterView()
    }
}
