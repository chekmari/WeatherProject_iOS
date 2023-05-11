//
//  WeatherAPI.swift
//  WeatherProject
//
//  Created by macbook on 07.04.2023.
//

import Foundation

class WeatherAPI {
    
    let apiKey = "4867b26381f2a25b952d9d926a2c393f"
    
    func fetchWeatherData(latitude: Double, longitude: Double, completion: @escaping (Result<OpenWeatherMapResponse, Error>) -> Void) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)"
        let url = URL(string: urlString)!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                let error = NSError(domain: "com.example.WeatherApp", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data returned"])
                completion(.failure(error))
                return
            }
            do {
                let decoder = JSONDecoder()
                let weatherData = try decoder.decode(OpenWeatherMapResponse.self, from: data)
                completion(.success(weatherData))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
