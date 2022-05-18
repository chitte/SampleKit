//
//  CustomLoader.swift
//  SampleUIKit
//
//  Created by Barath K on 09/02/22.
//

import SwiftUI
import Combine

public struct CustomLoader: View {
    
    @Binding var isShowing: Bool
    @State var offset = UIScreen.main.bounds.height

    let contentView: AnyView
    let backgroundColor: Color
    let heightToDisappear = UIScreen.main.bounds.height

    public init(
        isShowing: Binding<Bool>,
        contentView: AnyView,
        backgroundColor: Color = Color.white) {
        _isShowing = isShowing
        self.contentView = contentView
        self.backgroundColor = backgroundColor
    }
    
    
    public var body: some View {
        ZStack(alignment: .center) {
            if isShowing {
                contentView
            }
        }
    }
    
}
