//
//  ActionBarWithIconAndText.swift
//  SampleUIKit
//
//  Created by Veera Subhash on 16/09/21.
//

import SwiftUI

struct ActionBarWithIconAndText: View {
  
    var actionBarData: ActionBarItem!
    
    var body: some View {
                
        switch actionBarData.itemType {
        case .share, .like, .comment , .view, .bookmark, .liked:
           actionBarNewView()
        default:
           Spacer()
        }
    }
    
    @ViewBuilder
    func actionBarNewView() -> some View {
        HStack(alignment: .center, spacing: 2) {
            Image.createImageFromSampleUIKit(with: actionBarData.itemType?.imageName ?? "")
                .onTapGesture {
                    if actionBarData.isTappable == true {
                        if let buttonAction = actionBarData.iconAction {
                            buttonAction()
                        }
                    }
                }
            Text(actionBarData.itemText ?? "")
                .font(SampleTheme.font.button)
                .frame(width: 30, height: 25)
                .onTapGesture {
                    if actionBarData.isTappable == true {
                        if let buttonAction = actionBarData.textAction {
                            buttonAction()
                        }
                    }
                }
        }
        .padding([.leading, .top, .bottom], 10)
        .frame(height: 25, alignment: .center)
    }
    
    /*
    @ViewBuilder
    func actionBarView() -> some View {
        HStack(spacing: 25) {
            HStack(alignment: .center, spacing: 2) {
                Image.createImageFromSampleUIKit(with: "feed-like")
                    .onTapGesture {
//                        likeButtonAction()
                    }
                Text(actionBarData.itemText ?? "")
                    .font(SampleTheme.font.button)
                    .frame(width: 30, height: 25)
                    .onTapGesture {
//                        likeCountAction()
                    }
            }
            
            HStack(alignment: .center, spacing: 2) {
                Image.createImageFromSampleUIKit(with: "feed-view")
                    .onTapGesture {
//                        viewButtonAction()
                    }
                Text(actionBarData.itemText ?? "")
                    .font(SampleTheme.font.button)
                    .frame(width: 30, height: 25)
                    .onTapGesture {
//                        viewCountAction()
                    }
            }
            
            HStack(alignment: .center, spacing: 2) {
                Image.createImageFromSampleUIKit(with: "feed-comment")
                    .onTapGesture {
//                        commentButtonAction()
                    }
                Text(actionBarData.itemText ?? "")
                    .font(SampleTheme.font.button)
                    .frame(width: 25, height: 25)
                    .onTapGesture {
//                        commentCountAction()
                    }
            }
            
            HStack(alignment: .center, spacing: 2) {
                Image.createImageFromSampleUIKit(with: "feed-share")
                    .onTapGesture {
//                        shareButtonAction()
                    }
                Text(actionBarData.itemText ?? "")
                    .font(SampleTheme.font.button)
                    .frame(width: 30, height: 25)
                    .onTapGesture {
//                        shareCountAction()
                    }
            }
        }
        .padding([.leading, .top, .bottom], 10)
        .frame(height: 25, alignment: .center)
    }
    
    @ViewBuilder
    func actionBarViewForBirthday() -> some View {
        HStack(spacing: 25) {
            HStack(alignment: .center, spacing: 2) {
                Image.createImageFromSampleUIKit(with: "feed-like")
                    .onTapGesture {
//                        likeButtonAction()
                    }
                Text(actionBarData.itemText ?? "")
                    .font(SampleTheme.font.button)
                    .frame(width: 30, height: 25)
                    .onTapGesture {
//                        likeCountAction()
                    }
            }
            
            HStack(alignment: .center, spacing: 2) {
                Image.createImageFromSampleUIKit(with: "feed-comment")
                    .onTapGesture {
//                        commentButtonAction()
                    }
                Text(actionBarData.itemText ?? "")
                    .font(SampleTheme.font.button)
                    .frame(width: 25, height: 25)
                    .onTapGesture {
//                        commentCountAction()
                    }
            }
        }
        .padding([.leading, .top, .bottom], 10)
        .frame(height: 25, alignment: .center)
    }
    
    */
}



//struct ActionBarWithIconAndText_Previews: PreviewProvider {
//    static var previews: some View {
//        ActionBarWithIconAndText {
//            print("Hello")
//        }
//    }
//}
