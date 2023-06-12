//
//  FeedView.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/08.
//

import SwiftUI

struct FeedView: View {
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "GangwonEduPowerExtraBold", size: 20)!]
    }
    
    var body: some View {
        ZStack {
            NavigationView {
             
                List {
                    Text("!")
                    Text("2")
                }
                
                
                .navigationBarTitle("긍정하나", displayMode: .inline)
                .toolbar {
                    ToolbarItem {
                        Image(systemName: "gearshape")
                            .foregroundColor(Color.Custom.Black70)
                    }
                }
               
                
            }
            
        }
        
        
    }
    
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
