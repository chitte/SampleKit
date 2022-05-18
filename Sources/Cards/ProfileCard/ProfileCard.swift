//
//  ProfileCard.swift
//  SampleUIKit
//
//  Created by Veera Subhash on 02/09/21.
//

import SwiftUI

public struct ProfileCard: View {
    
    var profileCardData: ProfileCardData
    
    public init(profileCardData: ProfileCardData) {
        self.profileCardData = profileCardData
    }
        
    public var body: some View {
        
        profileCardData.profileImage?
            .resizable()
            .scaledToFill()
            .aspectRatio(contentMode: .fit)
            .frame(width: profileCardData.width, height: profileCardData.height)
            .clipShape(Rectangle())
            .overlay(Rectangle().stroke(profileCardData.strokeColor, lineWidth: profileCardData.lineWidth))
            .shadow(radius: profileCardData.shadowRadius)
            .cornerRadius(profileCardData.cornerRadius)
        
    }
}

struct ProfileCard_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCard(profileCardData: ProfileCardData(profileImage: Image(systemName: "pencil.tip.crop.circle"), width: 75, height: 75, lineWidth: 4, shadowRadius: 10, strokeColor: .gray, cornerRadius: SampleTheme.imageCornerRadius))
    }
}
