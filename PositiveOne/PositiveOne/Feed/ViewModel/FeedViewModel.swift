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
    @Published var page: Int = 0 
    @Published var isLast = false

    init() {
       getFeed(type: "new")
    }
    
    func getFeed(type: String) {
        if !isLast {
            Task {
                let response = try await getFeed(type: type, page: page)
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
    
    func postHeart(boardId: Int) {
        Task {
            let response = try await postHeart(boardId: boardId)
            print(response)
        }
    }
    
    func deleteHeart(boardId: Int) {
        Task {
            let response = try await deleteHeart(boardId: boardId)
            print(response)
        }
    }
    
    func resetFeedContent() {
        feedContents = []
        page = 0
        isLast = false
    }
    
    func hideBoard(parameters: HideBoardRequest) {
        Task {
            let response = try await hideBoard(parameters: parameters)
            print(response)
        }
    }
    
    func hideUser(parameters: HideUserRequest) {
        Task {
            let response = try await hideUser(parameters: parameters)
            print(response)
        }
    }
    
    func reportUser(parameters: ReportUserRequest) {
        Task {
            let response = try await reportUser(parameters: parameters)
            print(response)
        }
    }
    
    func reportBoard(parameters: ReportBoardRequest) {
        Task {
            let response = try await reportBoard(parameters: parameters)
            print(response)
        }
    }
   
    private func getFeed(type: String, page: Int) async throws -> FeedResponse {
        return try await PositiveOneAPI.request(target: .getFeed(type: type, page: String(page)), dataType: FeedResponse.self)
    }
    
    private func postHeart(boardId: Int) async throws  -> PositiveOneResponse {
        return try await PositiveOneAPI.request(target: .postHeart(boardId: boardId), dataType: PositiveOneResponse.self)
    }
    
    private func deleteHeart(boardId: Int) async throws -> PositiveOneResponse {
        return try await PositiveOneAPI.request(target: .deleteHeart(boardId: boardId), dataType: PositiveOneResponse.self)
    }
   
    private func hideBoard(parameters: HideBoardRequest) async throws -> PositiveOneResponse {
        return try await PositiveOneAPI.request(target: .postHideBoard(paramters: parameters.asDictionary()), dataType: PositiveOneResponse.self)
    }
    
    private func hideUser(parameters: HideUserRequest) async throws -> PositiveOneResponse {
        return try await PositiveOneAPI.request(target: .postHideUser(paramters: parameters.asDictionary()), dataType: PositiveOneResponse.self)
    }
    
    private func reportBoard(parameters: ReportBoardRequest) async throws -> PositiveOneResponse {
        return try await PositiveOneAPI.request(target: .postReportBoard(paramters: parameters.asDictionary()), dataType: PositiveOneResponse.self)
    }
    
    private func reportUser(parameters: ReportUserRequest) async throws -> PositiveOneResponse {
        return try await PositiveOneAPI.request(target: .postReportUser(paramters: parameters.asDictionary()), dataType: PositiveOneResponse.self)
    }
    
}
