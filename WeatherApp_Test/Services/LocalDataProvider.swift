//
//  LocalDataProvider.swift
//  WeatherApp_Test
//
//  Created by Jasur Rajabov on 2/20/21.
//

import Foundation

struct LocalDataProvider: DataProvoiderType {
    
    func getData(path: String, serviceType: ServiceType) -> [WeatherData]? {
        guard let contentData = FileManager.default.contents(atPath: path) else { return nil }
        let jsonString = String(data:contentData, encoding:String.Encoding.utf8)
        let jsonData = jsonString?.data(using: .utf8)
        return decodeToModel(JSONData: jsonData, type: serviceType)
    }
    
    private func decodeToModel(JSONData: Data?, type: ServiceType) -> [WeatherData]? {
        
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
