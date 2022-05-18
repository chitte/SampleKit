//
//  KudosCardData.swift
//  SampleUIKit
//
//  Created by VeeraSubhash on 23/08/21.
//

import Foundation
import SwiftUI

public struct KudosCardData {
    
    var title1: String
    var title2: NSAttributedString
    var subTitle: String
    var description: String
    var leftIcon: Image

    public init(title1: String, title2: NSAttributedString, subTitle: String, description: String, leftIcon: Image) {
        self.title1 = title1
        self.title2 = title2
        self.subTitle = subTitle
        self.description = description
        self.leftIcon = leftIcon
    }
}
