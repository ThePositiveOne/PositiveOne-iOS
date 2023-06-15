//
//  FeedRowView.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/12.
//

import SwiftUI

struct FeedRowView: View {
    let feedContent: FeedContent
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .bottom) {
                Text(feedContent.name)
                    .font(CustomFont.PretendardBold(size: 16).font)
                    .foregroundColor(.Custom.Black100)
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
            .padding(.top, 10)
            .padding(.horizontal, 16)
            
            
            HStack {
                Spacer()
                Button(action: {
                    
                }, label: {
                    Image(systemName: "heart.fill")
                        .resizable()
                        .foregroundColor(.white)
                        .scaledToFit()
                        .frame(width: 12, height: 11)
                        .offset(CGSize(width: 2, height: 0))
                        
                        
                    Text("15")
                        .foregroundColor(.white)
                        .font(CustomFont.PretendardRegular(size: 14).font)
                        
                    
                })
                .frame(width: 60, height: 26)
                .background(feedContent.likeCheck ?Color.Custom.PositiveYellow : Color.Custom.Black30)
                .cornerRadius(3)
                .padding(.top, 2)
                .padding(.leading, UIScreen.main.bounds.width-40-16-60-15)
            }
            .padding(.trailing, 16)
            
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width-40, height: 166)
        //.background(.green)
        .listRowSeparator(.hidden)
    }
        
}

struct FeedRowView_Previews: PreviewProvider {
    static var previews: some View {
        FeedRowView(feedContent: FeedContent(text: """
                 오늘 친구들이랑 서울숲을 갔다.
                 날씨가 너무 좋기도 했고,
                 애들이랑 재미있게 놀아서 행복했다!!
                """, date: "23.05.23", likeCheck: true, name: "따뜻한 긍정이"))
    }
}
