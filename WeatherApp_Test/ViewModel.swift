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
    
    private let dataService: DataServiceType
    
    
    
    
    
    private func getLocalModels() -> [ServerData]? {
        guard let filePath = Bundle.main.path(forResource: "servers", ofType: "json")
            else { return nil }
        
        return dataService.getJSONData(filePath: filePath)
    }
    
}
