//
//  AlunoViewController.swift
//  Agenda
//
//  Created by Ândriu Coelho on 24/11/17.
//  Copyright © 2017 Alura. All rights reserved.
//

import UIKit

class AlunoViewController: UIViewController, ImagePickerPictureSelected {
    
    // MARK: - IBOutlets
    @IBOutlet weak var viewImagemAluno: UIView!
    @IBOutlet weak var imageAluno: UIImageView!
    @IBOutlet weak var buttonFoto: UIButton!
    @IBOutlet weak var scrollViewPrincipal: UIScrollView!
    
    @IBOutlet weak var textFieldNome: UITextField!
    @IBOutlet weak var textFieldEndereco: UITextField!
    @IBOutlet weak var textFieldTelefone: UITextField!
    @IBOutlet weak var textFieldSite: UITextField!
    @IBOutlet weak var textFieldNota: UITextField!
    
    //MARK: - variables
    let imagePicker = ImagePicker()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        self.arredondaView()
        NotificationCenter.default.addObserver(self, selector: #selector(aumentarScrollView(_:)), name: .UIKeyboardWillShow, object: nil)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: - Function
    func arredondaView() {
        self.viewImagemAluno.layer.cornerRadius = self.viewImagemAluno.frame.width / 2
        self.viewImagemAluno.layer.borderWidth = 1
        self.viewImagemAluno.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    private func setup() {
        imagePicker.delegate = self
    }
    
    @objc func aumentarScrollView(_ notification:Notification) {
        self.scrollViewPrincipal.contentSize = CGSize(width: self.scrollViewPrincipal.frame.width, height: self.scrollViewPrincipal.frame.height + self.scrollViewPrincipal.frame.height/2)
    }
    
    //MARK: - Delegate
    func imagePickerPictureSelected(_ photo: UIImage) {
        imageAluno.image = photo
    }
    
    // MARK: - IBActions
    @IBAction func buttonFoto(_ sender: UIButton) {
        
        //MARK: Validando se o device tem camera
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            
            //MARK: Criando uma instancia
            let multimidia = UIImagePickerController()
            multimidia.delegate = imagePicker
            
            //MARK: Tipo de dado - (Camera ou Galeria)
            multimidia.sourceType = .camera
            
            //MARK: Exibindo a camera
            self.present(multimidia, animated: true, completion: nil)
        } else {
            print("Esse device não possui camera 😔")
        }
    }
    
    @IBAction func stepperNota(_ sender: UIStepper) {
        self.textFieldNota.text = "\(sender.value)"
    }
}
