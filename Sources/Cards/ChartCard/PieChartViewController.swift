//
//  PieChartViewController.swift
//  SampleUIKit
//
//  Created by Veera Subhash on 21/10/21.
//

import UIKit
import Charts

class PieChartViewController: UIViewController {
    
    @IBOutlet var pieChartView: PieChartView!
    
    var requestData: PieChartRequestData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pieChartView = PieChartView()
        pieChartView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width - 100, height: 180)
        pieChartView.backgroundColor = .clear
        view.addSubview(pieChartView)
        
        setChartPieDataSet()
        
    }

    func setChartPieDataSet() {
        
        var LegendEntryList: [LegendEntry] = []
        
        var entries = [PieChartDataEntry]()
        guard let percentageValues = requestData?.outagesPercentage else { return }
        
        for (index, value) in percentageValues.enumerated() {
            let entry = PieChartDataEntry()
            entry.y = Double(value)
            entry.label = requestData?.outagesLables?[index]
            entries.append(entry)
            
            let legend = LegendEntry.init(label: requestData?.legendLabels?[index])
            legend.form = .default
            legend.formSize = CGFloat.nan
            legend.formLineWidth = CGFloat.nan
            legend.formLineDashPhase = CGFloat.nan
            legend.formLineDashLengths = nil
            legend.formColor = requestData?.colorList?[index]
            
            LegendEntryList.append(legend)
        }
        
        let pieChartDataSet = PieChartDataSet( entries: entries, label: "")
        pieChartDataSet.sliceSpace = 2.5
        pieChartDataSet.drawValuesEnabled = false
        
        pieChartDataSet.colors = requestData?.colorList ?? [UIColor.clear]
        
        let data = PieChartData(dataSet: pieChartDataSet)
        pieChartView.data = data
        
        pieChartView.isUserInteractionEnabled = false
        pieChartView.holeRadiusPercent = 0.0
        pieChartView.transparentCircleColor = UIColor.clear
        
        pieChartView.legend.verticalAlignment = .center
        pieChartView.legend.horizontalAlignment = .right
        pieChartView.legend.orientation = .vertical
        pieChartView.legend.yEntrySpace = CGFloat(15)
        pieChartView.legend.formToTextSpace = CGFloat(10.0)
        pieChartView.legend.setCustom(entries: LegendEntryList)
        
        pieChartView.animate(xAxisDuration: 0.0, yAxisDuration: 2.0, easingOption: .easeInOutBack)
        
    }

}
