//
//  ImagePicker.swift
//  Agenda
//
//  Created by Bruno Silva on 24/03/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

enum MenuOptions {
    case camera
    case library
}

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
    
    //MARK: Metodo responsavel por mostrar o menu de opcoes (Foto ou Galeria)
    func menuOption(completion: @escaping(_ optionUser: MenuOptions) -> Void) -> UIAlertController {
        let menu = UIAlertController(title: "Atenção", message: "escolha uma das opções abaixo", preferredStyle: .actionSheet)
        
        let camera = UIAlertAction(title: "tirar foto", style: .default) { (action) in
            completion(.camera)
        }
        menu.addAction(camera)
        
        let library = UIAlertAction(title: "Biblioteca", style: .default) { (action) in
            completion(.library)
        }
        menu.addAction(library)
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        menu.addAction(cancel)
        
        return menu
    }
}
