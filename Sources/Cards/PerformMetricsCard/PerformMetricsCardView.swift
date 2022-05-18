//
//  PerformMetricsCardView.swift
//  SampleUIKit
//
//  Created by Office Account on 08/11/21.
//

import SwiftUI

public struct PerformMetricsCardView: View {
   
    public var matricCardDatas: [MetricsCardData] = []
    
    public init(matricCardDatas: [MetricsCardData]) {
        self.matricCardDatas = matricCardDatas
    }
    
   public var body: some View {
        VStack(spacing: 10) {
            HStack {
                let titleViewData = getTitleViewData()
                titleViewData.chartIcon
                
                Text(titleViewData.title ?? "")
                    .font(SampleTheme.font.title)
                    .foregroundColor(SampleTheme.color.titleColor)
                
                Spacer()
                Text(titleViewData.subTitle ?? "")
                    .font(SampleTheme.font.subtitle)
                    .foregroundColor(SampleTheme.color.subtitleColor)
            }
            HStack() {
                Image(systemName: "mappin.circle")
                Button(action: {
                    print("Drop down button action")
                }){
                    Text("Gurgaon Bldg 14,Gurugram") // DROP DOWN BUTTON TITLE
                        .font(Font.system(size: 13))
                    Image(systemName: "chevron.down")
                }
                .padding(7)
                .foregroundColor(SampleTheme.color.lightGrayColor)
                .background(SampleTheme.color.body1Color.opacity(0.4))
                .cornerRadius(5)
                
                
                Spacer()
                Button(action: {}, label: {
                    HStack {
                        Image(systemName: "person.2")
                        Text("10518") // PEOPLE COUNT
                    }
                    .foregroundColor(SwiftUI.Color.black)
                })
                
            }
            
            VStack {
                HStack {
                    MetricsCard(metricsData: matricCardDatas[0])
                    MetricsCard(metricsData: matricCardDatas[1])
                }
                HStack {
                    MetricsCard(metricsData: matricCardDatas[2])
                    MetricsCard(metricsData: matricCardDatas[3])
                }
            }
            HStack {
                Spacer()
                Text("*As of Jun 28, 2021").foregroundColor(SwiftUI.Color.gray).italic() // DATE
                    .font(Font.system(size: 12))
            }
        }
        .padding()
        .background(SwiftUI.Color.white)
        .cornerRadius(SampleTheme.cardCornerRadius)
    }
    
    private func getTitleViewData() -> ChartCardData {
       return ChartCardData(chartIcon: Image(systemName: "paperplane.circle"), title: "Performance Metrics", subTitle: "Total to Month")
    }
    
    
}

struct PerformMetricsCardView_Previews: PreviewProvider {
    
    @State static var matricData  = [
    
    MetricsCardData(title1: "On Time Start Rate", title2: "56.7", title3: "-37% |", bottomText: "* Target = 90%", rightArrowIcon: Image(systemName: "arrowshape.turn.up.forward.circle"), bgColor: Color(hex: "5068b5")),
    MetricsCardData(title1: "New Hire Attrition", title2: "4.0", title3: "-80% |", bottomText: "* Target = 40%", rightArrowIcon: Image(systemName: "arrowshape.turn.up.forward.circle"), bgColor: Color(hex: "4024a5")),
    MetricsCardData(title1: "Production Attrition", title2: "2.7", title3: "-55% |", bottomText: "* Target = 6%", rightArrowIcon: Image(systemName: "arrowshape.turn.up.forward.circle"), bgColor: Color(hex: "4048b5")),
    MetricsCardData(title1: "CVA", title2: "88.6", title3: "4.5% |", bottomText: "* Target = 85%", rightArrowIcon: Image(systemName: "arrowshape.turn.up.forward.circle"), bgColor: Color(hex: "3558b5"))

]
    
    static var previews: some View {
        PerformMetricsCardView(matricCardDatas: matricData)
            .previewLayout(.sizeThatFits)
    }
}
