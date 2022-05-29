//
//  APICaller.swift
//  simpleWeather
//
//  Created by Griffin Davidson on 5/27/22.
//

import Foundation
//import CoreLocation

class API
{
    static let contact = API()
    
    func getLocationData(latitude: Double = 24.55305,
                         longitude: Double = -81.78889,
                         _ completion: @escaping(LocationData?, Error?) -> Void)
    {
        let url = URL(string: "https://dataservice.accuweather.com/locations/v1/cities/geoposition/search?apikey=\(apikey)&q=\(latitude),\(longitude)&details=false")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil, error)
                return
            }
            do {
                let result = try JSONDecoder().decode(LocationData.self, from: data)
                completion(result, nil)
            }
            catch {
                print(error)
                return
            }
        }
        .resume()
    }

    func getWeather(from city: String,
                    _ completion: @escaping([CityWeatherData]?, Error?) -> Void)
    {
        let url = URL(string: "https://dataservice.accuweather.com/forecasts/v1/hourly/1hour/\(city)?apikey=\(apikey)")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil, error)
                return
            }
            
            do {
                let result = try JSONDecoder().decode([CityWeatherData].self, from: data)
                completion(result, nil)
            }
            catch {
                print(error)
                return
            }
        }
        .resume()
    }
}
