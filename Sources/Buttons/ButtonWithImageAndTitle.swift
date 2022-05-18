//
//  ButtonWithImageAndTitle.swift
//  SampleUIKit
//
//  Created by VeeraSubhash on 24/08/21.
//

import SwiftUI

public struct ButtonWithImageAndTitle: View {
    
    public var image: Image
    public var title: String
    public typealias ButtonCallBack = () -> Void
    public var buttonAction: ButtonCallBack
    
    public init(image: Image, title: String, action: @escaping ButtonCallBack) {
        self.image = image
        self.title = title
        self.buttonAction = action
    }
    
    public var body: some View {
        
        Button(action: buttonAction) {
            HStack(alignment: .center) {
                image
                    .resizable()
                    .renderingMode(.original)
                    .scaledToFit()
                    .frame(width: 14, height: 14, alignment: .center)
                    .padding([.leading, .trailing, .top, .bottom], 20.0)
                    .background(
                        Rectangle()
                            .fill(SampleTheme.color.background)
                            .frame(width: 28, height: 28)
                            .cornerRadius(6)
                    )
                Text(title)
                    .font(SampleTheme.font.imageButton)
                    .foregroundColor(SampleTheme.color.imageButtonTextColor)
                    .frame(alignment: .leading)
                    Spacer()
            }
        }
        
    }
}

struct ButtonWithImageAndTitle_Previews: PreviewProvider {
    static var previews: some View {
        ButtonWithImageAndTitle(image: Image(systemName: "gift"), title: "Add Photo") {
            print("Action Button Call Back")
        }
    }
}
