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
    @ObservedObject var viewModel = LoginViewModel()
   
    var body: some View {
        VStack(spacing: 0) {
       
            Spacer()
            LoginCharacterView()
                .padding(.top, UIScreen.main.bounds.height*0.2)
           
            
            AppleSigninButton(viewModel: viewModel)
                .frame(width: 266, height: 44)
                .padding(.top, UIScreen.main.bounds.height*0.15)
            
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
            .fullScreenCover(isPresented: .constant(viewModel.isLoginSuccess)) {
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
            request.requestedScopes = [.email]
        } onCompletion: { result in
            switch result {
            case .success(let authResult):
                print("apple login success")
                switch authResult.credential {
                case let appleIDCrednetial as ASAuthorizationAppleIDCredential:
                    let identityToken = String(data: appleIDCrednetial.identityToken!, encoding: .utf8) ?? ""
                    let code = String(data: appleIDCrednetial.authorizationCode ?? Data(), encoding: .utf8) ?? ""
                    viewModel.postAppleLogin(AppleLoginRequest(identityToken: identityToken, authorization_code: code))
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
