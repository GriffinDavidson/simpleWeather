//
//  LocationModel.swift
//  simpleWeather
//
//  Created by Griffin Davidson on 5/27/22.
//

import Foundation

struct LocationData: Codable {
    enum CodingKeys: String, CodingKey {
        case version = "Version"
        case key = "Key"
        case type = "Type"
        case rank = "Rank"
        case localizedCityName = "LocalizedName"
        case englishCityName = "EnglishName"
        case postalCode = "PrimaryPostalCode"
        case region = "Region"
        case country = "Country"
        case administrativeArea = "AdministrativeArea"
        case timezone = "TimeZone"
        case geoPosition = "GeoPosition"
        case isAlias = "IsAlias"
        case supplementalAdminAreas = "SupplementalAdminAreas"
        case datasets = "DataSets"
    }
    
    let version: Int
    let key: String
    let type: String
    let rank: Int
    let localizedCityName: String
    let englishCityName: String
    let postalCode: String
    let region: RegionData
    let country: CountryData
    let administrativeArea: AdministrativeData
    let timezone: TimeZoneData
    let geoPosition: GeoPositionData
    let isAlias: Bool
    let supplementalAdminAreas: [SupplementalData]
    let datasets: [String]
}

struct RegionData: Codable {
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case localizedName = "LocalizedName"
        case englishName = "EnglishName"
    }
    
    let id: String
    let localizedName: String
    let englishName: String
}

struct CountryData: Codable {
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case localizedName = "LocalizedName"
        case englishName = "EnglishName"
    }
    
    let id: String
    let localizedName: String
    let englishName: String
}

struct AdministrativeData: Codable { // State / Province
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case localizedName = "LocalizedName"
        case englishName = "EnglishName"
        case level = "Level"
        case localizedType = "LocalizedType"
        case englishType = "EnglishType"
        case countryID = "CountryID"
    }
    
    let id: String
    let localizedName: String
    let englishName: String
    let level: Int
    let localizedType: String
    let englishType: String
    let countryID: String
}

struct TimeZoneData: Codable {
    enum CodingKeys: String, CodingKey {
        case code = "Code"
        case name = "Name"
        case gmtOffset = "GmtOffset"
        case isDaylightSaving = "IsDaylightSaving"
        case nextOffsetChange = "NextOffsetChange"
    }
    
    let code: String
    let name: String
    let gmtOffset: Float
    let isDaylightSaving: Bool
    let nextOffsetChange: String
}

struct GeoPositionData: Codable {
    enum CodingKeys: String, CodingKey {
        case latitude = "Latitude"
        case longitude = "Longitude"
        case elevation = "Elevation"
    }
    let latitude: Float
    let longitude: Float
    let elevation: ElevationData
    
}

struct ElevationData: Codable {
    enum CodingKeys: String, CodingKey {
        case metric = "Metric"
        case imperial = "Imperial"
    }
    let metric: MetricElevationData
    let imperial: ImperialElevationData
}

struct MetricElevationData: Codable {
    enum CodingKeys: String, CodingKey {
        case value = "Value"
        case unit = "Unit"
        case unitType = "UnitType"
    }
    
    let value: Float
    let unit: String
    let unitType: Int
}

struct ImperialElevationData: Codable {
    enum CodingKeys: String, CodingKey {
        case value = "Value"
        case unit = "Unit"
        case unitType = "UnitType"
    }
    
    let value: Float
    let unit: String
    let unitType: Int
}

struct SupplementalData: Codable {
    enum CodingKeys: String, CodingKey {
        case level = "Level"
        case localizedName = "LocalizedName"
        case englishName = "EnglishName"
    }
    
    let level: Int
    let localizedName: String
    let englishName: String
}

