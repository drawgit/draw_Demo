//
//  AdvertViewController.swift
//  Draw_Demo
//
//  Created by 이성근 on 20/04/2020.
//  Copyright © 2020 Draw_corp. All rights reserved.
//

import UIKit

class AdvertViewController: UIViewController {
    @IBOutlet weak var advertContetntTextView :  UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
            advertContetntTextView.delegate = self

        self.advertContetntTextView.layer.cornerRadius = 10
        self.advertContetntTextView.layer.masksToBounds = true
        self.advertContetntTextView.layer.borderColor = UIColor.gray.cgColor
        self.advertContetntTextView.layer.borderWidth = 2.0
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.advertContetntTextView.resignFirstResponder()
    }

}

extension AdvertViewController : UITextViewDelegate , UITextFieldDelegate {
//     func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//           if(text == "\n") {
//               textView.resignFirstResponder()
//               return falsew
//           }
//           return true
//       }
}
