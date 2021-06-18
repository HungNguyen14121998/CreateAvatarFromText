//
//  ViewController.swift
//  CreateAvatarFromText
//
//  Created by Nguyen Huu Hung on 6/17/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    let avartar = Avatar()
    var imageView = SwiftyAvatar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        avartar.delegate = self
        
        setAvatar(fullName: "", imageUpload: UIImage(named: "myAvatar"))
    }
    
    // Main handle function
    func setAvatar(fullName: String, imageUpload: UIImage?) {
        if let image = imageUpload {
            self.imageView = self.avartar.createAvartar(image: image)
        }
        else {
            self.imageView = self.avartar.createAvatar(fullName: fullName)
        }
        DispatchQueue.main.async {
            self.view.addSubview(self.imageView)
        }
    }
    
    // Upload Image action button
    @IBAction func uploadImage(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
}

// MARK: TextField Delegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        let fullName = textField.text ?? ""
        label.text = fullName
        setAvatar(fullName: fullName, imageUpload: nil)
        
        return true
    }
}

// MARK: UIImagePickerController Delegate
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            setAvatar(fullName: "", imageUpload: image)
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

// MARK: Avatar Delegate
extension ViewController: Response {
    func successAction() {
        print("Update avartar successful")
    }
    
    func failAction() {
        print("Update avartar failed")
    }
}

