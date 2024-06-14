//
//  DetailViewController.swift
//  TravelBookApp
//
//  Created by Zeynep Sinoğlu on 5.06.2024.
//

import UIKit

class DetailViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var detailTitle: UITextField!
    
    @IBOutlet weak var selectImage: UIImageView!
    @IBOutlet weak var detailShortDesc: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func btnSelectedImage(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        present(picker,animated: true)
    }
    
    @IBAction func btnSaveImage(_ sender: Any) {
        let title = detailTitle.text ?? ""
        let shortDesc = detailShortDesc.text ?? ""
        
        if let imageData = selectImage.image?.jpegData(compressionQuality: 1){
            DatabaseHelper.sharedInstance.save(title: title, shortdescription: shortDesc, image: imageData)
        }
         navigationController?.popViewController(animated: true)



    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let userPickedImage = info[.editedImage] as? UIImage else {return}
        
        selectImage.image = userPickedImage
        
        picker.dismiss(animated: true )
    }

}
