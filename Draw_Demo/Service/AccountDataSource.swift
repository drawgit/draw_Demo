//
//  AccounDataSource.swift
//  Draw_Demo
//
//  Created by 이성근 on 04/05/2020.
//  Copyright © 2020 Draw_corp. All rights reserved.
//

import Foundation

class AccountDataSource {
    static let shared = AccountDataSource()

    var userInfo : UserVO?

    private init(){
    }

    func signUpAPICall(emailAddress : String , userPassword : String, userName : String) -> Bool{
        return singUpAPI(emailAddress: emailAddress, userPassword: userPassword, userName: userName)
    }

    func loginAPICall(userEmail : String , userPassword : String){

    }

    private func loginAPI(emailAddress : String , userPasswrod : String)->Bool{
        var isLogin = false
        let param = ["email" : emailAddress,
        "password" : userPasswrod,
        ]
        guard let url = URL(string: "") else{ return false }

        var urlRequest = URLRequest.init(url: url)
        urlRequest.httpBody = param.queryString.data(using: .utf8)
        let session = URLSession.shared

        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            if let err = error {
                print("#1 ERROR => \(err)")
                return
            }

            guard let httpResponse = response as? HTTPURLResponse else {return}
            guard (200..<400).contains(httpResponse.statusCode) else {return}
            guard let data = data else {return}

            do {
                let decoer = JSONDecoder()
                self.userInfo = try decoer.decode(UserVO.self, from: data)
            }catch{
                print("#3 ERROR ==> \(error)")
            }
        }
        task.resume()

        if isLogin == true {
            return true
        }else {
            return false
        }
    }

    private func singUpAPI(emailAddress : String , userPassword : String, userName : String) -> Bool{
        var isSignUp = false
        let param = ["email" : emailAddress,
                     "password" : userPassword,
                     "name" : userName]
        guard let url = URL(string: "") else{ return false }

        var urlRequest = URLRequest.init(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = param.queryString.data(using: .utf8)
        let session = URLSession.shared

        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            if let err = error {
                print("#1 ERROR => \(err)")
                                return
            }

            guard let httpResponse = response as? HTTPURLResponse else {return}
            guard (200..<400).contains(httpResponse.statusCode) else {return}
            guard let data = data else {return}

            do {
                let decoer = JSONDecoder()
                self.userInfo = try decoer.decode(UserVO.self, from: data)
                if let _ = self.userInfo {isSignUp = true}

            }catch{
                print("#3 ERROR ==> \(error)")
            }
        }
        task.resume()

        if isSignUp == true {
             return true
        }else {
             return false
        }
    }
}
