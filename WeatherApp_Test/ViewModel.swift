//
//  ViewModel.swift
//  WeatherApp_Test
//
//  Created by Jasur Rajabov on 2/19/21.
//

import Foundation

class ViewModel {
    
    var data: [WeatherData] = []
    
    func fetchWeatherData(location: String, completion: @escaping ([WeatherData]?) -> Void) {
        
        DataProvoider.getData(forLocation: location) { (listData) in
            if let data = listData {
                self.data = data
                completion(data)
            }
        }
    }
    
    func updateUnit(to: String, completion: () -> Void) {
        if to == "°F" {
            data = data.map { WeatherData(date: $0.date, temp: ($0.temp*9/5)+32, condition: $0.condition) }
        }
        if to == "°C" {
            data = data.map { WeatherData(date: $0.date, temp: ($0.temp-32)*5/9, condition: $0.condition) }
        }
        
        completion()
    }

}
