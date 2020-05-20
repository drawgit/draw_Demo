//
//  common.swift
//  Draw_Demo
//
//  Created by 이성근 on 26/03/2020.
//  Copyright © 2020 Draw_corp. All rights reserved.
//

import Foundation
import UIKit
extension Dictionary {
    var queryString : String {
        var output = ""

        for (key, value) in self {
            output = output + "\(key)=\(value)&"
        }
        output = String(output.dropLast())
        return output
    }
}

extension Notification.Name {
    static let signUp = Notification.Name(rawValue: "signUpNotification")
}


extension UIImage {
    func fixOrigentaion() -> UIImage {
        //사진이 up상태에서 찍엇을경우는 리턴
        if imageOrientation == .up {
            return self
        }
        // 그외 사진은 다시그린다.
        UIGraphicsBeginImageContextWithOptions(size, true, scale)
        draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))

        if let nomalizedImage = UIGraphicsGetImageFromCurrentImageContext() {
            UIGraphicsEndImageContext()
            return nomalizedImage
        } else {
            return self
        }
    }
}



