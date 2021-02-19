//
//  Structures.swift
//  WeatherApp_Test
//
//  Created by Jasur Rajabov on 2/19/21.
//

import Foundation

enum ConditionType: String, CodingKey{
    case sunny = "Sunny"
    case cloud = "Cloudy"
    case rain = "Rainy"
    case snow = "Snowing"
}

struct WeatherData {
    let date: String
    let temp: Int
    let condition: ConditionType
    
    init(date: String, temp: Int, condition: ConditionType) {
        self.date = date
        self.temp = temp
        self.condition = condition
    }
}

struct Location {
    let name: String
    let weather: [WeatherData]
}


struct GoogleData: Decodable {
    let city: String
    let temp: [Temperature]
    
    struct Temperature: Decodable {
        let date: String
        let temp: Int
        let condition: String
    }
}
