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
    @IBOutlet weak var tableView: UITableView!
    
    let loc = "London"
    
    private let viewModel = ViewModel()
    private let dataService: DataProvoiderType = LocalDataProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.register(DayCell.self, forCellReuseIdentifier: "DayCell")
        
        
        
        viewModel.fetchWeatherData { _ in
            DispatchQueue.main.async {
                //self.setupViews()
                print("updateWeatherData()")
                self.updateWeatherData(day: self.viewModel.data[0])
            }
        }
        
    }
    
    
    func updateWeatherData(day: WeatherData) {
        locationName.text = loc
        tempLabel.text = " \( day.temp > 0 ? "+" : "") \(day.temp) C"
        conditionLabel.text = day.condition.rawValue
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DayCell") as! DayCell
        print(viewModel.data[indexPath.row].date)
        cell.labelDay.text = viewModel.data[indexPath.row].date
        cell.labelTemp.text = "\(viewModel.data[indexPath.row].temp) C"
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(viewModel.data[indexPath.row].date)
        self.updateWeatherData(day: viewModel.data[indexPath.row])
    }
}

