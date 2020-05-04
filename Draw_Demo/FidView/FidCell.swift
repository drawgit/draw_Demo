//
//  FidCell.swift
//  Draw_Demo
//
//  Created by 이성근 on 26/02/2020.
//  Copyright © 2020 Draw_corp. All rights reserved.
//

import Foundation
import UIKit

class FidCell : UITableViewCell{
    @IBOutlet weak var goodImage: UIImageView!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var goodColor: UILabel!
    @IBOutlet weak var goodNo: UILabel!
    @IBOutlet weak var price: UILabel!

    @IBOutlet weak var goodText: UILabel!
    @IBOutlet weak var heartButton: UIButton!

    override class func awakeFromNib() {
        // 초기화코드
    }
}
