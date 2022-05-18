//
//  FeatureCardData.swift
//  SampleUIKit
//
//  Created by Shruthi Vittal on 12/08/21.
//

import Foundation
import SwiftUI

public enum IndexType {
    case none
    case even
    case odd
}

public enum ActionButtonType {
    case none
    case info
    case toggle
    case arrow
    case checkbox
}

public struct FeatureCardData {
    
    var isDraggable: Bool = false
    var dragIcon: Image?
    var leftIcon: Image?
    var title: String
    var subTitle: String?
    var infoTextIcon: Image?
    var infoText: String?
    var urlLink: URL?
    var actionButtonType: ActionButtonType?
    var indexType: IndexType?
    
    public init(isDraggable: Bool, leftIcon: Image?, dragIcon: Image?, title: String, subTitle: String?, infoTextIcon: Image?, infoText:String?, urlLink: URL?, actionButtonType: ActionButtonType? = Optional.none, indexType: IndexType? = Optional.none) {
        self.isDraggable = isDraggable
        self.dragIcon = dragIcon
        self.leftIcon = leftIcon
        self.title = title
        self.subTitle = subTitle
        self.infoTextIcon = infoTextIcon
        self.infoText = infoText
        self.urlLink = urlLink
        self.actionButtonType = actionButtonType
        self.indexType = indexType
    }
    
}
