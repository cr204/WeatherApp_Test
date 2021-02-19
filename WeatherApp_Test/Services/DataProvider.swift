//
//  DataProvider.swift
//  WeatherApp_Test
//
//  Created by Jasur Rajabov on 2/19/21.
//

import Foundation

protocol DataProvoiderType {
    func getData(path: String, serviceType: ServiceType) -> [WeatherData]?
}

enum ServiceType {
    case google, yahoo, yandex
}


struct DataProvoider {
    
    static func getData(forLocation: String, completionHandler: @escaping ([WeatherData]?) -> Void) {

//        let mock = MockDataProvider()
//        completionHandler(mock.getData(path: ""))


        if forLocation == "London" {
            if let filePath = Bundle.main.path(forResource: "GoogleWeather", ofType: "json") {
                let local = LocalDataProvider()
                completionHandler(local.getData(path: filePath, serviceType: .google))
            }
        }
        
        if forLocation == "New York" {
            if let filePath = Bundle.main.path(forResource: "OpenWeather", ofType: "json") {
                let local = LocalDataProvider()
                completionHandler(local.getData(path: filePath, serviceType: .yahoo))
            }
        }
        

        completionHandler(nil)
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
