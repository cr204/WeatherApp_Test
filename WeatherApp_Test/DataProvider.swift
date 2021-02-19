//
//  DataProvider.swift
//  WeatherApp_Test
//
//  Created by Jasur Rajabov on 2/19/21.
//

import Foundation

protocol DataProvoiderType {
    func getWeatherData(path: String) -> [WeatherData]?
}

//protocol MockDataType: DataProvoiderType {
//    func getLocalJSONData(filePath: String) -> [WeatherData]?
//}
//
//protocol LocalJSONData: DataProvoiderType {
//    func getLocalJSONData(filePath: String) -> [WeatherData]?
//}
//
//protocol ServerJSONData: DataProvoiderType {
//    func getLocalJSONData(filePath: String) -> [WeatherData]?
//}

enum ServiceType {
    case google, yahoo, yandex
}



struct LocalDataProvider: DataProvoiderType {
//    let days: [WeatherData]?
    
    func getWeatherData(path: String) -> [WeatherData]? {
        guard let contentData = FileManager.default.contents(atPath: path) else { return nil }
        let jsonString = String(data:contentData, encoding:String.Encoding.utf8)
        let jsonData = jsonString?.data(using: .utf8)
        return decodeToModel(JSONData: jsonData, type: .google)
    }
    
    /*     private func decodeToModel(JSONData: Data?) -> [WeatherData]? {
            guard let JSONData = JSONData else { return nil }
            do {
                let parsed = try JSONDecoder().decode(ServersResultData.self, from: JSONData)
                return parsed.content
            } catch {
                print(error)
                return nil
            }
        }
     */

    private func decodeToModel(JSONData: Data?, type: ServiceType) -> [WeatherData]? {
        
        //let model: Location
        switch type {
        case .google:
            let service = DecodeData<GoogleData>()
            guard let gl = service.decodeToModel(JSONData: JSONData) else { return nil }
            print(gl)
            //model = Location(name: gl.city, weather: GoogleData.Temperature(date: gl.temp., temp: <#T##Int#>, condition: <#T##String#>))
        case .yahoo:
            return nil
        case .yandex:
            return nil
        }
        
        //        let decodedData = DecodeData
        //        guard let parsedData = DecodeData. else { return nil }
        return nil
        
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





// MOCK data provider
struct MockDataProvider: DataProvoiderType {
    let day1 = WeatherData(date: "march 1", temp: 3, condition: .sunny)
    let day2 = WeatherData(date: "march 2", temp: 4, condition: .sunny)
    let day3 = WeatherData(date: "march 3", temp: -2, condition: .snow)
    let day4 = WeatherData(date: "march 4", temp: 0, condition: .rain)
    let day5 = WeatherData(date: "march 5", temp: -1, condition: .rain)
    let day6 = WeatherData(date: "march 6", temp: 3, condition: .sunny)
    let day7 = WeatherData(date: "march 7", temp: 5, condition: .sunny)
    
    func getWeatherData(path: String) -> [WeatherData]? {
        return [day1, day2, day3, day4, day5, day6, day7]
    }
}




//    mutating func nextDay() -> WeatherData {
//        guard let days = days else { return WeatherData(date: "march 1", temp: 0, condition: .cloud) }
//        index += 1
//        if index > days.count-1 {
//            index = 0
//        }
//        return days[index]
//    }
