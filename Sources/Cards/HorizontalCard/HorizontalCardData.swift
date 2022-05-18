//
//  HorizontalCardData.swift
//  SampleUIKit
//
//  Created by VeeraSubhash on 24/08/21.
//

import Foundation
import SwiftUI

public enum ClickableCardType {
    case none
    case arrow
    case toggle
    case checkbox
}

public struct HorizontalCardData {
    var leftIcon: Image?
    var title: String
//    var subTitle: String?
    var width:CGFloat
    var clickableCardType: ClickableCardType?
    
    public init(leftIcon: Image? = nil, title: String, clickableButtonType: ClickableCardType? = Optional.none, width: CGFloat = 39.0) {
        self.leftIcon = leftIcon
        self.title = title
        self.width = width
//        self.subTitle = subTitle
        self.clickableCardType = clickableButtonType
    }
}
