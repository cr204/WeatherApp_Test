//
//  LocalDataProvider.swift
//  WeatherApp_Test
//
//  Created by Jasur Rajabov on 2/20/21.
//

import Foundation

protocol LocalDataProviderType: DataProvoiderType {
    func getData(path: String) -> Data?
}


struct LocalDataProvider: LocalDataProviderType {
    
    func getData(path: String) -> Data? {
        guard let contentData = FileManager.default.contents(atPath: path) else { return nil }
        let jsonString = String(data:contentData, encoding:String.Encoding.utf8)
        let jsonData = jsonString?.data(using: .utf8)
        return jsonData
    }
    
}
