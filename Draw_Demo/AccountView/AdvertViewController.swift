//
//  AdvertViewController.swift
//  Draw_Demo
//
//  Created by 이성근 on 20/04/2020.
//  Copyright © 2020 Draw_corp. All rights reserved.
//

import UIKit
import MobileCoreServices

class AdvertViewController: UIViewController {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var appendImageView: UIImageView!
    @IBOutlet weak var advertContetntTextView :  UITextView!

    @IBAction func touchUpGesture(_ sender: UIGestureRecognizer) {
        switch sender.state {
        case .ended:
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                let pickerController = UIImagePickerController()
                pickerController.sourceType = .photoLibrary
                pickerController.mediaTypes = [kUTTypeImage as String]  // 사진만 가져오게 할수있음
                pickerController.allowsEditing = false
                pickerController.delegate = self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate

                present(pickerController, animated: true, completion: nil)
            }
        default:
            break
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
            advertContetntTextView.delegate = self
        titleTextField.delegate = self
        emailTextField.delegate = self
        self.advertContetntTextView.layer.cornerRadius = 10
        self.advertContetntTextView.layer.masksToBounds = true
        self.advertContetntTextView.layer.borderColor = UIColor.gray.cgColor
        self.advertContetntTextView.layer.borderWidth = 2.0
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.advertContetntTextView.resignFirstResponder()
        self.titleTextField.resignFirstResponder()
        self.emailTextField.resignFirstResponder()
    }

}

extension AdvertViewController : UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let type = info[UIImagePickerController.InfoKey.mediaType] as? String {
            if type == kUTTypeImage as String {
                if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                    let openImage = image.fixOrigentaion()
                    appendImageView.image = openImage
                }
            }
        }
        picker.dismiss(animated: true, completion: nil)
    }
}
extension AdvertViewController : UITextViewDelegate , UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true

    }
}


extension AdvertViewController {

}
