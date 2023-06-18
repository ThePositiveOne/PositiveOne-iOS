//
//  WritingView.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/13.
//

import SwiftUI

struct WritingView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var selectedType: PositiveOneType?
    @State var content: String = ""
    @State var isLocked: Bool = false
    @ObservedObject var viewModel: WritingViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark")
                }
                .foregroundColor(Color.Custom.Black70)
                .frame(width: 12, height: 12)
                
                Spacer()
                Text("기록하기")
                    .font(CustomFont.PretendardSemiBold(size: 18).font)
                    .foregroundColor(.Custom.Black90)
                    .padding(.leading, 46.5)
                    
                Spacer()
                
                Button {
                    if selectedType != nil && !content.isEmpty {
                        guard let selectedType = selectedType else {
                            return
                        }
                        let request = CalendarRequest(
                            text: content,
                            stamp: selectedType.rawValue,
                            lock: isLocked
                        )
                        viewModel.postBoard(request: request)
                        presentationMode.wrappedValue.dismiss()
                    }
                } label: {
                    Text("작성")
                        .font(CustomFont.PretendardMedium(size: 14).font)
                        .foregroundColor(.white)
                        .padding(.horizontal, 18)
                        .padding(.vertical, 8)
                        .background(
                            selectedType != nil && !content.isEmpty
                            ? Color.Custom.PositiveYellow : Color.Custom.Black30)
                        .cornerRadius(4)
                }

            }
            .frame(width: UIScreen.main.bounds.width-40)
           

            TextEditorView(content: $content)
                .padding(.top, 49)
            
            StampSelectView(selectedType: $selectedType)
                .padding(.top, 60)
            
            LockView(isLocked: $isLocked)
                .padding(.top, 60)
            
            Spacer()
        }
        .onAppear (perform : UIApplication.shared.hideKeyboard)
        .edgesIgnoringSafeArea(.bottom)
    }
    
}

struct WritingView_Previews: PreviewProvider {
    static var previews: some View {
        WritingView(viewModel: WritingViewModel())
    }
}
