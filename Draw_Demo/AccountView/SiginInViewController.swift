//
//  SiginInViewController.swift
//  Draw_Demo
//
//  Created by 이성근 on 26/03/2020.
//  Copyright © 2020 Draw_corp. All rights reserved.
//

import UIKit
//import TextFieldEffects

class SiginInViewController: UIViewController {
    //CoustomFont OpenSource
//    @IBOutlet weak var passwordTextField: IsaoTextField!
//    @IBOutlet weak var emailTextFild: IsaoTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }

    @IBAction func cancelAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func loginAction(_ sender: Any) {
//        let param = ["email" : emailTextFild.text ?? "",
//                     "password" : passwordTextField.text ?? ""
//                    ]
//        let urlString : String = "locahost : 3600"
//
//        guard let url = URL(string: urlString) else {return}
////        var urlCompent  = URLComponents(string: url)
////        urlCompent?.query = param.queryString
//        var urlRequest = URLRequest.init(url: url)
//        urlRequest.httpMethod = "POST"
//        urlRequest.httpBody = param.queryString.data(using: .utf8)
//
//
//        URLSession.shared.dataTask(with: urlRequest) { (data, resopnse, err) in
//            if let data = data {
//                let decoder = JSONDecoder()
//                do {
//                    let loginUser = try decoder.decode(UserInfo.self, from: data)
//                }catch{
//                    print(err)
//                }
//            }
//        }
    }

}
