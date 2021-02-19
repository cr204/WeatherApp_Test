//
//  MockDataProvider.swift
//  WeatherApp_Test
//
//  Created by Jasur Rajabov on 2/19/21.
//

import Foundation

protocol MockDataProviderType: DataProvoiderType {
    func getData() -> [WeatherData]?
}


// MOCK data provider
struct MockDataProvider: MockDataProviderType {
    let day1 = WeatherData(date: "march 1", temp: 3, condition: .sunny)
    let day2 = WeatherData(date: "march 2", temp: 4, condition: .sunny)
    let day3 = WeatherData(date: "march 3", temp: -2, condition: .snow)
    let day4 = WeatherData(date: "march 4", temp: 0, condition: .rain)
    let day5 = WeatherData(date: "march 5", temp: -1, condition: .rain)
    let day6 = WeatherData(date: "march 6", temp: 3, condition: .sunny)
    let day7 = WeatherData(date: "march 7", temp: 5, condition: .sunny)
    
    func getData() -> [WeatherData]? {
        return [day1, day2, day3, day4, day5, day6, day7]
    }
}
