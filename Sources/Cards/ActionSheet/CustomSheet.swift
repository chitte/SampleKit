//
//  CustomSheet.swift
//  SampleUIKit
//
//  Created by Barath K on 03/02/22.
//

import SwiftUI
import Combine

public struct CustomSheet: View {
    
    @State var offset = UIScreen.main.bounds.height
    @Binding var isShowing: Bool
    
    let contentView: AnyView
    let heightToDisappear = UIScreen.main.bounds.height
    let cellHeight: CGFloat = 50
    let backgroundColor: Color
    let hasCloseButton: Bool
        
    public init(
        isShowing: Binding<Bool>,
        contentView: AnyView,
        backgroundColor: Color = Color.white,
        closeButton: Bool = false
    ) {
        hasCloseButton = closeButton
        _isShowing = isShowing
        self.contentView = contentView
        self.backgroundColor = backgroundColor
    }
    
    public var body: some View {
        
        Group {
            if isShowing {
                outOfFocusArea
                sheetView
                    .padding(.bottom, -20)
            }
        }
        .animation(.default)
        .onReceive(Just(isShowing), perform: { isShowing in
            offset = isShowing ? 0 : heightToDisappear
        })
    }
    
    
    var sheetView: some View {
        VStack {
            Spacer()
            VStack {
                contentView
                Text("").frame(height: 20) // empty space
            }
            .background(backgroundColor)
            .cornerRadius(15)
            .offset(y: offset)
            .gesture(interactiveGesture)
            .onTapGesture {
                hide()
            }
        }
    }
       
    var outOfFocusArea: some View {
        Group {
            if isShowing {
                GreyOutOfFocusView {
                    self.isShowing = false
                }
            }
        }
    }
    
    var interactiveGesture: some Gesture {
        DragGesture()
            .onChanged({ (value) in
                if value.translation.height > 0 {
                    offset = value.location.y
                }
            })
            .onEnded({ (value) in
                let diff = abs(offset-value.location.y)
                if diff > 100 {
                    hide()
                }
                else {
                    offset = 0
                }
            })
    }
    
    func hide() {
        offset = heightToDisappear
        isShowing = false
    }
}


