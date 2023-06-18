//
//  PositiveOneType.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/15.
//

import Foundation

enum PositiveOneType: String {
    case pleasureOne = "pleasureOne"
    case movedOne = "movedOne"
    case excitingOne = "excitingOne"
    case thanksOne = "thanksOne"
    
    func koreanName() -> String {
        switch self {
        case .pleasureOne:
            return "행복"
        case .movedOne:
            return "감동"
        case .excitingOne:
            return "즐거움"
        case .thanksOne:
            return "감사"
        }
    }
}
