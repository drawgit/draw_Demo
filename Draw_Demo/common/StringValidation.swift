//
//  StringValidation.swift
//  Draw_Demo
//
//  Created by 이성근 on 03/05/2020.
//  Copyright © 2020 Draw_corp. All rights reserved.
//

// 회원가입관련 global 함수

import Foundation

// 정상이메일인지 검증
func isValidEmailAddress(email: String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    let email = NSPredicate(format:"SELF MATCHES %@", emailRegEx)

    return email.evaluate(with: email)
}

func isValidatePassword(password : String) -> Bool {
    let passwordRegex = "^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{8,20}$"
    let passowrd = NSPredicate(format:"SELF MATCHES %@", passwordRegex)

    return passowrd.evaluate(with: password)
}

//문자열 길이 확인
func stringLengthCheck(text : String) -> Bool{
     return text.count <= 20 && text.count > 0
}
