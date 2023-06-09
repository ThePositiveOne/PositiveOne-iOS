//
//  WritingView.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/13.
//

import SwiftUI

struct WritingView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var calendarManager: CalendarManager
    @State var selectedType: PositiveOneType?
    @State var content: String = ""
    @State var isLocked: Bool = false
    @State var isWritingButtonDisabled = false
    @State var isPresentedPopupView = false
    let boardId: Int?
    @ObservedObject var viewModel: WritingViewModel
    @State var isSuccessPost: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 12, height: 12)
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
                        isWritingButtonDisabled = true
                        isPresentedPopupView = true
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
                .onChange(of: isLocked) { newValue in
                    print("$isLocked \(newValue)")
                }
            
            Spacer()
        }
        .onAppear (perform : UIApplication.shared.hideKeyboard)
        .onReceive(NotificationCenter.default.publisher(for: .successPost)) { _ in
            presentationMode.wrappedValue.dismiss()
        }
        .fullScreenCover(isPresented: $isPresentedPopupView, content: {
            if let request = getRequest() {
                WritingPopupView(viewModel: viewModel, isPresentedPopupView: $isPresentedPopupView, request: request, boardId: boardId)
                    .clearModalBackground()
            }
        })
        .edgesIgnoringSafeArea(.bottom)
    }
    
    func getRequest() -> CalendarRequest? {
        guard let selectedType = selectedType,
              let date = calendarManager.selectedDayDDYYMM() else {
            return nil
        }
        let request = CalendarRequest(
            text: content,
            stamp: selectedType.rawValue,
            secret: isLocked,
            date: date
        )
        let _ = print(request)
       return request
    }
    
}

struct WritingView_Previews: PreviewProvider {
    static var previews: some View {
        WritingView(boardId: nil, viewModel: WritingViewModel())
    }
}
