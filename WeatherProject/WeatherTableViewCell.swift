//
//  WeatherDescriptionCell.swift
//  WeatherProject
//
//  Created by macbook on 07.04.2023.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    private let titleLabel = UILabel()
    private let valueLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        titleLabel.textColor = .black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        
        valueLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        valueLabel.textColor = .gray
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(valueLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            titleLabel.widthAnchor.constraint(equalToConstant: 120),
            
            valueLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 8),
            valueLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            valueLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            valueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
    
    func configure(with title: String, value: String) {
        titleLabel.text = title
        valueLabel.text = value
    }
}



//    var nameCityLabel: UILabel!
//    var countryLabel: UILabel!
//    var mainDesriptionLabel: UILabel!
//    var tempLabel: UILabel!
//    var tempFellLabel: UILabel!
//    var weatherDescriptionLabel: UILabel!
//    var humidityLabel: UILabel! // влажность
//    var timeSunriseLabel: UILabel! // время восхода солнца
//    var timeSunsetLabel: UILabel! // время захода солнца
