//
//  DataProvider.swift
//  WeatherApp_Test
//
//  Created by Jasur Rajabov on 2/19/21.
//

import Foundation

protocol DataProvoiderType {
    //
}

struct DataProvoider {
    
    static func getData(forLocation: String, completionHandler: @escaping ([WeatherData]?) -> Void) {

        let local = LocalDataProvider()
        
        if forLocation == "London" {
            if let filePath = Bundle.main.path(forResource: "GoogleWeather", ofType: "json") {
                completionHandler(decodeToModel(JSONData: local.getData(path: filePath), type: .google))
            }
        }
        
        if forLocation == "New York" {
            if let filePath = Bundle.main.path(forResource: "OpenWeather", ofType: "json") {
                completionHandler(decodeToModel(JSONData: local.getData(path: filePath), type: .yahoo))
            }
        }
        
        if forLocation == "Moscow" {
            let mock = MockDataProvider()
            completionHandler(mock.getData())
        }
        

        completionHandler(nil)
    }
    
    static private func decodeToModel(JSONData: Data?, type: ServiceType) -> [WeatherData]? {
        
        switch type {
        case .google:
            let service = DecodeData<GoogleData>()
            guard let model = service.decodeToModel(JSONData: JSONData) else { return nil }
            let wdata = model.forecast.map { WeatherData(date: $0.date, temp: $0.temp, condition: $0.condition) }
            return wdata
        case .yahoo:
            let service = DecodeData<YahooData>()
            guard let model = service.decodeToModel(JSONData: JSONData) else { return nil }
            let wdata = model.daily.map { WeatherData(date: $0.dt, temp: $0.temp.day, condition: $0.weather.main) }
            return wdata
        case .yandex:
            return nil
        }
    }
    
}



struct DecodeData<T:Decodable> {
    
    func decodeToModel(JSONData: Data?) -> T? {
        guard let JSONData = JSONData else { return nil }
        do {
            let parsed = try JSONDecoder().decode(T.self, from: JSONData)
            return parsed
        } catch {
            print(error)
            return nil
        }
    }
}

