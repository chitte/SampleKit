//
//  CustomAlert.swift
//  SampleUIKit
//
//  Created by Barath K on 09/03/22.
//

import SwiftUI

public struct CustomButton {
    var id = UUID()
    var title: String
    var primaryColor: Color = Color.black
    
    public init(title: String, color: Color = Color.black) {
        self.title = title
        self.primaryColor = color
    }
}

public struct CustomAlert: View {
    
    @Binding var isShowing: Bool
    
    var message: String
    var title: String
    var customButtons:[CustomButton]
    var backgroundColor: Color = Color.white
    var textColor: Color = Color.black
    var borderColor: Color = .gray
    
    public typealias OKButtonCallBack = () -> Void
    public var OkActionCallBack: OKButtonCallBack?
    
    public init(isShowing: Binding<Bool>, title:String,message: String, customButtons:[CustomButton], backgroundColor: Color = .white, foregroundColor: Color = .black,borderColor: Color = .gray, OkActionCallBack: OKButtonCallBack? = nil) {
        self.message = message
        self.title = title
        self.OkActionCallBack = OkActionCallBack
        _isShowing = isShowing
        self.customButtons = customButtons
        self.backgroundColor = backgroundColor
        self.textColor = foregroundColor
        self.borderColor = borderColor
    }
    
    public var body: some View {
        ZStack(alignment: .center) {
            contentView
        }
    }
    
    var contentView: some View {
        VStack {
            Text(title)
                .foregroundColor(self.textColor)
                .padding(.top, 20)
            Spacer()
            Text(message)
                .foregroundColor(self.textColor)
            Spacer()
            Divider()
            HStack {
                ForEach(customButtons, id: \.title) { result in
                    Button(action: {
                        isShowing = false
                        if let OkActionCallBack = OkActionCallBack {
                            OkActionCallBack()
                        }
                    }){
                        Text("\(result.title)")
                    }.frame(width: UIScreen.main.bounds.width/2-30, height: 40)
                    .foregroundColor(result.primaryColor)
                }
            }
        }.frame(width: UIScreen.main.bounds.width-50, height: 200)
        .background(self.backgroundColor.opacity(0.97))
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(self.borderColor, lineWidth: 1)
        )
    }
}
