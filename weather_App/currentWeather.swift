//
//  currentWeather.swift
//  weather_App
//
//  Created by osvaldo lopez on 11/5/16.
//  Copyright © 2016 osvaldo lopez. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    
    var _cityName : String!
    var _date : String!
    var _weatherType : String!
    var _currentTemp : Double!
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var date : String {
        if _date == nil  {
            _date = ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        return _date
    }
    
    var weatherType : String {
        if _weatherType == nil  {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp : Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    func downloadWeatherDetails(completed: DownloadComplete) {
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)
        if let url = currentWeatherURL {
            Alamofire.request(url).responseJSON { response in
                if let dic = response.result.value as? Dictionary<String, AnyObject> {
                    guard let name = dic["name"] as? String, name != "" else {
                        return
                    }
                    guard let weather = dic["weather"] as? [Dictionary<String, AnyObject>], weather != nil else {
                        return
                    }
                    guard let wtype = weather[0]["main"] as? String, wtype != "" else {
                        return
                    }
                    guard let main = dic["main"] as? Dictionary<String, AnyObject>, main != nil else {
                        return
                    }
                    
                    guard let temp = main["temp"] as? Double, temp != 0.0 else {
                        return
                    }
                    self._cityName    = name
                    self._weatherType = wtype 
                    self._currentTemp = temp
                    print(self._cityName)
                    print(self._weatherType)
                    print(self._currentTemp)
                
                }
            }
            
        }
       completed() 
    }
    
}
