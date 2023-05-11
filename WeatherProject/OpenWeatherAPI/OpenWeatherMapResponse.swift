import UIKit
import Foundation

//MARK: Декодинг данных из API
struct OpenWeatherMapResponse: Decodable {
    let base: String
    let clouds: Clouds
    let cod: Int
    let coord: Coord
    let dt: Int
    let id: Int
    let main: Main
    let name: String
    let sys: Sys
    let timezone: Int
    let visibility: Int
    let weather: [Weather]
    let wind: Wind
}

struct Clouds: Decodable {
    let all: Int
}

struct Coord: Decodable {
    let lat: Double
    let lon: Double
}

struct Main: Decodable {
    let feelsLike: Double
    let humidity: Int
    let pressure: Int
    let temp: Double
    let tempMax: Double
    let tempMin: Double
    let seaLevel: Int?
    let grndLevel: Int?
    

    private enum CodingKeys: String, CodingKey {
        case feelsLike = "feels_like"
        case humidity, pressure, temp, seaLevel, grndLevel
        case tempMax = "temp_max"
        case tempMin = "temp_min"
    }
}

struct Sys: Decodable {
    let country: String
    let id: Int?
    let sunrise: Int
    let sunset: Int
    let type: Int?
}

struct Weather: Decodable {
    let description: String
    let icon: String
    let id: Int
    let main: String
}

struct Wind: Decodable {
    let deg: Int
    let speed: Double
    let gust: Double?
}

    

