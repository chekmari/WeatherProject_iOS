//
//  AppDelegate.swift
//  WeatherProject
//
//  Created by macbook on 06.04.2023.

import UIKit
import CoreLocation


//MARK: ЗАПРОС НА РАЗРЕШЕНОЕ ГЕОЛОКАЦИИ В МОМЕНТ ЗАПУСКА ДО НАЧАЛА ЖИЗНЕННОГО ЦИКЛА ViewController 
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate {

    var window: UIWindow?
    let locationManager = CLLocationManager()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        return true
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            LocationManager.sharedInstance.setLocation(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
