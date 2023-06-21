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
    @ObservedObject var viewModel = FeedViewModel()
    
    let feedContents: [FeedContent] = [
        FeedContent(boardId: 3, stamp: "excitingOne", text: "haha", date: "23.05.13", name: "dd", memberId: 2, likeCnt: 2, likeCheck: true)
    ]
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(viewModel.feedContents) { content in
                        FeedRowView(feedContent: content, viewModel: viewModel)
                            .listRowInsets(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))
                            .buttonStyle(PlainButtonStyle())
                            .listRowBackground(Color.Custom.YellowShadow50)
                            .background(Color.white)
                            .cornerRadius(4)
                            .onAppear {
                                let contents = viewModel.feedContents
                                if content == contents[contents.count-1] {
                                    viewModel.getFeed(type: sortingType.rawValue)
                                }
                            }
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
            .onAppear {
                sortingType = .new
            }
        }
        
    }
    
    var headerView: some View {
        HStack {
            Button {
                if sortingType == .popular {
                    sortingType = .new
                    viewModel.resetFeedContent()
                    viewModel.getFeed(type: sortingType.rawValue)
                }
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
                if sortingType == .new {
                    sortingType = .popular
                    viewModel.resetFeedContent()
                    viewModel.getFeed(type: sortingType.rawValue)
                }
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
