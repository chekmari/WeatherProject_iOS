import UIKit

class BaseViewController: UIViewController {
    
    
    var buttonGetWeather: UIButton!
    var buttonSettings: UIButton!
    var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // MARK: Отрисовка кодом -
        label = UILabel()
        label.text = "Weather Project"
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        
        
        
        buttonGetWeather = UIButton(type: .system)
        buttonGetWeather.frame = CGRect(x: 0, y: 0, width: 130, height: 55)
        buttonGetWeather.setTitle("получить погоду", for: .normal)
        buttonGetWeather.setTitleColor(.white, for: .normal)
        buttonGetWeather.backgroundColor = UIColor.darkGray
        buttonGetWeather.layer.cornerRadius = 10.0
        buttonGetWeather.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        buttonGetWeather.translatesAutoresizingMaskIntoConstraints = false
        buttonGetWeather.center = view.center

        
        
        buttonSettings = UIButton(type: .system)
        buttonSettings.frame = CGRect(x: 0, y: 0, width: 135, height: 35)
        buttonSettings.setTitle("Настройки", for: .normal)
        buttonSettings.setTitleColor(.darkGray, for: .normal)
        buttonSettings.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        buttonSettings.center = view.center
        buttonSettings.translatesAutoresizingMaskIntoConstraints = false

        
        
        view.addSubview(label)
        view.addSubview(buttonGetWeather)
        view.addSubview(buttonSettings)
        
        
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            buttonGetWeather.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonGetWeather.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            buttonGetWeather.widthAnchor.constraint(equalToConstant: 130),
            buttonGetWeather.heightAnchor.constraint(equalToConstant: 55),
            buttonSettings.widthAnchor.constraint(equalToConstant: 135),
            buttonSettings.heightAnchor.constraint(equalToConstant: 35),
            buttonSettings.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonSettings.centerYAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
        ])
        
        
        
        buttonGetWeather.addTarget(self, action: #selector(buttonGetWeatherAction), for: .touchUpInside)
        buttonSettings.addTarget(self, action: #selector(buttonGetSettingsAction), for: .touchUpInside)
    }
    
    
    // MARK: Action взаимодействие с кнопками -
    @objc func buttonGetWeatherAction() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let weatherviewcontroller = storyboard.instantiateViewController(withIdentifier: "WeatherViewController")
        self.present(weatherviewcontroller, animated: true, completion: nil)
        
    }
    
    @objc func buttonGetSettingsAction() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let settingsviewcontroller = storyboard.instantiateViewController(identifier: "SettingsViewController")
        self.present(settingsviewcontroller, animated: true, completion: nil)
    }
    


}




