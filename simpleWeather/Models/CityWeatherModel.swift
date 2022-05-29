//
//  OneHourWeatherModel.swift
//  simpleWeather
//
//  Created by Griffin Davidson on 5/28/22.
//

import Foundation

struct CityWeatherData: Codable {
    enum CodingKeys: String, CodingKey {
        case date = "DateTime"
        case epochTime = "EpochDateTime"
        case weatherIcon = "WeatherIcon"
        case phrase = "IconPhrase"
        case hasPrecipitation = "HasPrecipitation"
        case isDaylight = "IsDaylight"
        case temperature = "Temperature"
        case precipitationProbability = "PrecipitationProbability"
        case mobileLink = "MobileLink"
        case link = "Link"
    }
    
    let date: String
    let epochTime: Int
    let weatherIcon: Int
    let phrase: String
    let hasPrecipitation: Bool
    let isDaylight: Bool
    let temperature: Temperature
    let precipitationProbability: Int
    let mobileLink: String
    let link: String
}

struct Temperature: Codable {
    enum CodingKeys: String, CodingKey {
        case value = "Value"
        case unit = "Unit"
        case unitType = "UnitType"
    }
    
    let value: Int
    let unit: String
    let unitType: Int
}
