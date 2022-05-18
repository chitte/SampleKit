//
//  ActionBarWithIconAndTextData.swift
//  SampleUIKit
//
//  Created by Veera Subhash on 12/10/21.
//

import Foundation
import SwiftUI

public enum ActionCardStyle {
    case text
    case image
    case video
    case url
    case checkIn
    case polls
    case birthday
    case anniversary
    case none
}

public struct ActionBarData {
    var likeCount: String?
    var viewCount: String?
    var commentCount: String?
    var shareCount: String?
    var cardStyle: ActionCardStyle?
    
    public init(likeCount: String?, viewCount: String?, commentCount: String?, shareCount: String?, cardStyle: ActionCardStyle? = Optional.none) {
        self.likeCount = likeCount
        self.viewCount = viewCount
        self.commentCount = commentCount
        self.shareCount = shareCount
        self.cardStyle = cardStyle
    }
}
