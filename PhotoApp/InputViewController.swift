//
//  InputViewController.swift
//  PhotoApp
//
//  Created by 伴地慶介 on 2021/11/13.
//

import UIKit

class InputViewController: UIViewController {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var userNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addButton(_ sender: Any) {
        
        let userDetaults = UserDefaults.standard
        userDetaults.set(userNameTextField.text, forKey: "userName")
        let date = logoImageView.image?.jpegData(compressionQuality: 0.1)
        userDetaults.set(date, forKey: "userImage")
        
        // transition view controller
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "nextViewController") as! NextViewController
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        userNameTextField.resignFirstResponder()
    }
    
    @IBAction func tapImageView(_ sender: Any) {
        showAlert(title: "選択", message: "どちらを使用しますか??")
    }
    
    // open camera
    func checkCamera() {
        let sourceType:UIImagePickerController.SourceType = .camera
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraPicker = UIImagePickerController()
            cameraPicker.allowsEditing = true
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
        }
    }
    
    // use photo library
    func checkAlbam() {
        let sourceType:UIImagePickerController.SourceType = .photoLibrary
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let cameraPicker = UIImagePickerController()
            cameraPicker.allowsEditing = true
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
        }
    }
    
    func showAlert(title:String, message:String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "camera", style: .default) {(alert) in
            self.checkCamera()
        }
        let albamAction = UIAlertAction(title: "albam", style: .default) {(alert) in
            self.checkAlbam()
        }
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel)
        
        alertController.addAction(cameraAction)
        alertController.addAction(albamAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension InputViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
                if info[.originalImage] as! UIImage != nil {
                    let selectedImage = info[.originalImage] as! UIImage
                    let userDefaults = UserDefaults.standard
                    userDefaults.set(selectedImage.jpegData(compressionQuality:0.1), forKey: "userImage")
                    logoImageView.image = selectedImage
                    picker.dismiss(animated: true, completion: nil)
                }
        
//        let userDefaults = UserDefaults.standard
//        if let selectedImage = info[.editedImage] as? UIImage {
//            userDefaults.set(selectedImage.jpegData(compressionQuality:0.1), forKey: "userImage")
//            logoImageView.image = selectedImage
//        } else if let selectedImage = info[.originalImage] as? UIImage {
//            userDefaults.set(selectedImage.jpegData(compressionQuality:0.1), forKey: "userImage")
//            logoImageView.image = selectedImage
//        }
//        
//        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}
