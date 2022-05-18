//
//  ChartCardView.swift
//  SampleUIKit
//
//  Created by Veera Subhash on 19/10/21.
//

import SwiftUI
import Charts
import UIKit

public struct ChartCardView: View {
    
    public var chartCardData: ChartCardData
    public var pieChartRequestData: PieChartRequestData?
    public var barChartRequestData: BarChartRequestData?
    
    @State static var indexVal: Int = 1
    
    public init(chartCardData: ChartCardData, pieChartRequestData: PieChartRequestData? = nil, barChartRequestData: BarChartRequestData? = nil) {
        self.chartCardData = chartCardData
        self.pieChartRequestData = pieChartRequestData
        self.barChartRequestData = barChartRequestData
    }
    
    public static func createPieChartCard(data: ChartCardData, pieChartRequestData: PieChartRequestData) -> ChartCardView {
        var chartData = ChartCardData(chartIcon: data.chartIcon, title: data.title, subTitle: data.subTitle)
        chartData.chartType = .pie
//        indexVal = 4
        return ChartCardView(chartCardData: chartData, pieChartRequestData: pieChartRequestData)
    }
    
    public static func createBarChartCard(data: ChartCardData, barChartRequestData: BarChartRequestData) -> ChartCardView {
        var chartData = ChartCardData(chartIcon: data.chartIcon, title: data.title, subTitle: data.subTitle)
        chartData.chartType = .bar
        return ChartCardView(chartCardData: chartData, barChartRequestData: barChartRequestData)
    }
    
    public var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            
            HStack {
                chartCardData.chartIcon
                
                Text(chartCardData.title ?? "")
                    .font(SampleTheme.font.title)
                    .foregroundColor(SampleTheme.color.titleColor)
                
                Spacer()
                Text(chartCardData.subTitle ?? "")
                    .font(SampleTheme.font.subtitle)
                    .foregroundColor(SampleTheme.color.subtitleColor)
            }
            
            if pieChartRequestData != nil {
                VStack(alignment: .center, spacing: 10) {
                    
                    HStack(alignment: .center) {
                        Text("Concentrix")
                            .font(SampleTheme.font.infoText)
                            .foregroundColor(SampleTheme.color.subtitleColor)
                        
                        PieChartViewControllerViewWithXIB(pieChartRequestData: pieChartRequestData!)
                    }
                    
                    DashedProgressIndicator(numberOfPages: 3, curSlideIndex: ChartCardView.$indexVal)
                }
            }
            
            if barChartRequestData != nil {
                BarChartViewControllerViewWithXIB(barChartRequestData: barChartRequestData!)
            }
                        
        }
        .padding([.leading, .trailing], 10)
        .padding([.top, .bottom], 10)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: -5)

    }

}

struct ChartCardView_Previews: PreviewProvider {
    static var previews: some View {
        
        let outagesLables = ["36", "1", "6", "4"]
        let outagesPercentage = [50.0, 16.0, 17.0, 17.0]
        let legendLabels = ["<= 10 Mins", "11 - 20 Mins", "21 - 30 Mins", ">30 Mins"]
        
        let color1 = UIColor(red: 0.3373, green: 0.4431, blue: 0.7373, alpha: 1)
        let color2 = UIColor(red: 0.3490, green: 0.6824, blue: 0.7569, alpha: 1)
        let color3 = UIColor(red: 0.4941, green: 0.3647, blue: 0.6157, alpha: 1)
        let color4 = UIColor(red: 0.9255, green: 0.7294, blue: 0.4000, alpha: 1)
        let colorList = [color1, color2, color3, color4]
        
        let pieChartData = PieChartRequestData(outagesLables: outagesLables, outagesPercentage: outagesPercentage, legendLabels: legendLabels, colorList: colorList)
        
        let days = ["01 Jul", "05 Jul", "06 Jul", "09 Jul", "10 Jul", "13 Jul", "17 Jul", "22 Jul", "23 Jul"]
        let update = [6.0, 5.0, 7.0, 5.0, 4.0, 5.0, 4.0, 6.0, 3.0]
        let new = [3.0, 0, 3.0, 0, 0, 0.0, 6.0, 0.0, 0.0]

        let updateColor = UIColor(red: 0.3490, green: 0.6824, blue: 0.7569, alpha: 1)
        let newColor = UIColor(red: 0.3373, green: 0.4431, blue: 0.7373, alpha: 1)
        
        let barChartData = BarChartRequestData(days: days, update: update, new: new, updateColor: updateColor, newColor: newColor)
        
        ChartCardView(chartCardData: ChartCardData(chartIcon: Image(systemName: "paperplane.circle"), title: "IT Outages", subTitle: "24 hrs"), pieChartRequestData: pieChartData, barChartRequestData: barChartData)
            .background(SampleTheme.color.imageButtonBgColor)
            .cornerRadius(SampleTheme.cardCornerRadius)
    }
}
