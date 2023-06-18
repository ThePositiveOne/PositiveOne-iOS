//
//  LoginView.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/04.
//

import SwiftUI
import AuthenticationServices
import Moya

struct LoginView: View {
    @State var isPresented = false
   
    var body: some View {
        VStack() {
       
            LoginCharacterView()
            .padding(.bottom, 130)
            .padding(.top, UIScreen.main.bounds.height*0.28)
            
//            Button(action: {
//
//            }, label: {
//                Image(systemName: "apple.logo")
//                    .frame(width: 13.52, height: 17)
//                    .offset(x:20)
//
//                Text("Apple로 로그인")
//                    .frame(width: 266, height: 44)
//                    .font(CustomFont.PretendardMedium(size: 19).font)
//                    .offset(x: -13.52)
//
//            })
//            .background(.black)
//            .cornerRadius(3)
//            .foregroundColor(.white)
//            .font(CustomFont.PretendardMedium(size: 19).font)
//
            AppleSigninButton(viewModel: LoginViewModel())
                .frame(width: 266, height: 44)
            
            Button {
                isPresented.toggle()
            } label: {
                Text("둘러보기")
                .foregroundColor(.Custom.Black70)
                .font(CustomFont.PretendardMedium(size: 18).font)
                .padding(.top, 16)
            }
            .fullScreenCover(isPresented: $isPresented) {
                TabbarView()
            }
        
            Spacer()
        }
    }
}

struct AppleSigninButton: View {
    
    @ObservedObject var viewModel: LoginViewModel
    
    var body: some View {
        SignInWithAppleButton { request in
            request.nonce = "aa"
        } onCompletion: { result in
            switch result {
            case .success(let authResult):
                print("apple login success")
                switch authResult.credential {
                case let appleIDCrednetial as ASAuthorizationAppleIDCredential:
                    let identityToken = String(data: appleIDCrednetial.identityToken!, encoding: .utf8) ?? ""
                    print(identityToken)
                    viewModel.postAppleLogin(AppleLoginRequest(identityToken: identityToken))
                   
                default:
                    break
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
       
   
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
