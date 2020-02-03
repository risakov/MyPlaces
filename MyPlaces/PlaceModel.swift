//
//  PlaceModel.swift
//  MyPlaces
//
//  Created by Роман on 05.01.2020.
//  Copyright © 2020 Роман. All rights reserved.
//

import UIKit

struct Place {
    
    var name: String
    var location: String?
    var type: String?
    var image: UIImage?
    var placeImage: String?
    
    static let placesNames = ["Kikchak Шаверма", "Шаурма у Бахи", "Шаурма Маркет", "KFC", "Кальянная 'Практика'", "ПМЖ антикафе", "Дом Бородача антикафе", "McDonald's", "ВДНХ", "Дизайн-завод 'Flacon'", "Площадь Тукая", "Центральный Детский Магазин", "Горбушкин Двор", "МГУ", "Красная Площадь"]

    static func getPlaces() -> [Place] {
        
        var places = [Place]()
        
        for place in placesNames {
            places.append(Place(name: place, location: "Ростов-на-Дону", type: "Шаурмечная", image: nil, placeImage: place))
            
        }
        
        return places
    }
    
}

