//
//  ProfileCardData.swift
//  SampleUIKit
//
//  Created by Veera Subhash on 13/09/21.
//

import Foundation
import SwiftUI

public struct ProfileCardData {
    
    var profileImage: Image?
    var profileImageURLString: String?
    var width: CGFloat?
    var height: CGFloat?
    var lineWidth: CGFloat
    var shadowRadius: CGFloat
    var strokeColor: Color
    var cornerRadius: CGFloat
    
    public init(profileImage: Image? = nil, profileImageURLString: String? = nil, width: CGFloat? = nil, height: CGFloat? = nil, lineWidth: CGFloat, shadowRadius: CGFloat, strokeColor: Color, cornerRadius: CGFloat) {
        self.profileImage = profileImage
        self.profileImageURLString = profileImageURLString
        self.width = width
        self.height = height
        self.lineWidth = lineWidth
        self.shadowRadius = shadowRadius
        self.strokeColor = strokeColor
        self.cornerRadius = cornerRadius
    }
    
    public init(profileImage: Image?,  profileImageUrlString: String?) {
        self.init(profileImage: profileImage, profileImageURLString: profileImageUrlString, width: 38, height: 38, lineWidth: 0, shadowRadius: 0, strokeColor: .clear, cornerRadius: SampleTheme.imageCornerRadius)
    }
}


