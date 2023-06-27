//
//  WebView.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/27.
//

import SwiftUI
import WebKit

struct MyWebView: UIViewRepresentable {
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
    
    var urlToLoad: String
    
    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: self.urlToLoad) else {
            return WKWebView()
        }
      
        let webView = WKWebView()
        webView.load(URLRequest(url: url))
        return webView
    }
}

struct MyWebView_Previews: PreviewProvider {
    static var previews: some View {
        MyWebView(urlToLoad: "https://www.naver.com")
    }
}
