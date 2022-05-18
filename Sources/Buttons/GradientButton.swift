//
//  GradientButton.swift
//  SampleUIKit
//
//  Created by Shruthi Vittal on 12/08/21.
//

import SwiftUI

struct GradientBackgroundStyle: ButtonStyle {
 
    var startColor: Color
    var endColor: Color
    var strokeColor: Color
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .leading, endPoint: .trailing).opacity(configuration.isPressed ? 0.5 : 1))
            .cornerRadius(SampleTheme.buttonCornerRadius)
//            .padding(.horizontal, 10)
            .shadow(radius: SampleTheme.buttonCornerRadius)
            .font(SampleTheme.font.infoText)
            .overlay(
                RoundedRectangle(cornerRadius: SampleTheme.buttonCornerRadius)
                    .stroke(strokeColor, lineWidth: 1)
//                    .padding(.horizontal, 10)
            )
    }
}

public struct GradientButton: View {
    public var title: String
    public var startColor: Color
    public var endColor: Color
    public var strokeColor: Color
    public typealias ButtonCallBack = () -> Void
    public var buttonAction: ButtonCallBack

    public init(title: String, startColor: Color, endColor: Color, strokeColor: Color, action: @escaping ButtonCallBack) {
        self.title = title
        self.startColor = startColor
        self.endColor = endColor
        self.strokeColor = strokeColor
        self.buttonAction = action
    }
    
    public var body: some View {
        Button(title, action: buttonAction)
            .buttonStyle(GradientBackgroundStyle(startColor: startColor, endColor: endColor, strokeColor: strokeColor))
    }
}

