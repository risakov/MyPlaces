//
//  ViewController.swift
//  MyPlaces
//
//  Created by Роман on 05.01.2020.
//  Copyright © 2020 Роман. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let placesNames = ["Kikchak Шаверма", "Шаурма у Бахи", "Шаурма Маркет", "KFC", "Кальянная 'Практика'", "ПМЖ антикафе", "Дом Бородача антикафе", "McDonald's", "ВДНХ", "Дизайн-завод 'Flacon'", "Площадь Тукая", "Центральный Детский Магазин", "Горбушкин Двор", "МГУ", "Красная Площадь"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
// Comment
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placesNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = placesNames[indexPath.row]
        cell.imageView?.image = UIImage(named: placesNames[indexPath.row])
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}

