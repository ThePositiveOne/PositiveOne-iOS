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
            return Font.custom("Pretendard-Black", fixedSize: size)
        case .PretendardBold(size: let size):
            return Font.custom("Pretendard-Bold", fixedSize: size)
        case .PretendardExtraBold(size: let size):
            return Font.custom("Pretendard-ExtraBold", fixedSize: size)
        case .PretendardExtraLight(size: let size):
            return Font.custom("Pretendard-ExtraLight", fixedSize: size)
        case .PretendardLight(size: let size):
            return Font.custom("Pretendard-Light", fixedSize: size)
        case .PretendardMedium(size: let size):
            return Font.custom("Pretendard-Medium", fixedSize: size)
        case .PretendardRegular(size: let size):
            return Font.custom("Pretendard-Regular", fixedSize: size)
        case .PretendardSemiBold(size: let size):
            return Font.custom("Pretendard-SemiBold", fixedSize: size)
        case .PretendardThin(size: let size):
            return Font.custom("Pretendard-Thin", fixedSize: size)
        case .gangwon(size: let size):
            return Font.custom("GangwonEduPowerExtraBold", fixedSize: size)
        }
    }
}
