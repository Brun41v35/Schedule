//
//  ImagePicker.swift
//  Agenda
//
//  Created by Bruno Silva on 24/03/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

protocol ImagePickerPictureSelected{
    func imagePickerPictureSelected(_ photo: UIImage)
}

class ImagePicker: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: - Variables
    var delegate: ImagePickerPictureSelected?
    
    //MARK: - Functions
    func imagePickerController(_ picker: UIImagePickerController,didFinishPickingMediaWithInfo info: [String : Any]) {
        let photo = info[UIImagePickerControllerOriginalImage] as! UIImage
        delegate?.imagePickerPictureSelected(photo)
        picker.dismiss(animated: true, completion: nil)
    }
}
