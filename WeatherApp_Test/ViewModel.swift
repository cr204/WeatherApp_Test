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


struct ViewModel {
    
    
    
    
    func fetchWeatherData(completion: @escaping ([WeatherData]?) -> Void) {
        
//        NetworkService.getJSON(urlString: Links.hotelList) { (listData: [HotelItemData]?) in
//            if let data = listData {
//                self.hotels = data
//                completion(data)
//            }
//        }
        
        DataProvoider.getData(from: "Local") { (listData) in
            if let data = listData {
                print(data)
                completion(nil)
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
