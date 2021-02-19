//
//  DataProvider.swift
//  WeatherApp_Test
//
//  Created by Jasur Rajabov on 2/19/21.
//

import Foundation

protocol DataProvoiderType {
    func getData(path: String) -> [WeatherData]?
}

struct DataProvoider {
    
    static func getData(from: String, completionHandler: @escaping ([WeatherData]?) -> Void) {
        
        if let filePath = Bundle.main.path(forResource: "GoogleWeather", ofType: "json") {
            let local = LocalDataProvider()
            completionHandler(local.getData(path: filePath))
        }
     
        completionHandler(nil)
    }
}



enum ServiceType {
    case google, yahoo, yandex
}

struct LocalDataProvider: DataProvoiderType {
    
    func getData(path: String) -> [WeatherData]? {
        guard let contentData = FileManager.default.contents(atPath: path) else { return nil }
        let jsonString = String(data:contentData, encoding:String.Encoding.utf8)
        let jsonData = jsonString?.data(using: .utf8)
        return decodeToModel(JSONData: jsonData, type: .google)
    }
    
    private func decodeToModel(JSONData: Data?, type: ServiceType) -> [WeatherData]? {
        let service = DecodeData<GoogleData>()
        guard let gl = service.decodeToModel(JSONData: JSONData) else { return nil }
        let wdata = gl.forecast.map { WeatherData(date: $0.date, temp: $0.temp, condition: $0.condition) }
        return wdata
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



/*
 
 //let model: Location
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
 */
