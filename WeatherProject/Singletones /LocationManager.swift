import Foundation

//MARK: СИНГЛТОН получит и отдает широту и долготу пользователя
class LocationManager {
    static let sharedInstance = LocationManager()
    var latitude: Double?
    var longitude: Double?
    
    private init() {}
    
    // метод для установки значения широты и долготы
    func setLocation(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    // метод для получения значения широты и долготы
    func getLocation() -> (Double, Double)? {
        guard let latitude = self.latitude, let longitude = self.longitude else {
            return nil
        }
        return (latitude, longitude)
    }
}
