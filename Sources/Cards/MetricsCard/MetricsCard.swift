//
//  MetricsCard.swift
//  SampleUIKit
//
//  Created by Veera Subhash on 02/09/21.
//

import SwiftUI

public struct MetricsCard: View {
    
    var metricsData: MetricsCardData
    
    public init(metricsData: MetricsCardData) {
        self.metricsData = metricsData
    }
    
    public static func createMetricsCard(cardData: MetricsCardData) -> MetricsCard {
        let data = MetricsCardData(title1: cardData.title1, title2: cardData.title2, title3: cardData.title3, bottomText: cardData.bottomText, rightArrowIcon: cardData.rightArrowIcon, bgColor: cardData.bgColor)
        return MetricsCard(metricsData: data)
    }
    
    public var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            
            Text(metricsData.title1)
                .font(SampleTheme.font.infoText)
                        
            HStack(spacing: 10) {
                Text(metricsData.title2)
                    .font(SampleTheme.font.bigTitle)
                Text(metricsData.title3)
                    .font(SampleTheme.font.infoText)
            }
            
            HStack(spacing: 20) {
                Spacer()
                Text(metricsData.bottomText)
                    .font(SampleTheme.font.smallTitle)
            }
            
        }
        .padding([.top, .bottom, .leading, .trailing], 10)
        .background(metricsData.bgColor)
        .foregroundColor(.white)
        .cornerRadius(SampleTheme.buttonCornerRadius)
        
    }
}

struct MetricsCard_Previews: PreviewProvider {
    static var previews: some View {
        let data = MetricsCardData(title1: "On Time Start Rate", title2: "56.7", title3: "-37% |", bottomText: "* Target = 90%", rightArrowIcon: Image(systemName: "arrowshape.turn.up.forward.circle"), bgColor: Color(hex: "5068b5"))
        MetricsCard.createMetricsCard(cardData: data)
            .frame(width: 175)
    }
}
