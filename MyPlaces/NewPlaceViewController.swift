//
//  NewPlaceViewController.swift
//  MyPlaces
//
//  Created by Роман on 07.01.2020.
//  Copyright © 2020 Роман. All rights reserved.
//

import UIKit

class NewPlaceViewController: UITableViewController {
    
    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var placeLocation: UITextField!
    @IBOutlet weak var placeType: UITextField!
    @IBOutlet weak var placeName: UITextField!
    
    var newPlace: Place?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        saveButton.isEnabled = false
        placeName.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        tableView.tableFooterView = UIView()
         
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if indexPath.row == 0 {
            let actionSheet = UIAlertController(title: nil,
                                                message: nil,
                                                preferredStyle: .actionSheet)
            
            let camera = UIAlertAction(title: "Camera", style: .default) { _ in
                self.chooseImagePicker(source: .camera)
            }
            
            let photo = UIAlertAction(title: "Photo", style: .default) { _ in
                self.chooseImagePicker(source: .photoLibrary)
            }
            
            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            
            actionSheet.addAction(camera)
            actionSheet.addAction(photo)
            actionSheet.addAction(cancel)
            
            present(actionSheet, animated: true)


            
        } else {
            tableView.endEditing(true)
        }
        
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        
        dismiss(animated: true)
        
    }
    func saveNewPlace() {
        newPlace = Place(name: placeName.text!,
                         location: placeLocation.text,
                         type: placeType.text,
                         image: placeImage.image,
                         placeImage: nil)
    }
    
}


extension NewPlaceViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc private func textFieldChanged() {
        
        if placeName.text?.isEmpty == false {
            
            saveButton.isEnabled = true
            
        } else {
            
            saveButton.isEnabled = false
            
        }
    }
}

extension NewPlaceViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func chooseImagePicker(source: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        placeImage.image = info[.editedImage] as? UIImage
        placeImage.contentMode = .scaleAspectFill
        placeImage.clipsToBounds = true
        dismiss(animated: true)
    }
}
