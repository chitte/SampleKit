//
//  ChartCardData.swift
//  SampleUIKit
//
//  Created by Veera Subhash on 19/10/21.
//

import UIKit
import SwiftUI

public enum ChartType {
    case pie
    case bar
}

public struct ChartCardData {
    var chartIcon: Image?
    var title: String?
    var subTitle: String?
    var chartType: ChartType = .pie
    
    public init(chartIcon: Image?, title: String?, subTitle: String?) {
        self.chartIcon = chartIcon
        self.title = title
        self.subTitle = subTitle
    }
}

public struct PieChartRequestData {
    var outagesLables: [String]?
    var outagesPercentage: [Double]?
    var legendLabels: [String]?
    var colorList: [UIColor]?
    
    public init(outagesLables: [String]?, outagesPercentage: [Double]?, legendLabels: [String]?, colorList: [UIColor]?) {
        self.outagesLables = outagesLables
        self.outagesPercentage = outagesPercentage
        self.legendLabels = legendLabels
        self.colorList = colorList
    }
}

struct PieChartViewControllerViewWithXIB: UIViewControllerRepresentable {
    
    let pieChartRequestData: PieChartRequestData
    
    func makeUIViewController(context: Context) -> PieChartViewController {
        let pieChartVC = PieChartViewController()
        pieChartVC.requestData = pieChartRequestData
        return pieChartVC
    }

    func updateUIViewController(_ uiViewController: PieChartViewController, context: Context) {
        // update code
    }
}


public struct BarChartRequestData {
    var days: [String]?
    var update: [Double]?
    var new: [Double]?
    var updateColor: UIColor
    var newColor: UIColor
    
    public init(days: [String]?, update: [Double]?, new: [Double]?, updateColor: UIColor, newColor: UIColor) {
        self.days = days
        self.update = update
        self.new = new
        self.updateColor = updateColor
        self.newColor = newColor
    }
}

struct BarChartViewControllerViewWithXIB: UIViewControllerRepresentable {
    
    let barChartRequestData: BarChartRequestData
    
    func makeUIViewController(context: Context) -> BarChartViewController {
        let barChartVC = BarChartViewController()
        barChartVC.requestData = barChartRequestData
        return barChartVC
    }

    func updateUIViewController(_ uiViewController: BarChartViewController, context: Context) {
        // update code
    }
}
