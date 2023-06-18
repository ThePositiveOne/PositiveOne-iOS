//
//  NavigationBackItem.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/16.
//

import SwiftUI

struct NavigationBackItem: View {

    @Environment(\.dismiss) private var dismiss
    var title : String = ""

    var body: some View {
        Button {
            dismiss()
        } label: {
            HStack {
                Image(systemName: "chevron.left")
                    .foregroundColor(.Custom.Black70)
            }
        }
    }
}
