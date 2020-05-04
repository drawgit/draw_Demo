//
//  ViewController.swift
//  Draw_Demo
//
//  Created by 이성근 on 24/02/2020.
//  Copyright © 2020 Draw_corp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let deviceSize = DeviceManager.shared.getDeviceSize()
        print("myDeviceSize - > \(deviceSize)")
    }
}

