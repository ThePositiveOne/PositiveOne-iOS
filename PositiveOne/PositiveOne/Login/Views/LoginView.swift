//
//  LoginView.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/04.
//

import SwiftUI

// UIScreen.main.bounds.height / 2 * 0.75
struct LoginView: View {
    var body: some View {
        VStack() {
       
            LoginCharacterView()
            .padding(.bottom, 130)
            .padding(.top, UIScreen.main.bounds.height*0.28)
            
            Button(action: {
                
            }, label: {
                Image(systemName: "apple.logo")
                    .frame(width: 13.52, height: 17)
                    .offset(x:20)
                
                Text("Apple로 로그인")
                    .frame(width: 266, height: 44)
                    .font(CustomFont.PretendardMedium(size: 19).font)
                    .offset(x: -13.52)
                    
            })
            .background(.black)
            .cornerRadius(3)
            .foregroundColor(.white)
            .font(CustomFont.PretendardMedium(size: 19).font)
           
            
            Button("둘러보기") {
                
            }
            .foregroundColor(.Custom.Black70)
            .font(CustomFont.PretendardMedium(size: 18).font)
            .padding(.top, 16)
            Spacer()
        }
    
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
