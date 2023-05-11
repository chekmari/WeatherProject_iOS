import Foundation


//MARK: СИНГЛТОН - ПОЛУЧЕНИЕ ДАННЫХ ИЗ API
class ManagerAPI {
    static let shared = ManagerAPI()
    
    private let apiKey = "4867b26381f2a25b952d9d926a2c393f"
    
    func getWeather(completion: @escaping (Result<OpenWeatherMapResponse, Error>) -> Void) {
        if let location = LocationManager.sharedInstance.getLocation() {
            let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(location.0)&lon=\(location.1)&appid=\(apiKey)&lang=ru"
            print(urlString)
            let url = URL(string: urlString)!
            let request = URLRequest(url: url)
            
            let session = URLSession.shared
            let task = session.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {
                    completion(.failure(error ?? NSError(domain: "Unknown error", code: 0, userInfo: nil)))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(OpenWeatherMapResponse.self, from: data)
                    completion(.success(response))
                } catch {
                    completion(.failure(error))
                }
            }
            
            task.resume()
        } else {
            completion(.failure(NSError(domain: "Unable to retrieve location", code: 0, userInfo: nil)))
        }
    }
}




