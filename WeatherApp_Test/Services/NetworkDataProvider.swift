//
//  NetworkDataProvider.swift
//  WeatherApp_Test
//
//  Created by Jasur Rajabov on 2/20/21.
//

import Foundation

protocol NetworkDataProviderType: DataProvoiderType {
    func getData(path: String) -> Data?
}


struct NetworkDataProvider: NetworkDataProviderType {
    
    func getData(path: String) -> Data? {
        // Get data from internet
        return nil
    }
    
}
