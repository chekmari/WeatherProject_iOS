//
//  WeatherViewController.swift
//  WeatherProject
//
//  Created by macbook on 06.04.2023.
//

import UIKit
import SnapKit


class WeatherViewController: UIViewController {
    
    private let weatherIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    private var weatherData: OpenWeatherMapResponse?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(weatherIconImageView)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: weatherIconImageView.topAnchor, constant: 20),
            
            weatherIconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weatherIconImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 20),
            weatherIconImageView.widthAnchor.constraint(equalToConstant: 200),
            weatherIconImageView.heightAnchor.constraint(equalToConstant: 200)
            
        ])
        
        tableView.dataSource = self
        tableView.delegate = self
        
        fetchData()
    }
    
    private func fetchData() {
        ManagerAPI.shared.getWeather { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                self.weatherData = response
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.updateWeatherIcon(with: response.weather[0].icon)
                }
                
            case .failure(let error):
                print("Ошибка получения data: \(error.localizedDescription)")
            }
        }
    }
    
    private func updateWeatherIcon(with icon: String) {
        if let url = URL(string: "https://openweathermap.org/img/w/\(icon).png") {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data, error == nil else {
                    print("Ошибка загрузки иконки погоды: \(error?.localizedDescription ?? "неизвестная ошибка")")
                    return
                }
                
                DispatchQueue.main.async {
                    self.weatherIconImageView.image = UIImage(data: data)
                }
                
            }.resume()
        }
    }
    
}



extension WeatherViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        guard let weatherData = weatherData else {
            cell.textLabel?.text = "Загрузка погоды..."
            return cell
        }
        
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Город: \(weatherData.name)"
        case 1:
            cell.textLabel?.text = "Страна: \(weatherData.sys.country)"
        case 2:
            cell.textLabel?.text = "Температура: \(Int(weatherData.main.temp-272.15)) ℃"
        case 3:
            cell.textLabel?.text = "Ощущается как: \(Int(weatherData.main.feelsLike-272.15)) ℃"
        case 4:
            cell.textLabel?.text = "Описание: \(weatherData.weather[0].description)"
        case 5:
            cell.textLabel?.text = "Скорость ветра: \(weatherData.wind.speed) м/с"
        case 6:
            cell.textLabel?.text = "Видимость: \(weatherData.visibility / 1000) км"
        case 7:
            cell.textLabel?.text = "Влажность: \(weatherData.main.humidity)%"
        case 8:
            cell.textLabel?.text = "Давление: \(weatherData.main.pressure) мм рт.cт."
        case 9:
            let date = Date(timeIntervalSince1970: TimeInterval(weatherData.sys.sunrise))
            let dateFormatter = DateFormatter()
            dateFormatter.timeZone = TimeZone.current
            dateFormatter.locale = Locale(identifier: "ru_RU")
            dateFormatter.dateFormat = "HH:mm dd.MM.yyyy"
            let localTime = dateFormatter.string(from: date)
            cell.textLabel?.text = "Время восхода солнца: \(localTime)"
        case 10:
            let date = Date(timeIntervalSince1970: TimeInterval(weatherData.sys.sunset))
            let dateFormatter = DateFormatter()
            dateFormatter.timeZone = TimeZone.current
            dateFormatter.locale = Locale(identifier: "ru_RU")
            dateFormatter.dateFormat = "HH:mm dd.MM.yyyy"
            let localTime = dateFormatter.string(from: date)
            cell.textLabel?.text = "Время захода солнца: \(localTime)"
        case 11:
            cell.textLabel?.text = "Облачность: \(weatherData.clouds.all )%"
        default:
            cell.textLabel?.text = ""
        }
        
        return cell
    }
}

extension WeatherViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
}
