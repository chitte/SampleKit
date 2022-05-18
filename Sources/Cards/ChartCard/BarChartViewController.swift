//
//  BarChartViewController.swift
//  SampleUIKit
//
//  Created by Veera Subhash on 20/10/21.
//

import UIKit
import Charts

class BarChartViewController: UIViewController {

    @IBOutlet var barChartView: BarChartView!
    
    var requestData: BarChartRequestData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        barChartView = BarChartView()
        barChartView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width - 70, height: 180)
        barChartView.backgroundColor = .clear
        view.addSubview(barChartView)
        
        setChartBarGroupDataSet()
    }


    func setChartBarGroupDataSet() {

        var dataEntries: [BarChartDataEntry] = []
        
        guard let barChartData = requestData else { return }
        guard let days = barChartData.days else { return }
        
        for i in 0..<days.count {
            let new = barChartData.new
            let update = barChartData.update
            
            let dataEntry = BarChartDataEntry(x: Double(i), yValues: [new![i], update![i]], data: "groupChart")
            dataEntries.append(dataEntry)
       }

        let chartDataSet = BarChartDataSet(entries: dataEntries, label: " ")
        chartDataSet.colors = [barChartData.updateColor, barChartData.newColor]


        let dataSets: [BarChartDataSet] = [chartDataSet]
        let chartData = BarChartData(dataSets: dataSets)
        chartData.setDrawValues(false)
        chartData.barWidth = 0.65
        barChartView.data = chartData


        barChartView.leftAxis.drawAxisLineEnabled = false
        barChartView.rightAxis.drawAxisLineEnabled = false

        barChartView.leftAxis.drawGridLinesEnabled = false
        barChartView.rightAxis.drawGridLinesEnabled = false
        
        barChartView.leftAxis.drawLabelsEnabled = true
        barChartView.rightAxis.drawLabelsEnabled = false

        barChartView.leftAxis.drawTopYLabelEntryEnabled = true
        barChartView.rightAxis.drawTopYLabelEntryEnabled = false

        barChartView.rightAxis.drawLimitLinesBehindDataEnabled = false
        barChartView.leftAxis.drawLimitLinesBehindDataEnabled = false

        barChartView.rightAxis.drawGridLinesBehindDataEnabled = false
        barChartView.leftAxis.drawGridLinesBehindDataEnabled = false

        barChartView.leftAxis.drawBottomYLabelEntryEnabled = true
        barChartView.leftAxis.granularityEnabled = true
        barChartView.leftAxis.granularity = 5.0

        
        barChartView.xAxis.drawLabelsEnabled = true
        barChartView.xAxis.drawGridLinesEnabled = false
        barChartView.xAxis.drawLimitLinesBehindDataEnabled = false
        barChartView.xAxis.drawGridLinesBehindDataEnabled = false
        barChartView.xAxis.drawAxisLineEnabled = false
        barChartView.xAxis.labelPosition = .bottom
        barChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: days)
        barChartView.xAxis.labelCount = days.count
        barChartView.xAxis.labelFont = UIFont(name: "Helvetica", size: 9.0) ?? UIFont.systemFont(ofSize: 10.0)
        
        let firstLegend = LegendEntry.init(label: "New 9")
        firstLegend.form = .default
        firstLegend.formSize = CGFloat.nan
        firstLegend.formLineWidth = CGFloat.nan
        firstLegend.formLineDashPhase = CGFloat.nan
        firstLegend.formLineDashLengths = nil
        firstLegend.formColor = barChartData.newColor
        
        let secondLegend = LegendEntry.init(label: "Updates 30")
        secondLegend.form = .default
        secondLegend.formSize = CGFloat.nan
        secondLegend.formLineWidth = CGFloat.nan
        secondLegend.formLineDashPhase = CGFloat.nan
        secondLegend.formLineDashLengths = nil
        secondLegend.formColor = barChartData.updateColor
        
        let thirdLegend = LegendEntry.init(label: "Total 39")
        thirdLegend.form = .default
        thirdLegend.formSize = CGFloat.nan
        thirdLegend.formLineWidth = CGFloat.nan
        thirdLegend.formLineDashPhase = CGFloat.nan
        thirdLegend.formLineDashLengths = nil
        thirdLegend.formColor = UIColor.clear
        
        barChartView.legend.setCustom(entries: [firstLegend, secondLegend, thirdLegend])

        barChartView.legend.horizontalAlignment = .left
        barChartView.legend.verticalAlignment = .top
        barChartView.legend.xEntrySpace = CGFloat(60)
        barChartView.legend.formToTextSpace = CGFloat(2.0)
        
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .easeInOutBounce)

    }
}
