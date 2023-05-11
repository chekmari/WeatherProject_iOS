//
//  SettingsViewController.swift
//  WeatherProject
//
//  Created by macbook on 06.04.2023.
//
import CoreLocation
import UIKit

class SettingsViewController: UIViewController {
    
    var label: UILabel!
    var labelLocation: UILabel!
    var labelMyLocation: UILabel!
    var buttonChangeLocation: UIButton!
    var buttonGetLocation: UIButton!
    
    private var weatherData: OpenWeatherMapResponse?
    
    let locationManager = CLLocationManager()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Отрисовка интерфейса
        label = UILabel()
        label.text = "version: 1.0"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        

        
        labelLocation = UILabel()
        labelLocation.text = "Текущая геолокация"
        labelLocation.font = UIFont.systemFont(ofSize: 30)
        labelLocation.textColor = .darkGray
        labelLocation.numberOfLines = 0
        labelLocation.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        labelMyLocation = UILabel()
        if let location = LocationManager.sharedInstance.getLocation() {
            labelMyLocation.text = "\(weatherData?.sys.country), \(weatherData?.name)"
        } else {
            labelMyLocation.text = "Неопределено. Включите геолоакцию!"
        }
        labelMyLocation.font = UIFont.systemFont(ofSize: 15)
        labelMyLocation.textColor = .darkGray
        labelMyLocation.numberOfLines = 0
        labelMyLocation.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        buttonChangeLocation = UIButton()
        buttonChangeLocation.frame = CGRect(x: 0, y: 0, width: 130, height: 70)
        buttonChangeLocation.setTitle("изменить геолокацию", for: .normal)
        buttonChangeLocation.setTitleColor(.white, for: .normal)
        buttonChangeLocation.backgroundColor = .darkGray
        buttonChangeLocation.layer.cornerRadius = 10.0
        buttonChangeLocation.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        buttonChangeLocation.translatesAutoresizingMaskIntoConstraints = false
        
        
        buttonGetLocation = UIButton()
        buttonGetLocation.frame = CGRect(x: 0, y: 0, width: 130, height: 70)
        buttonGetLocation.setTitle("разрешить геолокацию", for: .normal)
        buttonGetLocation.setTitleColor(.white, for: .normal)
        buttonGetLocation.backgroundColor = .darkGray
        buttonGetLocation.layer.cornerRadius = 10.0
        buttonGetLocation.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        buttonGetLocation.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        view.backgroundColor = .white
        view.addSubview(label)
        view.addSubview(labelLocation)
        view.addSubview(labelMyLocation)
        view.addSubview(buttonChangeLocation)
        view.addSubview(buttonGetLocation)
        
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 340),
            
            labelLocation.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelLocation.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -340),
            
            labelMyLocation.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelMyLocation.centerYAnchor.constraint(equalTo: labelLocation.centerYAnchor, constant: 50),
            
            buttonChangeLocation.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonChangeLocation.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            buttonGetLocation.centerYAnchor.constraint(equalTo: buttonChangeLocation.centerYAnchor, constant: 60),
            buttonGetLocation.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
        
        buttonChangeLocation.addTarget(self, action: #selector(buttonChangeLocationAction), for: .touchUpInside)
        buttonGetLocation.addTarget(self, action: #selector(buttonGetLocationAction), for: .touchUpInside)
        
        
        locationManager.delegate = self
    }
    
   //MARK: Action взаимодействие с кнопкой изменить геопозацию
    @objc func buttonChangeLocationAction() {
        
    }
    
    @objc func buttonGetLocationAction() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
}

extension SettingsViewController: CLLocationManagerDelegate {
    
}
