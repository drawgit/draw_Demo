//
//  CategoryViewController.swift
//  Draw_Demo
//
//  Created by 이성근 on 26/03/2020.
//  Copyright © 2020 Draw_corp. All rights reserved.
//

import UIKit
import Crashlytics

class CategoryViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let adminCategory : [String] = ["로그아웃","메거진관리","UseOpenSource","광고관리"]
    let categoryList : [String] = ["로그인","좋아요 목록","광고문의","이용약관","개인정보이용약관","UseOpenSource"]

    override func viewDidLoad() {
        super.viewDidLoad()
        let dummyView = UIView(frame:CGRect(x: 0, y: 0, width: 0, height: 0));
        self.tableView.tableFooterView = dummyView;

        let button = UIButton(type: .roundedRect)
        button.frame = CGRect(x: 20, y: 50, width: 100, height: 30)
        button.setTitle("Crash", for: [])
        button.addTarget(self, action: #selector(self.crashButtonTapped(_:)), for: .touchUpInside)
        view.addSubview(button)
    }

        @IBAction func crashButtonTapped(_ sender: AnyObject) {
            Crashlytics.sharedInstance().crash()
        }
}

extension CategoryViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let categoryCell = tableView.dequeueReusableCell(withIdentifier: "category", for: indexPath)
        categoryCell.textLabel?.text = categoryList[indexPath.row]
        return categoryCell
    }
}

extension CategoryViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 클리한 셀 원래대로
        tableView.deselectRow(at: indexPath, animated: true)

        switch indexPath.row {
        case 0:
             performSegue(withIdentifier: "signIn", sender: nil)
        case 3:
             performSegue(withIdentifier: "advertSeuge", sender: nil)
        default:
            break
        }
    }
}

// NSObser 추가 예정 
extension CategoryViewController {

}
