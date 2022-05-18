//
//  TimeLineCardData.swift
//  SampleUIKit
//
//  Created by Veera Subhash on 31/08/21.
//

import Foundation
import SwiftUI


public enum CardStyle {
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

public enum InfoButtonStyle {
    case threeDots
    case info
    case none
    
    var imageName: String {
        switch self {
        case .threeDots:
            return "moreIcon"
        case .info:
            return "infoIcon"
        case .none:
            return ""
        }
    }
}

public enum ActionCardItem {
    case share
    case like
    case view
    case comment
    case bookmark
    case liked
    
    var imageName: String {
        switch self {
        case .share:
            return "feed-share"
        case .like:
            return "feed-like"
        case .view:
            return "feed-view"
        case .comment:
            return "feed-comment"
        case .bookmark:
            return "feed-bookmark"
        case .liked:
            return "feed-liked"
        }
    }
}

public enum ActionCardItemAlignment {
    case left
    case right
}

public typealias ActionCardIconCallBack = () -> Void
public typealias ActionCardTextCallBack = () -> Void

public struct ActionBarItem {
    var itemType: ActionCardItem?
    var itemAlignment: ActionCardItemAlignment?
    var itemText: String?
    var iconAction: ActionCardIconCallBack?
    var textAction: ActionCardTextCallBack?
    var isTappable: Bool?
    
    public init(itemType: ActionCardItem?, itemAlignment: ActionCardItemAlignment?, itemText: String?, iconAction: ActionCardIconCallBack?, textAction: ActionCardTextCallBack?, isTappable: Bool?) {
        self.itemType = itemType
        self.itemAlignment = itemAlignment
        self.itemText = itemText
        self.iconAction = iconAction
        self.textAction = textAction
        self.isTappable = isTappable
    }
}

public struct TimelineCardViewData {
    public init(profileData: ProfileCardData? = nil, postImage: Image? = nil, postImageUrlString: String? = nil, postTitle: String? = nil, postSubTitle: String? = nil, postContent: String? = nil, postSubContent: String? = nil, bottomDescription: String? = nil, postUrl: String? = nil, hasSharedView: Bool = false, cardStyle: CardStyle? = nil, isNewCard: Bool = false, infoButtonStyle: InfoButtonStyle = .threeDots) {
        self.profileData = profileData
        self.postImage = postImage
        self.postImageUrlString = postImageUrlString
        self.postTitle = postTitle
        self.postSubTitle = postSubTitle
        self.postContent = postContent
        self.postSubContent = postSubContent
        self.bottomDescription = bottomDescription
        self.postUrl = postUrl
        self.hasSharedView = hasSharedView
        self.cardStyle = cardStyle
        self.isNewCard = isNewCard
        self.infoButtonStyle = infoButtonStyle
    }
    
    var profileData: ProfileCardData?
    var postImage: Image?
    var postImageUrlString: String?
    var postTitle: String?
    var postSubTitle: String?
    var postContent: String?
    var postSubContent: String?
    var bottomDescription: String?
    var postUrl: String?
    var hasSharedView: Bool = false
    var cardStyle: CardStyle?
    var isNewCard: Bool = false
    var infoButtonStyle: InfoButtonStyle = .threeDots
}

public struct SharedCardViewData {
    var profileData: ProfileCardData?
    var sharedViewContent: String?
    var sharedViewTitle: String?
    var sharedViewSubTitle: String?
    var infoButtonStyle: InfoButtonStyle = .threeDots

    public init(profileData: ProfileCardData?,
                sharedContent: String?,
                sharedTitle: String?,
                sharedSubTitle: String?,
                infoButtonStyle: InfoButtonStyle = .threeDots) {
        
        self.profileData = profileData
        self.sharedViewContent = sharedContent
        self.sharedViewTitle = sharedTitle
        self.sharedViewSubTitle = sharedSubTitle
        self.infoButtonStyle = infoButtonStyle
        
    }
}

//----------- Previous implementation CODES -----------//

//public struct ActionBarViewItem {
//    var itemType: ActionCardItem?
//    var itemAlignment: ActionCardItemAlignment?
//    var itemText: String?
//    var action: ActionCardItemCallBack?
//}


/*
public struct TimelineCardData {
    var profileIcon: ProfileCard?
    var postImage: Image?
    var postTitle: String?
    var postSubTitle: String?
    var postContent: String?
    var postSubContent: String?
    var bottomDescription: String?
    var postUrl: String?
    var isNewCard: Bool = false
    var infoButton: Image?
    var hasSharedView: Bool = false
    var cardStyle: CardStyle?
    
    public init(profileIcon: ProfileCard?, postTitle: String?, postSubTitle: String?, postContent: String?, postSubContent: String?, bottomDescription: String?, postUrl: String?, isNewCard: Bool, infoButton: Image?, postImage: Image?, hasSharedView: Bool, cardStyle: CardStyle? = Optional.none) {
        self.profileIcon = profileIcon
        self.postImage = postImage
        self.postTitle = postTitle
        self.postSubTitle = postSubTitle
        self.postContent = postContent
        self.postSubContent = postSubContent
        self.bottomDescription = bottomDescription
        self.postUrl = postUrl
        self.isNewCard = isNewCard
        self.infoButton = infoButton
        self.hasSharedView = hasSharedView
        self.cardStyle = cardStyle
    }
}

public struct SharedCardData {
    var profileIcon: ProfileCard?
    var infoButton: Image?
    var sharedContent: String?
    var sharedTitle: String?
    var sharedSubTitle: String?
    
    public init(profileIcon: ProfileCard?, infoButton: Image?, sharedTitle: String?, sharedSubTitle: String?, sharedContent: String?) {
        self.profileIcon = profileIcon
        self.infoButton = infoButton
        self.sharedTitle = sharedTitle
        self.sharedSubTitle = sharedSubTitle
        self.sharedContent = sharedContent
    }
}

*/
