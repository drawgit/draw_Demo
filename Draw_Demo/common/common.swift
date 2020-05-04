//
//  common.swift
//  Draw_Demo
//
//  Created by 이성근 on 26/03/2020.
//  Copyright © 2020 Draw_corp. All rights reserved.
//

import Foundation

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


