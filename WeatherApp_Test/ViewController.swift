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
    @IBOutlet weak var btnUnit: UIButton!
    
    private let viewModel = ViewModel()
    private let dataService: DataProvoiderType = LocalDataProvider()
    private var currUnit: String = "°C"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.register(DayCell.self, forCellReuseIdentifier: "DayCell")
        
        self.getWeather(city: "London")
        
    }
    
    
    @IBAction func onBtn1Tapped(_ sender: Any) {
        self.getWeather(city: "New York")
    }
    
    @IBAction func onBtn2Tapped(_ sender: Any) {
        self.getWeather(city: "London")
    }
    
    @IBAction func onBtn3Tapped(_ sender: Any) {
        self.getWeather(city: "Moscow")
    }
    
    @IBAction func onUnitTapped(_ sender: UIButton) {
        guard let label = sender.titleLabel?.text else { return }
        viewModel.updateUnit(to: label) {
            currUnit = label == "°C" ? "°F" : "°C"
            btnUnit.setTitle(currUnit, for: .normal)
            self.tableView.reloadData()
        }
    }
    
    func getWeather(city: String) {
        viewModel.fetchWeatherData(location: city) { _ in
            DispatchQueue.main.async {
                self.locationName.text = city
                self.updateWeatherData(day: self.viewModel.data[0])
                self.tableView.reloadData()
            }
        }
    }
    
    func updateWeatherData(day: WeatherData) {
        tempLabel.text = " \( day.temp > 0 ? "+" : "") \(day.temp) \(currUnit)"
        conditionLabel.text = day.condition.rawValue
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DayCell") as! DayCell
        cell.labelDay.text = viewModel.data[indexPath.row].date
        cell.labelTemp.text = "\(viewModel.data[indexPath.row].temp) \(currUnit)"
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.updateWeatherData(day: viewModel.data[indexPath.row])
    }
}

