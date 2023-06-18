//
//  TermsOfServiceView.swift
//  CuriousCat
//
//  Created by Artur Marchetto on 18/06/2023.
//

import SwiftUI
import WebKit

struct TermsOfServiceView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        let termsURL = "https://media0.giphy.com/media/13d2jHlSlxklVe/giphy.gif?cid=ecf05e47830na7kksmk42c9g6w7louyed2qtqpzq9qa4zdar&ep=v1_gifs_related&rid=giphy.gif&ct=g"

        guard let url = URL(string: termsURL) else { return }
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
