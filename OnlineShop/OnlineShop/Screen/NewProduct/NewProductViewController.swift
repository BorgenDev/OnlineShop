//
//  NewProductViewController.swift
//  OnlineShop
//
//  Created by Arseniy on 31.01.2021.
//

import UIKit

class NewProductViewController: UIViewController, NewProductViewInConnection {
    
    var presenter: NewProductViewOutConnection?
    
    //MARK: - IBOutlet

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var priceTF: UITextField!
    @IBOutlet weak var raitingStepper: UIStepper!
    @IBOutlet weak var raitingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.title = "Добавить продукт"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setupeStepper()
        setupeTextFields()
        setupeImageView()
        
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.productImageView.layer.cornerRadius = 20
    }
   
    //MARK: - IBAction
    
    @IBAction func raitingDidChange(_ sender: UIStepper) {
        self.raitingLabel.text = "\(sender.value)"
    }
    
    @IBAction func addProduct(_ sender: UIButton) {
        guard !(nameTF.text!.isEmpty) && !(priceTF.text!.isEmpty) else {
            self.showErrorAlert()
            return
        }
        
        let name: String? = nameTF.text
        let price: Double? = Double(priceTF.text ?? "")
        let raiting: Float? = Float(raitingStepper.value)
        
        presenter?.getInformationAdoutProduct(name: name, price: price, raiting: raiting)
    }
    
    private func showErrorAlert() {
        let alertController = UIAlertController(title: "Error", message: "Fill in all the fields", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
    
    private func showImagePicerAlert() {
        let cameraIcon = UIImage(systemName: "camera.fill")
        let photoIcon = UIImage(systemName: "photo.fill")
        
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { (_) in
            self.changeActionFromImagePicer(source: .camera)
        }
        cameraAction.setValue(cameraIcon, forKey: "image")
        cameraAction.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
        
        let photoAction = UIAlertAction(title: "Photo", style: .default) { (_) in
            self.changeActionFromImagePicer(source: .photoLibrary)
        }
        photoAction.setValue(photoIcon, forKey: "image")
        photoAction.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        actionSheet.addAction(cancelAction)
        actionSheet.addAction(cameraAction)
        actionSheet.addAction(photoAction)
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    private func setupeImageView() {
        let gester = UITapGestureRecognizer()
        gester.addTarget(self, action: #selector(imageViewDidTap))
        productImageView.isUserInteractionEnabled = true
        productImageView.addGestureRecognizer(gester)
    }
    
    private func setupeStepper() {
        raitingStepper.minimumValue = 0
        raitingStepper.maximumValue = 5
        raitingStepper.value = 5
    }
    
    private func setupeTextFields() {
        nameTF.delegate = self
        priceTF.delegate = self
        self.priceTF.keyboardType = .decimalPad
    }
    
    @objc func imageViewDidTap() {
        self.showImagePicerAlert()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        self.view.endEditing(true)
        
    }
    
}

//MARK: - UITextFieldDelegate

extension NewProductViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == nameTF {
            textField.resignFirstResponder()
            priceTF.becomeFirstResponder()
        } else  {
            textField.resignFirstResponder()
        }
        
        return true
    }
    
}

extension NewProductViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        productImageView.image = info[.editedImage] as? UIImage
        productImageView.contentMode = .scaleAspectFit
        productImageView.clipsToBounds = true
        self.dismiss(animated: true, completion: nil)
    }
    
    func changeActionFromImagePicer(source : UIImagePickerController.SourceType) {
        let imagePicerController = UIImagePickerController()
        imagePicerController.sourceType = source
        imagePicerController.delegate = self
        imagePicerController.allowsEditing = true
        present(imagePicerController, animated: true, completion: nil)
    }
}
