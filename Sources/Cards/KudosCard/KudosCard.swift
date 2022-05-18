//
//  KudosCard.swift
//  SampleUIKit
//
//  Created by VeeraSubhash on 23/08/21.
//

import SwiftUI

public struct KudosCard: View {
    
    //The data source for kudos card
    var kudosData: KudosCardData
    
    public init(kudosData: KudosCardData) {
        self.kudosData = kudosData
    }
    
    public static func createKudosCard(cardData: KudosCardData) -> KudosCard {
        let data = KudosCardData(title1: cardData.title1, title2: cardData.title2, subTitle: cardData.subTitle, description: cardData.description, leftIcon: cardData.leftIcon)
        return KudosCard(kudosData: data)
    }
    
    public var body: some View {
        
        HStack(spacing: 5) {
            
            Image.createImageFromSampleUIKit(with: "kudos-thumb-bg")
                .resizable()
                .scaledToFit()
                .frame(width: 77, height: 130)
                .background(SampleTheme.color.kudosThumbBgColor)
                        
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 5) {
                    Text(kudosData.title1)
                        .font(SampleTheme.font.title)
                        .foregroundColor(SampleTheme.color.titleColor)
                    
                    Text(kudosData.title2)
                        .font(SampleTheme.font.subtitle)
                        .foregroundColor(SampleTheme.color.subtitleColor)
                }
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(kudosData.subTitle)
                        .font(SampleTheme.font.title)
                        .foregroundColor(SampleTheme.color.titleColor)
                    
                    Text(kudosData.description)
                        .font(SampleTheme.font.subtitle)
                        .foregroundColor(SampleTheme.color.subtitleColor)
                }
            }
            .padding(.all, 10)
            Spacer()
        }
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: -5)
        
    }
}

struct KudosCard_Previews: PreviewProvider {
    static var previews: some View {
        let data = KudosCardData(title1: "Wow! You got a new kudos", title2: NSAttributedString(), subTitle: "Concentrix Hero", description: "Highly passionate and creative with out of box thought process", leftIcon: Image("kudosCard"))
        KudosCard(kudosData: data)
    }
}
