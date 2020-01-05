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
//  MARK: Table View Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placesNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        cell.nameLabel?.text = placesNames[indexPath.row]
        cell.imageOfPlace?.image = UIImage(named: placesNames[indexPath.row])
        cell.imageOfPlace?.layer.cornerRadius = cell.imageOfPlace.frame.size.height / 2
        cell.imageOfPlace?.clipsToBounds = true
        return cell
    }
    
//  MARK: Table View Delegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}

