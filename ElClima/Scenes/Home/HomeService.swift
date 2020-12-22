//
//  HomeService.swift
//  ElClima
//
//  Created Mehmet Tarhan on 15.12.2020.
//  Copyright © 2020 memtarhan. All rights reserved.
//

import Alamofire
import UIKit

protocol HomeService: class {
    /**
     Retrieves current city

     - Parameter latitude: The current location's latitude
     - Parameter latitude: The current location's longitude

     - Returns: A city model `recipient`.
     */
    func retrieveCurrentCity(withLatitude latitude: Double, longitude: Double, _ completionHandler: @escaping (Result<[CityModel], Error>) -> Void)
    
    /**
     Retrieves details of the current city

     - Parameter woeid: Where on earth identifier

     - Returns: A city details model `recipient`.
     */
    func retrieveDetails(forWoeid woeid: Int, _ completionHandler: @escaping (Result<CityDetails, Error>) -> Void)
}

class HomeServiceImpl: HomeService {
    func retrieveCurrentCity(withLatitude latitude: Double, longitude: Double, _ completionHandler: @escaping (Result<[CityModel], Error>) -> Void) {
        let url = "https://www.metaweather.com/api/location/search/?lattlong=\(latitude),\(longitude)"
        AF.request(url)
            .responseJSON { response in
                switch response.result {
                case let .success(data):
                    if let values = data as? [[String: Any]] {
                        let cityModels = values.map { (value) -> CityModel in
                            CityModel(value)
                        }

                        completionHandler(.success(cityModels))
                    }

                case let .failure(error):
                    debugLog(self, error)
                }
            }
    }

    func retrieveDetails(forWoeid woeid: Int, _ completionHandler: @escaping (Result<CityDetails, Error>) -> Void) {
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
