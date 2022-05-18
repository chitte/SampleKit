//
//  TimeLineCard.swift
//  SampleUIKit
//
//  Created by Veera Subhash on 31/08/21.
//

import SwiftUI

public struct TimelineCard: View {
    
    public typealias InfoButtonCallBack = () -> Void
    public typealias CardTapCallBack = () -> Void

    private var timelineCardViewData: TimelineCardViewData
    private var sharedCardViewData: SharedCardViewData
    private var actionBarViewItemDatas: [ActionBarItem]
    
    public var infoButtonTapAction: InfoButtonCallBack
    public var entireCardTapAction: CardTapCallBack?

    public init(timelineCardData: TimelineCardViewData,
                sharedCardData: SharedCardViewData,
                actionBarData: [ActionBarItem],
                infoButtonTapAction: @escaping InfoButtonCallBack,
                cardTapAction: @escaping CardTapCallBack) {
        self.timelineCardViewData = timelineCardData
        self.sharedCardViewData = sharedCardData
        self.actionBarViewItemDatas = actionBarData
        self.infoButtonTapAction = infoButtonTapAction
        self.entireCardTapAction = cardTapAction
    }

    public var body: some View {
        
        switch timelineCardViewData.cardStyle {
        case .image, .video, .text, .birthday, .anniversary, .checkIn, .url:
            imageSharedView()
                .onTapGesture {
                    if let entireCardTapAction = entireCardTapAction {
                        entireCardTapAction()
                    }
                }
            
        case .polls:
            pollSharedView()
            
        case nil:
            Spacer().frame(width: 0)
        case .some(.none):
            Spacer()
        }
        
        
    }
   
    @ViewBuilder
    func pollSharedView() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            
            HStack(spacing: 10) {
                
//                timelineCardViewData.profileData?.profileImage
                URLImageView(urlString: timelineCardViewData.profileData?.profileImageURLString ?? "")
                
                VStack(alignment: .leading, spacing: 3) {
                    Text("Representation of poll votes")
                        .font(SampleTheme.font.title)
                        .foregroundColor(SampleTheme.color.titleColor)
                        .lineLimit(1)
                    Text("10 Sep 11:45:00 PM")
                        .font(SampleTheme.font.subtitle)
                        .foregroundColor(SampleTheme.color.subtitleColor)
                        .lineLimit(1)
                }
                .padding(.bottom, 5)
                
                Spacer(minLength: 5)
                
                VStack(alignment: .trailing, spacing: 0) {
                    
                    Image.createImageFromSampleUIKit(with: (timelineCardViewData.infoButtonStyle.imageName))
                        .resizable()
                        .renderingMode(.original)
                        .frame(width: 28, height: 28)
                        .aspectRatio(contentMode: .fit)
                    
                    if timelineCardViewData.isNewCard {
                        Text("NEW")
                            .padding(4)
                            .font(SampleTheme.font.subtitle)
                            .foregroundColor(Color.white)
                            .background(SampleTheme.color.cardStatusTextBgColor)
                            .cornerRadius(4)
                    }
                }
                
            }
            .padding([.leading, .trailing], 10)
            .padding([.top, .bottom], 5)
            .frame(minHeight: 75)
            
            
            Text("Internal communication - PSAT")
                .font(SampleTheme.font.title)
                .foregroundColor(SampleTheme.color.titleColor)
                .padding([.leading, .trailing, .top, .bottom], 10)
            
            HStack(alignment: .center) {
                Spacer()
                Button(action: {
                    print("Answer Poll Btn Tapped")
                }) {
                    Text("Answer Poll")
                        .font(SampleTheme.font.title)
                        .foregroundColor(SampleTheme.color.titleColor)
                        .foregroundColor(.blue)
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.blue, lineWidth: 2)
                        )
                }
                Spacer()
            }
            
        }
        .padding([.top, .bottom], 10)
        .padding([.leading, .trailing], 10)
//        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: -5)
        
        .onTapGesture {
            if let entireCardTapAction = entireCardTapAction {
                entireCardTapAction()
            }
        }
        
    }
    
    @ViewBuilder
    func imageSharedView() -> some View {
        if timelineCardViewData.hasSharedView == false {
            originalSharedView()
        } else {
            newResharedView()
        }
    }
   
    
    @ViewBuilder
    func originalSharedView() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            
            HStack(spacing: 10) {
                URLImageView(urlString: timelineCardViewData.profileData?.profileImageURLString ?? "")
//                timelineCardViewData.profileData?.profileImage?
                    .frame(width: timelineCardViewData.profileData?.width , height: timelineCardViewData.profileData?.height, alignment: .center)
                    .aspectRatio(1.0, contentMode: .fit)
                    .cornerRadius(5.0)
                    .clipShape(RoundedRectangle(cornerRadius: 5.0, style: .continuous))

                VStack(alignment: .leading, spacing: 3) {
                    Text(timelineCardViewData.postTitle ?? "")
                        .font(SampleTheme.font.title)
                        .foregroundColor(SampleTheme.color.titleColor)
                        //.lineLimit(1)
                    Text(timelineCardViewData.postSubTitle ?? "")
                        .font(SampleTheme.font.subtitle)
                        .foregroundColor(SampleTheme.color.subtitleColor)
                        .lineLimit(nil)
                }
                .padding(.bottom, 5)
                
                Spacer(minLength: 5)
                
                VStack(alignment: .trailing, spacing: 0) {
                    Image.createImageFromSampleUIKit(with: timelineCardViewData.infoButtonStyle.imageName)
                        .resizable()
                        .renderingMode(.original)
                        .frame(width: 28, height: 28)
                        .aspectRatio(contentMode: .fit)
                        .if(timelineCardViewData.infoButtonStyle != .none) { view in
                            view.onTapGesture {
                                infoButtonTapAction()
                            }
                        }
                    
                    if timelineCardViewData.isNewCard {
                        Text("NEW")
                            .padding(4)
                            .font(SampleTheme.font.subtitle)
                            .foregroundColor(Color.white)
                            .background(SampleTheme.color.cardStatusTextBgColor)
                            .cornerRadius(4)
                    }
                }
                
            }
            .padding([.leading, .trailing], 10)
            .padding([.top, .bottom], 5)
            .frame(minHeight: 75)
            
            //////////////////////////////
            
            if let postContent = timelineCardViewData.postContent {
                VStack(alignment: .leading, spacing: 3) {
                    Text(postContent)
                        .font(SampleTheme.font.subtitle1)
                        .foregroundColor(SampleTheme.color.titleColor)
                        .lineLimit(1)
                    if let subContent = timelineCardViewData.postSubContent {
                        Text(subContent)
                            .font(SampleTheme.font.body1)
                            .foregroundColor(SampleTheme.color.subtitleColor)
                            .lineLimit(nil)
                            .padding([.top, .bottom], 5)
                    }
                }
                .padding([.leading, .trailing], 10)
                .padding([.top, .bottom], 5)
            }
            
            if let postImageUrlString = timelineCardViewData.postImageUrlString  {
//                postImage
                URLImageView(urlString: postImageUrlString)
                    .scaledToFit()
                    .cornerRadius(SampleTheme.buttonCornerRadius)
                    .clipShape(RoundedRectangle(cornerRadius: 5.0, style: .continuous))
                    .padding([.leading, .trailing], 10)
                    .padding([.top, .bottom], 5)
            }
            //////////////////////////////
            
            
            if let bottomDescription = timelineCardViewData.bottomDescription {
                Text(bottomDescription)
                    .font(SampleTheme.font.body1)
                    .foregroundColor(SampleTheme.color.subtitleColor)
                    .padding([.leading, .trailing], 10)
                    .padding(.top, 5)
            }
            
            // For URL Post
            if let urlStr = timelineCardViewData.postUrl {
                Text(urlStr)
                    .font(SampleTheme.font.subtitle)
                    .foregroundColor(SampleTheme.color.linkColor)
                    .padding([.leading, .trailing, .top, .bottom], 10)
                    .onTapGesture {
                        UIApplication.shared.open((URL(string: urlStr) ?? URL(string: ""))!)
                    }
            }
            // For URL Post

            actionBarView()
            // .padding([.leading, .trailing], 10)
            
        }
        .padding([.top, .bottom], 10)
        .padding([.leading, .trailing], 10)
//        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: -5)
        
    }
    
    @ViewBuilder
    func newResharedView() -> some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            HStack(spacing: 10) {
//                sharedCardViewData.profileData?.profileImage?
                URLImageView(urlString: sharedCardViewData.profileData?.profileImageURLString ?? "")
                    .frame(width: sharedCardViewData.profileData?.width , height: sharedCardViewData.profileData?.height, alignment: .center)
                    .aspectRatio(1.0, contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 5.0, style: .continuous))
                
                VStack(alignment: .leading, spacing: 3) {
                    Text(sharedCardViewData.sharedViewTitle ?? "")
                        .font(SampleTheme.font.title)
                        .foregroundColor(SampleTheme.color.titleColor)
                        .lineLimit(2)
                    
                    Text(sharedCardViewData.sharedViewSubTitle ?? "")
                        .font(SampleTheme.font.subtitle)
                        .foregroundColor(SampleTheme.color.subtitleColor)
                        .lineLimit(nil)
                }
                
                Spacer(minLength: 5)
                
                VStack(alignment: .trailing, spacing: 0) {
                    Image.createImageFromSampleUIKit(with: sharedCardViewData.infoButtonStyle.imageName)
                        .resizable()
                        .renderingMode(.original)
                        .frame(width: 28, height: 28)
                        .aspectRatio(contentMode:.fit)
                        .if(timelineCardViewData.infoButtonStyle != .none) { view in
                            view.onTapGesture {
                                infoButtonTapAction()
                            }
                        }
                    
                    if timelineCardViewData.isNewCard {
                        Text("NEW")
                            .padding(4)
                            .font(SampleTheme.font.subtitle)
                            .foregroundColor(Color.white)
                            .background(SampleTheme.color.cardStatusTextBgColor)
                            .cornerRadius(4)
                    }
                    
                }
                
            }
            .padding([.leading, .trailing], 10)
            .padding([.top, .bottom], 5)
            .frame(minHeight: 75)
            
            //////////////////////////////
            
            if let sharedText = sharedCardViewData.sharedViewContent {
                Text(sharedText)
                    .padding([.leading, .trailing], 15)
                    .padding([.bottom], 10)
                    .font(SampleTheme.font.subtitle)
                    .foregroundColor(SampleTheme.color.subtitleColor)
                    .cornerRadius(4)
            }
            
            //////////////////////////////
            
            reSharedView()
                .padding([.leading, .trailing], 10)
            
            //////////////////////////////
            
            actionBarView()
            
        }
        .padding([.top, .bottom], 10)
        .padding([.leading, .trailing], 10)
//        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: -5)
        
    }
    
    @ViewBuilder
    func actionBarView() -> some View {
        HStack {
            ForEach(actionBarViewItemDatas.indices, id: \.self){ item in
                ActionBarWithIconAndText(actionBarData: actionBarViewItemDatas[item])
            }
        }
    }
    
    @ViewBuilder
    func reSharedView() -> some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            HStack(spacing: 10) {
//                timelineCardViewData.profileData?.profileImage?
                URLImageView(urlString: timelineCardViewData.profileData?.profileImageURLString ?? "")
                    .frame(width: timelineCardViewData.profileData?.width , height: timelineCardViewData.profileData?.height, alignment: .center)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(5.0)
                
                VStack(alignment: .leading, spacing: 3) {
                    Text(timelineCardViewData.postTitle ?? "")
                        .font(SampleTheme.font.title)
                        .foregroundColor(SampleTheme.color.titleColor)
                        .lineLimit(1)
                    
                    Text(timelineCardViewData.postSubTitle ?? "")
                        .font(SampleTheme.font.subtitle)
                        .foregroundColor(SampleTheme.color.subtitleColor)
                        .lineLimit(nil)
                }
                .padding(.bottom, 5)
                
                Spacer(minLength: 5)
                
            }
            .padding([.leading, .trailing], 5)
            .padding([.top, .bottom], 5)
            
//            timelineCardViewData.postImage?
            URLImageView(urlString: timelineCardViewData.postImageUrlString ?? "")
                .scaledToFit()
                .cornerRadius(SampleTheme.buttonCornerRadius)
                .padding([.leading, .trailing], 5)
                .padding([.top, .bottom], 5)
            
        }
        .padding([.top, .bottom], 10)
        .padding([.leading, .trailing], 10)
//        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: -5)
        .overlay(
            RoundedRectangle(cornerRadius: SampleTheme.cardCornerRadius)
                .stroke(SampleTheme.color.sharedViewBorderColor, lineWidth: 1)
        )
        
    }
}


struct TimeLineCard_Previews: PreviewProvider {
    
    
    static func getProfileCardData() -> ProfileCardData {
        return ProfileCardData(profileImage: Image(systemName: "person.crop.circle.badge.checkmark"), profileImageUrlString: nil)
    }
    
   static func getTimeLineCardData() -> TimelineCardViewData {
        
        let publisherName = "Publisher Name"
        let title2Str = "Posted By" + " " + publisherName + " " + "3" + " " + "hrs" + " " + "ago"
        return TimelineCardViewData(profileData: getProfileCardData(),
                                    postImage: Image(systemName: "giftcard.fill").resizable(),
                                    postTitle: "Post Title Test",
                                    postSubTitle: title2Str,
                                    postContent: "Hope you had a great birthday Charley!",
                                    postSubContent: "🎂 Celebrating a birthday!",
                                    bottomDescription: "Short Description",
                                    postUrl: "https://www.hackingwithswift.com/quick-start/swiftui/how-to-customize-stack-layouts-with-alignment-and-spacing",
                                    hasSharedView: false,
                                    cardStyle: .image,
                                    isNewCard: false, infoButtonStyle: .threeDots)
        
    }
    
   static func getSharedCardData() -> SharedCardViewData {
        let title3Str = "Maya" + " " + "1" + " " + "hr" + " " + "ago"
        return SharedCardViewData(profileData: getProfileCardData(),
                                  sharedContent: "Happy to share it with you all.",
                                  sharedTitle: "Jithendra Article shared by K Barath ",
                                  sharedSubTitle: "This is the reshared content description", infoButtonStyle: .none)
    }
    
    static func getActionBarData() -> [ActionBarItem] {
        return [
            ActionBarItem(itemType: .like, itemAlignment: .left, itemText: "12", iconAction: {
                print("Like button action")
            }, textAction: {
                print("Like count action")
            }, isTappable: true),
            
            ActionBarItem(itemType: .share, itemAlignment: .left, itemText: "45", iconAction: {
                print("Share button action")
            }, textAction: {
                print("Share count action")
            }, isTappable: true)
        ]
    }
    
    static var previews: some View {
   
        TimelineCard(timelineCardData: getTimeLineCardData(), sharedCardData: getSharedCardData(), actionBarData: getActionBarData(), infoButtonTapAction: {
            print("Info button action")
        }, cardTapAction: {
            print("card tap action")
        })
        .background(SwiftUI.Color.white)
        .cornerRadius(SampleTheme.cardCornerRadius)
    
        /*
        let profileData1 = ProfileCardData(profileImage: Image(systemName: "person.crop.circle.badge.checkmark"), width: 50, height: 50, lineWidth: 0, shadowRadius: 0, strokeColor: .clear, cornerRadius: SampleTheme.imageCornerRadius)
        
        let title2Str = "Posted By" + " " + "Veera" + " " + "3" + " " + "hrs" + " " + "ago"
        let timelineCardData = TimelineCardData(profileIcon: ProfileCard(profileCardData: profileData1),
                                                postTitle: "Yoga to regain strength post COVID-19",
                                                postSubTitle: title2Str,
                                                postContent: "Hope you had a great birthday Charley!",
                                                postSubContent: "🎂 Celebrating a birthday!",
                                                bottomDescription: "Spotify gains Siri support",
                                                postUrl: "https://www.hackingwithswift.com/quick-start/swiftui/how-to-customize-stack-layouts-with-alignment-and-spacing",
                                                isNewCard: true,
                                                infoButton: Image.createImageFromSampleUIKit(with: ("feed-more-icon")),
                                                postImage: Image(systemName: "giftcard.fill").resizable(),
                                                hasSharedView: false,
                                                cardStyle: .image)
                
        let title3Str = "Maya" + " " + "1" + " " + "hr" + " " + "ago"
        let sharedData = SharedCardData(profileIcon: ProfileCard(profileCardData: profileData1),
                                        infoButton: Image.createImageFromSampleUIKit(with: ("feed-more-icon")),
                                        sharedTitle: "Happy to share it with you all.",
                                        sharedSubTitle: title3Str,
                                        sharedContent: "This is the reshared content description")
        
        let actionBarData = ActionBarData(likeCount: "88", viewCount: "46", commentCount: "32", shareCount: "44", cardStyle: .image)
        
        TimelineCard(likeButtonAction: {
            print("Show details for LIKE_Previews")
        }, viewButtonAction: {
            print("Show details for VIEW_Previews")
        }, commentButtonAction: {
            print("Show details for COMMENT_Previews")
        }, shareButtonAction: {
            print("Show details for SHARE_Previews")
        }, likeCountAction: {
            print("likeCount Action_Previews")
        }, viewCountAction: {
            print("viewCount Action_Previews")
        }, commentCountAction: {
            print("commentCount Action_Previews")
        }, shareCountAction: {
            print("shareCount Action_Previews")
        },
        timelineCardData: timelineCardData,
        sharedCardData: sharedData,
        actionBarData: actionBarData,
        infoButtonTapAction: {
            print("Info Button TapAction_Previews")
        })
        .background(SampleTheme.color.imageButtonBgColor)
        .cornerRadius(SampleTheme.cardCornerRadius)
        .frame(width: 335)
        */
              
    }
}

