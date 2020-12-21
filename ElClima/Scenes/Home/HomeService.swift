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
    func retrieveCurrentCity(withLatitude: Double, longitude: Double, _ completionHandler: @escaping (Result<CityDetailsResponse, Error>) -> Void)
}

class HomeServiceImpl: HomeService {
    func retrieveCurrentCity(withLatitude latitude: Double, longitude: Double, _ completionHandler: @escaping (Result<CityDetailsResponse, Error>) -> Void) {
        let url = "https://www.metaweather.com/api/location/search/?lattlong=\(latitude),\(longitude)"
        AF.request(url)
            .responseJSON { response in
                switch response.result {
                case let .success(data):
                    if let values = data as? [[String: Any]],
                       let value = values.first {
                        let currentCityResponse = CurrentCityResponse(value)
                        guard let woeid = currentCityResponse.woeid else {
                            // TODO: Handle error
                            return
                        }
                        self.retrieveDetails(forWoeid: woeid) { detailsResult in
                            switch detailsResult {
                            case let .success(detailsData):
                                completionHandler(.success(detailsData))
                            case let .failure(detailsError):
                                debugLog(self, detailsError)
                            }
                        }
                        debugLog(self, currentCityResponse)
                    }

                case let .failure(error):
                    debugLog(self, error)
                }
            }
    }

    private func retrieveDetails(forWoeid woeid: Int, _ completionHandler: @escaping (Result<CityDetailsResponse, Error>) -> Void) {
        let url = "https://www.metaweather.com/api/location/\(woeid)/"
        AF.request(url)
            .responseJSON { response in
                switch response.result {
                case let .success(data):
                    if let value = data as? [String: Any] {
                        let city = CityDetailsResponse(value)
                        debugLog(self, city)
                        completionHandler(.success(city))
                    }

                case let .failure(error):
                    debugLog(self, error)
                }
            }
    }
}

struct CurrentCityResponse {
    let title: String?
    let woeid: Int?
    let type: String?
    let distance: Int?

    init(_ data: [String: Any]) {
        title = data["title"] as? String
        woeid = data["woeid"] as? Int
        type = data["location_type"] as? String
        distance = data["distance"] as? Int
    }
}

struct CityDetailsResponse {
    let title: String?
    let timezone: String?
    var weatherStates: [WeatherResponse]?

    init(_ data: [String: Any]) {
        title = data["title"] as? String
        timezone = data["timezone"] as? String
        if let consolidatedWeather = data["consolidated_weather"] as? [[String: Any]] {
            weatherStates = consolidatedWeather.map({ (weather) -> WeatherResponse in
                WeatherResponse(weather)
            })
        }
    }
}

struct WeatherResponse {
    let weatherName: String?
    let weatherAbbreviation: String?
    let temperature: Double?
    var iconURL: String?

    init(_ data: [String: Any]) {
        weatherName = data["weather_state_name"] as? String
        weatherAbbreviation = data["weather_state_abbr"] as? String
        temperature = data["the_temp"] as? Double
        if let abbr = weatherAbbreviation {
            iconURL = "https://www.metaweather.com/static/img/weather/png/\(abbr).png"
        }
    }
}
