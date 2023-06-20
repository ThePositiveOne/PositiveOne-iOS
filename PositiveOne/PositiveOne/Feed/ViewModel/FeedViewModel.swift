//
//  FeedViewModel.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/20.
//

import Foundation
import Combine

class FeedViewModel: ObservableObject {
    
    @Published var feedContents: [FeedContent] = []
    @Published var page: Int = 0 {
        didSet {
            print("page = \(page)")
        }
    }
    @Published var isLast = false

    init() {
       getFeed(type: "new")
    }
    
    func getFeed(type: String) {
        if !isLast {
            Task {
                let response = try await getFeed(type: type, page: page)
                print(response)
                if let data = response.data,
                   let boardDTOs = data.boardDTOs {
                    DispatchQueue.main.async { [weak self] in
                        self?.page = data.pageNumber + 1
                        self?.isLast = data.last
                        for boardDTO in boardDTOs {
                            self?.feedContents.append(FeedContent(
                                boardId: boardDTO.boardId,
                                stamp: boardDTO.stamp,
                                text: boardDTO.text,
                                date: boardDTO.date,
                                name: boardDTO.name,
                                memberId: boardDTO.memberId,
                                likeCnt: boardDTO.likeCnt,
                                likeCheck: boardDTO.likeCheck
                            ))
                        }
                    }
                }
            }
        }
    }
   
    private func getFeed(type: String, page: Int) async throws -> FeedResponse {
        return try await PositiveOneAPI.request(target: .getFeed(type: type, page: String(page)), dataType: FeedResponse.self)
    }
   
    
}
