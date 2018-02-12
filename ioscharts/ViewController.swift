//
//  ViewController.swift
//  ioscharts
//
//  Created by Dan Beaulieu on 2/11/18.
//  Copyright © 2018 Dan Beaulieu. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {
  
    @IBOutlet weak var lineChartView: LineChartView!
    
    @IBAction func randomize(_ sender: UIButton) {
        let count = Int(arc4random_uniform(20) + 3)
        setChartValues(count)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setChartValues()
    }

    func setChartValues(_ count : Int = 20) {
        let values = (0..<count).map { (i) -> ChartDataEntry in
            let val = Double(arc4random_uniform(UInt32(count)) + 3)
            return ChartDataEntry(x: Double(i), y: val)
        }
        
        let set1 = LineChartDataSet(values: values, label: "DataSet 1")
        let data = LineChartData(dataSet: set1)
        
        self.lineChartView.data = data
        
    }

}

