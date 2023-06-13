//
//  FeedView.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/08.
//

import SwiftUI

struct FeedView: View {
    
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
    
    
    init() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = UIColor(Color.Custom.YellowShadow50)
        navBarAppearance.titleTextAttributes = [.font : UIFont(name: "GangwonEduPowerExtraBold", size: 20)!]
        navBarAppearance.shadowColor = .clear
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().standardAppearance = navBarAppearance
     
      //  UITableView.appearance().backgroundColor = .yellow

    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                HStack {
                    Button {
                        print("최신순")
                    } label: {
                        Text("최신순")
                            .frame(width: 80, height: 30)
                            .background(Color.Custom.PositiveYellow)
                            .cornerRadius(16)
                            .font(CustomFont.PretendardMedium(size: 14).font)
                            .foregroundColor(.white)
                    }
                    .padding(.leading, 20)
                    
                    Button {
                        print("인기순")
                    } label: {
                        Text("인기순")
                            .frame(width: 80, height: 30)
                            .background(Color.Custom.Black30)
                            .cornerRadius(16)
                            .font(CustomFont.PretendardMedium(size: 14).font)
                            .foregroundColor(.white)
                    }
                    Spacer()
                }
                .padding(.top, 20)
                .background(Color.Custom.YellowShadow50)

                List {
                    ForEach(feedContents) { content in
                        FeedRowView(feedContent: content)
                            .listRowInsets(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                            .frame(width: UIScreen.main.bounds.width-40,height: 166)
                            .buttonStyle(PlainButtonStyle())
                            .listRowBackground(Color.Custom.YellowShadow50)
                            .background(Color.white)
                            .cornerRadius(10)
                    }
                }
                .padding(.top, -35)
                .scrollContentBackground(.hidden)
                .background(Color.Custom.YellowShadow50)
                .scrollIndicators(.hidden)
                
            }
            .navigationBarTitle("긍정하나", displayMode: .inline)
            .toolbar {
                ToolbarItem {
                    NavigationLink(
                        destination: SettingsView()
                    ) {
                        Image(systemName: "gearshape")
                            .foregroundColor(Color.Custom.Black70)
                    }
                    
                }
            }
        }
        
    }
    
    
    
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
