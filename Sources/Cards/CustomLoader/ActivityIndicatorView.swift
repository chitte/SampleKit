//
//  ActivityIndicatorView.swift
//  SampleUIKit
//
//  Created by Barath K on 09/02/22.
//

import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {
    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style
    
    func makeUIView(context: UIViewRepresentableContext<ActivityIndicatorView>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicatorView>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}

public struct CustomLoadingView: View {
    
    var isShowing: Bool
    var offsetValue: CGFloat = 100.0
    
    public init(isShow: Bool) {
        self.isShowing = isShow
    }
    
    public var body: some View {
        if #available(iOS 14.0, *) {
            ActivityListView()
                .offset(x: (UIScreen.main.bounds.width - offsetValue) / 2, y: (UIScreen.main.bounds.height - offsetValue) / 2)
        } else {
            ActivityListView()
        }
    }
    
    fileprivate func ActivityListView() -> some View {
        GeometryReader { geometry in
            VStack {
                ActivityIndicatorView(isAnimating: .constant(isShowing), style: .large)
                Text("Loading...")
                    .font(SampleTheme.font.loadingTitle)
                    .foregroundColor(Color(UIColor.darkText))
            }
            .frame(width: 100, height: 100)
            .background(Color.init(red: 168.0/255.0, green: 168.0/255.0, blue: 168.0/255.0))
            .foregroundColor(Color.primary)
            .cornerRadius(8)
            .opacity(self.isShowing ? 1 : 0)
        }
    }
}

struct CustomLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            CustomLoadingView(isShow: true)
        }
    }
}
