//
//  HidePopupView.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/26.
//

import SwiftUI

struct HidePopupView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: FeedViewModel
    let boardId: Int
    let memberId: Int
    
    var body: some View {
        ZStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("")
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .background(Color.black.opacity(0.8))
            })
            
            VStack {
                VStack(spacing: 0) {
                    
                    HStack(spacing: 0) {
                        Text("정말 이 ")
                            .font(CustomFont.PretendardBold(size: 16).font)
                            .foregroundColor(.Custom.TitleColor)
                        
                        Text(Report.shared.reportType?.rawValue ?? "")
                            .font(CustomFont.PretendardBold(size: 16).font)
                            .foregroundColor(.Custom.PositiveYellow)

                        Text("을 가릴까요?")
                            .font(CustomFont.PretendardBold(size: 16).font)
                            .foregroundColor(.Custom.TitleColor)
                    }
                    .padding(.top, 50)
                    
                  
                    
                    Spacer()
                    HStack(spacing: 6) {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("취소")
                                .foregroundColor(Color.Custom.Black90)
                                .frame(width: 132, height: 44)
                                .background(Color.Custom.Black10)
                                .cornerRadius(4)
                        }
                        .padding(.bottom, 12)
                        Button {
                            switch Report.shared.reportType {
                            case .user:
                               viewModel.hideUser(parameters: HideUserRequest(hideMemberId: memberId))
                            case .feed:
                              viewModel.hideBoard(parameters: HideBoardRequest(hideBoardId: boardId))
                            default:
                                break
                            }
                            NotificationCenter.default.post(name: .reloadFeed, object: nil)
                            presentationMode.wrappedValue.dismiss()
                            
                        } label: {
                            Text("확인")
                                .foregroundColor(.white)
                                .frame(width: 132, height: 44)
                                .background(Color.Custom.PositiveYellow)
                                .cornerRadius(4)
                        }
                        .padding(.bottom, 12)
                    }
                    .padding(.horizontal, 0)
                    
                }
                .frame(width: 300, height: 168)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(.white)
                        .shadow(color: Color.black.opacity(0.05), radius: 3, x: 2, y: 2)
                )
            }
        }
        .onAppear {
            print(boardId, memberId, Report.shared.reportType)
        }
        
    }
}

struct HidePopupView_Previews: PreviewProvider {
    static var previews: some View {
        HidePopupView(viewModel: FeedViewModel(), boardId: 4, memberId: 4)
    }
}
