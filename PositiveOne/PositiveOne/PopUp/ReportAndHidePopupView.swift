//
//  ReportPopupView.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/26.
//

import SwiftUI

struct ReportAndHidePopupView: View {
    
    let reportLists = ["계정 신고", "피드 신고", "계정 가리기", "피드 가리기"]
    @Environment(\.presentationMode) var presentationMode
    @Binding var isPresentedHideView: Bool
    
    var body: some View {
        
        VStack(spacing: 0) {
            Button(action: {
                print("button tapped")
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("")
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-307)
                    .background(Color.black.opacity(0.8))
            })
            
            
            List {
                ForEach(reportLists, id: \.self) { item in
                    Button {
                        switch item {
                        case "계정 가리기":
                            Report.shared.reportType = .user
                            
                        case "피드 가리기":
                            Report.shared.reportType = .feed
                       
                        default:
                            break
                        }
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.5) {
                            isPresentedHideView.toggle()
                            presentationMode.wrappedValue.dismiss()
                        }
                        
                    } label: {
                        Text(item)
                            .padding(.leading, 17)
                            .foregroundColor(item=="계정 신고" || item=="피드 신고" ? .Custom.Red : .Custom.Black60)
                            .font(CustomFont.PretendardSemiBold(size: 16).font)
                            .frame(height: 75)
                    }
                    .frame(height: 75)
                    .buttonStyle(PlainButtonStyle())
                    .scrollContentBackground(.hidden)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: -10))
                    .listRowSeparatorTint(.Custom.Black40)
                    .scrollDisabled(true)
                    
                }
            }
            // .disabled(true)
            .frame(width: 390, height: 307)
            
            .listStyle(.plain)
            .cornerRadius(10)
            .padding(.bottom, 10)
        }
        
        
        // ZStack
        .edgesIgnoringSafeArea(.all)
        //        .fullScreenCover(isPresented: $isPresentedHidePopupView) {
        //            HidePopupView(reportType: reportType)
        //                .clearModalBackground()
        //        }
        //.ignoresSafeArea()
        
    }
}

struct ReportAndHidePopupView_Previews: PreviewProvider {
    static var previews: some View {
        ReportAndHidePopupView(isPresentedHideView: .constant(true))
    }
}
