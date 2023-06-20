//
//  FeedView.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/08.
//

import SwiftUI

struct FeedView: View {
    
    @Binding var isTabbarHidden: Bool
    @State var sortingType: SortingType = .new
    
    let feedContents: [FeedContent] = [
        FeedContent(text: """
                 오늘 친구들이랑 서울숲을 갔다.
                 날씨가 너무 좋기도 했고,
                 애들이랑 재미있게 놀아서 행복했다!!
                """, date: "23.05.23", likeCheck: true, name: "따뜻한 긍정이"),
        FeedContent(text: """
                 오늘 친구들이랑 서울숲을 갔다.
                 날씨가 너무 좋기도 했고,
                 애들이랑 재미있게 놀아서 행복했다!!
                """, date: "23.05.24", likeCheck: false, name: "건강한 긍정이"),
        FeedContent(text: """
                 오늘 친구들이랑 서울숲을 갔다.
                 날씨가 너무 좋기도 했고,
                 애들이랑 재미있게 놀아서 행복했다!!
                """, date: "23.05.23", likeCheck: true, name: "나"),
        FeedContent(text: """
                 오늘 친구들이랑 서울숲을 갔다.
                 날씨가 너무 좋기도 했고,
                 애들이랑 재미있게 놀아서 행복했다!!
                """, date: "23.05.23", likeCheck: true, name: "나"),
        FeedContent(text: """
                 오늘 친구들이랑 서울숲을 갔다.
                 날씨가 너무 좋기도 했고,
                 애들이랑 재미있게 놀아서 행복했다!!
                """, date: "23.05.23", likeCheck: true, name: "나")
    ]
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(feedContents) { content in
                        FeedRowView(feedContent: content)
                            .listRowInsets(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))
                            .buttonStyle(PlainButtonStyle())
                            .listRowBackground(Color.Custom.YellowShadow50)
                            .background(Color.white)
                            .cornerRadius(10)
                    }
                    
                } header: {
                    headerView
                        .padding(.leading, -15)
                        .padding(.top, 26)
                }
                
            } // List
            .padding(.top, -35)
            .scrollContentBackground(.hidden)
            .background(Color.Custom.YellowShadow50)
            .scrollIndicators(.hidden)
            .listStyle(.grouped)
            
            
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color.Custom.YellowShadow50, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text("긍정하나")
                            .font(CustomFont.gangwon(size: 20).font)
                            .foregroundColor(.Custom.TitleColor)
                    }
                }
            }
            
            .toolbar {
                ToolbarItem {
                    NavigationLink(
                        destination: SettingsView(isTabbarHidden: $isTabbarHidden)
                    ) {
                        Image("gear")
                            .foregroundColor(Color.Custom.Black70)
                            .offset(x: -3)
                    }
                    
                }
            } // toolbar
        }
        
    }
    
    var headerView: some View {
        HStack {
            Button {
                sortingType = .new
            } label: {
                Text("최신순")
                    .frame(width: 80, height: 30)
                    .background(sortingType == .new ? Color.Custom.PositiveYellow : Color.Custom.Black30)
                    .cornerRadius(16)
                    .font(CustomFont.PretendardMedium(size: 14).font)
                    .foregroundColor(.white)
            }
            .padding(.leading, 20)
            
            Button {
                sortingType = .popular
            } label: {
                Text("인기순")
                    .frame(width: 80, height: 30)
                    .background(sortingType == .popular ? Color.Custom.PositiveYellow : Color.Custom.Black30)
                    .cornerRadius(16)
                    .font(CustomFont.PretendardMedium(size: 14).font)
                    .foregroundColor(.white)
            }
            Spacer()
        }
        .background(Color.Custom.YellowShadow50)
    }
    
    
    
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView(isTabbarHidden: .constant(true))
    }
}
