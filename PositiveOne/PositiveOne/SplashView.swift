//
//  SplashView.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/27.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            VStack {
                Image("Familyver")
                    .resizable()
                    .frame(width: 235, height: 70)
            }
            VStack {
                Spacer()
                Text("Happiness created by positivity")
                    .font(CustomFont.PretendardRegular(size: 16).font)
                    .foregroundColor(.Custom.Black60)
            }
            .padding(.bottom, 58)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
