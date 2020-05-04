//
//  DetailViewController.swift
//  Draw_Demo
//
//  Created by 이성근 on 24/02/2020.
//  Copyright © 2020 Draw_corp. All rights reserved.
//

import UIKit
import DropDown

class DetailViewController: UIViewController {
    var cellRow = 0

    var fid : Fid?
    var dropDown : DropDown = DropDown()

    @IBOutlet weak var dropDownButton: UIButton!
    @IBOutlet weak var priceText: UILabel!
    @IBOutlet weak var categoryText: UILabel!
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var colorText: UILabel!
    @IBOutlet weak var goodNoText: UILabel!
    @IBOutlet weak var goodInfoText: UILabel!
    @IBOutlet weak var goodImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        dropDown.anchorView = dropDownButton
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)

        dropDown.dataSource = ["나이키", "무신사", "아디다스"]

        categoryText.text = fid?.category
        titleText.text = fid?.title
        colorText.text = fid?.goodColor
        goodNoText.text = fid?.goodNo
        goodInfoText.text = fid?.goodText
        priceText.text = fid?.price
        goodImageView.image = UIImage(named: fid?.img ?? "")


    }
    
    @IBAction func dismissAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)

    }
    @IBAction func showDropDownAction(_ sender: Any) {
        dropDown.show()
        
    }
}
