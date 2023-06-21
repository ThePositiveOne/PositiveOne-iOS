//
//  FeedRowView.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/12.
//

import SwiftUI

struct FeedRowView: View {
    
    @State var feedContent: FeedContent
    @ObservedObject var viewModel = FeedViewModel()
    
    var body: some View {
        let isMine = feedContent.name == "내가 쓴 글"
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .bottom) {
                Text(feedContent.name)
                    .font(CustomFont.PretendardBold(size: 16).font)
                    .foregroundColor(isMine ? .Custom.PositiveYellow : .Custom.Black100)
                    .padding(.top, 18)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image("moreVertical")
                }

            }
            .padding(.leading, 16)
            .padding(.trailing, 14)
            
            
            Text(feedContent.date)
                .font(CustomFont.PretendardRegular(size: 12).font)
                .foregroundColor(.Custom.Black60)
                .padding(.top, 4)
                .padding(.horizontal, 16)
            
            Text(feedContent.text)
            .font(CustomFont.PretendardMedium(size: 14).font)
            .foregroundColor(.Custom.Black70)
            .frame(height: 57)
            .padding(.top, 10)
            .padding(.horizontal, 16)
            
            
            HStack {
                Spacer()
                Button(action: {
                    if feedContent.likeCheck {
                        viewModel.deleteHeart(boardId: feedContent.boardId)
                        feedContent.likeCnt -= 1
                    } else {
                        viewModel.postHeart(boardId: feedContent.boardId)
                        feedContent.likeCnt += 1
                    }
                    feedContent.likeCheck.toggle()
                    
                        
                }, label: {
                    Image(systemName: feedContent.likeCheck ? "heart.fill" : "heart")
                        .resizable()
                        .foregroundColor(.white)
                        .scaledToFit()
                        .frame(width: 12, height: 11)
                        .offset(CGSize(width: 1, height: 0))
                        
                        
                    Text(String(feedContent.likeCnt))
                        .foregroundColor(.white)
                        .font(CustomFont.PretendardRegular(size: 14).font)
                        
                    
                })
                .frame(width: 60, height: 26)
                .background(feedContent.likeCheck ? Color.Custom.PositiveYellow : Color.Custom.Black30)
                .cornerRadius(3)
                .padding(.top, 2)
                .padding(.trailing, 16)
            }
            
            
            Spacer()
        }
        .frame(height: 166)
        .listRowSeparator(.hidden)
        .background(
            RoundedRectangle(cornerRadius: 4)
                .stroke(isMine ? Color.Custom.PositiveYellow : .clear, lineWidth: 1.7)
        )
        //.background(.green)
    }
        
}

struct FeedRowView_Previews: PreviewProvider {
    static var previews: some View {
        FeedRowView(feedContent: FeedContent(boardId: 3, stamp: "pleasureOne", text: "haha", date: "23.03.06", name: "내가 쓴 글", memberId: 2, likeCnt: 3, likeCheck: false))

    }
}
