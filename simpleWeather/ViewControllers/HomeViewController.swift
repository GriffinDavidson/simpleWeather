//
//  HomeViewController.swift
//  simpleWeather
//
//  Created by Griffin Davidson on 5/27/22.
//

import UIKit
import CoreLocation

class HomeViewController: UIViewController {
    
    @IBOutlet weak var degreeLabel: UILabel!
    @IBOutlet weak var phraseLabel: UILabel!
    @IBOutlet weak var precipitationProbabilityLabel: UILabel!
    @IBOutlet weak var phraseImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Loading"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        API.contact.getLocationData { city, error in
            guard let city = city, error == nil else {
                print("Failed to load geographical data!")
                return
            }
            
            API.contact.getWeather(from: city.key) { data, error in
                guard let data = data, error == nil else {
                    print("Failed to load weather data!")
                    return
                }
                
                DispatchQueue.main.async {
                    self.title = city.localizedCityName
                    self.degreeLabel.text = "\(data[0].temperature.value)°\(data[0].temperature.unit)"
                    self.phraseLabel.text = data[0].phrase
                    self.precipitationProbabilityLabel.text = "Chance of rain: \(data[0].precipitationProbability)%"
                    
                    let fixedWeatherIcon = String(format: "%02d", data[0].weatherIcon)
                    
                    let imageURL = URL(string: "https://developer.accuweather.com/sites/default/files/\(fixedWeatherIcon)-s.png")!
                    let imageData = try? Data(contentsOf: imageURL)
                    
                    if let image = imageData {
                        let weatherImage = UIImage(data: image)
                        self.phraseImage.frame = CGRect(
                            x: self.phraseImage.frame.origin.x,
                            y: self.phraseImage.frame.origin.y,
                            width: weatherImage?.size.width ?? 0,
                            height: weatherImage?.size.height ?? 0)
                        self.phraseImage.image = weatherImage
                        
                    }
                    self.phraseImage.frame.origin = CGPoint(
                        x: self.view.frame.width/2 - self.phraseImage.frame.width/2,
                        y: self.phraseImage.frame.midY)
                }
            }
        }
    }
}

