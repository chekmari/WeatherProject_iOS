//
//  Weather.swift
//  WeatherProject
//
//  Created by macbook on 08.04.2023.
//

import Foundation



// Реализуем модель представления ячейки
struct WeatherCellViewModel {
    let title: String
    let value: String
    
    static func createViewModels(from response: OpenWeatherMapResponse) -> [WeatherCellViewModel] {
        var viewModels = [WeatherCellViewModel]()
        
        viewModels.append(WeatherCellViewModel(title: "Temperature", value: "\(Int(response.main.temp))°C"))
        viewModels.append(WeatherCellViewModel(title: "Feels Like", value: "\(Int(response.main.feelsLike))°C"))
        viewModels.append(WeatherCellViewModel(title: "Humidity", value: "\(response.main.humidity)%"))
        viewModels.append(WeatherCellViewModel(title: "Pressure", value: "\(response.main.pressure) hPa"))
        viewModels.append(WeatherCellViewModel(title: "Wind Speed", value: "\(response.wind.speed) m/s"))
        viewModels.append(WeatherCellViewModel(title: "Wind Direction", value: "\(response.wind.deg)°"))
        viewModels.append(WeatherCellViewModel(title: "Description", value: "\(response.weather.first?.description ?? "")"))
        
        return viewModels
    }
}


//struct WeatherLeft {
//
//    let nameCity: String
//    let country: String
//    let mainDesription: String
//    let temp: Double
//    let tempFell: Double
//    let weatherDescription: String
//    let humidity: Int // влажность
//    let timeSunrise: Int // время восхода солнца
//    let timeSunset: Int // время захода солнца
//
//}
