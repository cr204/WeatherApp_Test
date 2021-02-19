//
//  ViewModel.swift
//  WeatherApp_Test
//
//  Created by Jasur Rajabov on 2/19/21.
//

import Foundation

protocol ViewModelDelegate {
    func dataLoaded() -> [WeatherData]
}


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
    
    
    
//    private func getLocalModels() -> [ServerData]? {
//        guard let filePath = Bundle.main.path(forResource: "servers", ofType: "json")
//            else { return nil }
//
//        return dataService.getJSONData(filePath: filePath)
//    }
    
}
