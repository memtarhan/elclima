//
//  CityDetails.swift
//  ElClima
//
//  Created by Mehmet Tarhan on 22.12.2020.
//  Copyright © 2020 memtarhan. All rights reserved.
//

import Foundation

struct CityDetails {
    let title: String?
    let type: String?
    let timezone: String?
    var weatherStates: [WeatherModel]?

    init(_ data: [String: Any]) {
        title = data["title"] as? String
        type = data["location_type"] as? String
        timezone = data["timezone"] as? String
        if let consolidatedWeather = data["consolidated_weather"] as? [[String: Any]] {
            weatherStates = consolidatedWeather.map({ (weather) -> WeatherModel in
                WeatherModel(weather)
            })
        }
    }
}

struct WeatherModel {
    let name: String?
    let abbreviation: String?
    let temperature: Double?
    var iconURL: String?
    var date: Date?

    init(_ data: [String: Any]) {
        name = data["weather_state_name"] as? String
        abbreviation = data["weather_state_abbr"] as? String
        temperature = data["the_temp"] as? Double
        if let abbr = abbreviation {
            iconURL = "https://www.metaweather.com/static/img/weather/png/\(abbr).png"
        }

        if let dateString = data["applicable_date"] as? String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM-dd-yyyy"
            self.date = dateFormatter.date(from: dateString)
        }
    }
}
