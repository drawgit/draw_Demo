//
//  DeviceManager.swift
//  Draw_Demo
//
//  Created by 이성근 on 03/04/2020.
//  Copyright © 2020 Draw_corp. All rights reserved.
//

import Foundation
import UIKit


extension UIScreen {
    func getDeviceModel(screenHeight : Float) -> String{
        switch screenHeight {
        case 480.0: //Iphone 3,4S => 3.5 inch
            print("3,4S")
            return "iphone3"
        case 568.0: //iphone 5, SE => 4 inch
            print("5,SE")
            return "iphoneSE"
        case 667.0: //iphone 6, 6s, 7, 8 => 4.7 inch
            print(" 6, 6s, 7, 8")
            return "iphone8"
        case 736.0: //iphone 6s+ 6+, 7+, 8+ => 5.5 inch
            print(" 6+, 6s+, 7+, 8+")
            return "iphone8+"
        case 812.0: //iphone X, XS => 5.8 inch
            print("X, XS")
            return "iphoneX"
        case 896.0: //iphone XR => 6.1 inch  // iphone XS MAX => 6.5 inch
            print("X, XR")
            return "iphoneXR"
        default:
            return "not an iPhone"
        }
    }
}

class DeviceManager {
    static let shared : DeviceManager = DeviceManager()

    // 0-> heigy 1 -> width
    func getDeviceSize() -> Float  {
        let bounds: CGRect = UIScreen.main.bounds
        let deviceHeight = Float(bounds.size.height)

        return deviceHeight
    }

    private init(){

    }
}
