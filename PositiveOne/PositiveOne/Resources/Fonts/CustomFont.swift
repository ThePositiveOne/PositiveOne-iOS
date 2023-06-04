//
//  Font.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/04.
//

import Foundation
import SwiftUI

public enum CustomFont {
    case PretendardBlack(size: CGFloat)
    case PretendardBold(size: CGFloat)
    case PretendardExtraBold(size: CGFloat)
    case PretendardExtraLight(size: CGFloat)
    case PretendardLight(size: CGFloat)
    case PretendardMedium(size: CGFloat)
    case PretendardRegular(size: CGFloat)
    case PretendardSemiBold(size: CGFloat)
    case PretendardThin(size: CGFloat)
    case gangwon(size: CGFloat)
}

extension CustomFont {
    public var font: Font {
        switch self {
        case .PretendardBlack(size: let size):
            return Font.custom("PretendardBlack", size: size)
        case .PretendardBold(size: let size):
            return Font.custom("PretendardBold", size: size)
        case .PretendardExtraBold(size: let size):
            return Font.custom("PretendardExtraBold", size: size)
        case .PretendardExtraLight(size: let size):
            return Font.custom("PretendardExtraLight", size: size)
        case .PretendardLight(size: let size):
            return Font.custom("PretendardLight", size: size)
        case .PretendardMedium(size: let size):
            return Font.custom("PretendardMedium", size: size)
        case .PretendardRegular(size: let size):
            return Font.custom("PretendardRegular", size: size)
        case .PretendardSemiBold(size: let size):
            return Font.custom("PretendardSemiBold", size: size)
        case .PretendardThin(size: let size):
            return Font.custom("PretendardThin", size: size)
        case .gangwon(size: let size):
            return Font.custom("gangwon", size: size)
        }
    }
}
