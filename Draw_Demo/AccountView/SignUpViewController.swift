//
//  SignUpViewController.swift
//  Draw_Demo
//
//  Created by 이성근 on 05/04/2020.
//  Copyright © 2020 Draw_corp. All rights reserved.
//

import UIKit
import TextFieldEffects

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailTextField: IsaoTextField!
    @IBOutlet weak var nameTextField: IsaoTextField!
    @IBOutlet weak var passwordTextField: IsaoTextField!
    @IBOutlet weak var passwordConfirmTextField: IsaoTextField!

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!

    var isEmailCheck : Bool = false
    var isNameCheck  : Bool = false
    var isPasswordCheck : Bool = false
    var isPassword : Bool = false
    var isSignUp : Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        let logoStr = NSAttributedString(string: titleLabel.text!, attributes: [
        NSAttributedString.Key.foregroundColor : UIColor.white,
        NSAttributedString.Key.strokeColor : UIColor.red,
        NSAttributedString.Key.strokeWidth : 2,
        NSAttributedString.Key.font : UIFont.systemFont(ofSize: 40.0)
           ])
       titleLabel.attributedText = logoStr

    }

    func singUpCheck(){
        if isEmailCheck && isNameCheck && isPassword && isPasswordCheck {
            signUpButton.backgroundColor = .green
            isSignUp = true
        }else{
            signUpButton.backgroundColor = .systemGray
            isSignUp = false
        }
    }

    @IBAction func signUpAction(_ sender: Any) {
        if isSignUp {
            let alert = UIAlertController(title: "회원가입안료", message: "회원가입이 완료 되었습니다.", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(alertAction)
            self.present(alert, animated: true , completion: nil)
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.nameTextField.resignFirstResponder()
        self.passwordConfirmTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
        self.emailTextField.resignFirstResponder()
    }
}

extension SignUpViewController {

       // 이메일 체크 함수
       func emailCheck(){
        guard let eamilStr = emailTextField.text else { return }

        if  isValidEmailAddress(email: eamilStr) {
                emailTextField.activeColor = .blue
                emailTextField.inactiveColor = .blue
                isEmailCheck = !isEmailCheck
                emailTextField.placeholder = "사용가능한 이메일 입니다."
           } else{
                emailTextField.activeColor = .systemRed
                emailTextField.inactiveColor = .systemRed
                isEmailCheck = !isEmailCheck
                emailTextField.placeholder = "이메일 형식이 잘못되거나 또는 중복된 이메일 입니다."
           }
            self.emailTextField.becomeFirstResponder()
       }
       //패스워드체크
       func passwordCheck(){
           guard let passwordStr = passwordTextField.text else {return}

           if isValidatePassword(password: passwordStr) {
                passwordTextField.activeColor = .blue
                passwordTextField.inactiveColor = .blue
                isPassword = true
                passwordTextField.placeholder = "사용가능한 패스워드 입니다."

           } else {
               passwordTextField.activeColor = .systemRed
               passwordTextField.inactiveColor = .systemRed
               isPassword = false
               passwordTextField.placeholder = "영문,숫자,특수문자 8자 이상 20자 미만으로 입력해주세요"
           }
           self.passwordTextField.becomeFirstResponder()

       }
       //패스워드가 동일한지 확인
       func passwordEqulseCheck(){
           guard let passwordEqulseText = passwordConfirmTextField.text else {return}
           guard let passwordText = passwordTextField.text else{return}

           if passwordEqulseText == passwordText {

               if passwordText.isEmpty {return}

                passwordConfirmTextField.activeColor = .blue
                passwordConfirmTextField.inactiveColor = .blue
                passwordConfirmTextField.placeholder = "비밀번호가 일치 합니다."
                isPasswordCheck = true
           }else {

               isPasswordCheck = false
               passwordConfirmTextField.activeColor = .systemRed
               passwordConfirmTextField.inactiveColor = .systemRed
               passwordConfirmTextField.placeholder = "입력한 비밀번호가 일치하지 않습니다."
           }
           self.passwordConfirmTextField.becomeFirstResponder()
       }
       func nameCheck(){
            let nameText = nameTextField.text!
//            ㅣㄷㅅnameText.trimmingCharacters(in: .whitespacesAndNewlines)

            if stringLengthCheck(text: nameText) {
                nameTextField.activeColor = .blue
                nameTextField.inactiveColor = .blue
                nameTextField.placeholder = "사용가능한 이름 입니다."
                isNameCheck = true
            }else {
                nameTextField.activeColor = .systemRed
                nameTextField.inactiveColor = .systemRed
                nameTextField.placeholder = "이름은 0글자 또는 20글자가 넘어갈수 없습니다."
                isNameCheck = false
            }
       }
}

extension SignUpViewController : UITextFieldDelegate {
    // 리턴 눌렀을때 리턴
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()

        return true
    }

    //텍스트입력완료시
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        // 텍스트필드객체에 따라 분기
        switch textField {
        case emailTextField:
            emailCheck() // emailAddressCheck
        case nameTextField:
            nameCheck()
        case passwordTextField :
           passwordCheck()
        case passwordConfirmTextField :
           passwordEqulseCheck()
        default:
            break
        }
        singUpCheck()
        return true
    }
}
