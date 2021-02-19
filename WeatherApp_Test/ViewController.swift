//
//  ViewController.swift
//  WeatherApp_Test
//
//  Created by Jasur Rajabov on 2/19/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var locationName: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    
    let loc = "London"
    
    var dataProvider = DataProvoiderProtocol()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        getData()
    }
    
    
    func getData() {
        let date = dataProvider.getData()
        if let day = date {
            self.updateWeatherData(day: day)
        }
    }
    
    
    @IBAction func nextDay(_ sender: Any) {
        let day = dataProvider.nextDay()
        self.updateWeatherData(day: day)
    }
    
    func updateWeatherData(day: WeatherData) {
        locationName.text = loc
        tempLabel.text = " \( day.temp > 0 ? "+" : "") \(day.temp) C"
        conditionLabel.text = day.condition.rawValue
    }
    
    
    
}

