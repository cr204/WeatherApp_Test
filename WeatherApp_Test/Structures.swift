//
//  Structures.swift
//  WeatherApp_Test
//
//  Created by Jasur Rajabov on 2/19/21.
//

import Foundation

enum ConditionType: String, CodingKey, Decodable {
    case sunny = "Sunny"
    case cloud = "Cloudy"
    case rain = "Rainy"
    case snow = "Snowing"
}

enum ServiceType {
    case google, yahoo, yandex
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
    let forecast: [Temperature]

    struct Temperature: Decodable {
        let date: String
        let temp: Int
        let condition: ConditionType
        let unit: String
    }
}

struct YahooData: Decodable {
    let city: String
    let daily: [Temperature]

    struct Temperature: Decodable {
        struct Temp: Decodable {
            let day: Int
        }
        
        struct Weather: Decodable {
            let main: ConditionType
        }
        let dt: String
        let temp: Temp
        let weather: Weather
        let unit: String
    }
}
