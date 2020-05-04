//
//  CategoryViewController.swift
//  Draw_Demo
//
//  Created by 이성근 on 26/03/2020.
//  Copyright © 2020 Draw_corp. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    let categoryList : [String] = ["로그인","좋아요 목록","광고문의","이용약관","개인정보이용약관"]

    override func viewDidLoad() {
        super.viewDidLoad()
        let dummyView = UIView(frame:CGRect(x: 0, y: 0, width: 0, height: 0));
        self.tableView.tableFooterView = dummyView;

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
