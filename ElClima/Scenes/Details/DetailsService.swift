//
//  DetailsService.swift
//  ElClima
//
//  Created Mehmet Tarhan on 16.12.2020.
//  Copyright © 2020 memtarhan. All rights reserved.
//

import UIKit
import Alamofire

protocol DetailsService: class {
    func retrieve(forWoeid woeid: Int, _ completionHandler: @escaping (Result<CityDetails, Error>) -> Void)
}

class DetailsServiceImpl: DetailsService {
    
    func retrieve(forWoeid woeid: Int, _ completionHandler: @escaping (Result<CityDetails, Error>) -> Void) {
        let url = "https://www.metaweather.com/api/location/\(woeid)/"
        AF.request(url)
            .responseJSON { response in
                switch response.result {
                case let .success(data):
                    if let value = data as? [String: Any] {
                        let city = CityDetails(value)
                        debugLog(self, city)
                        completionHandler(.success(city))
                    }

                case let .failure(error):
                    debugLog(self, error)
                }
            }
    }
}
