//
//  forcast.swift
//  weather_App
//
//  Created by osvaldo lopez on 11/9/16.
//  Copyright © 2016 osvaldo lopez. All rights reserved.
//

import UIKit
import Alamofire

class forcast {
    private var _date: String!
    private var _weatherType: String!
    private var _highTemp: String!
    private var _lowTemp: String!
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        return _date
    }
    
    var weatherType : String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var highTemp : String {
        if _highTemp == nil {
            _highTemp = ""
        }
        return _highTemp
    }
    
    var lowTemp : String {
        if _lowTemp == nil {
            _lowTemp = ""
        }
        return _lowTemp
    }
    
}
