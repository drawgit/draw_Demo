//
//  FidViewController.swift
//  Draw_Demo
//
//  Created by 이성근 on 24/02/2020.
//  Copyright © 2020 Draw_corp. All rights reserved.
//

import UIKit

class FidViewController: UIViewController {

    @IBOutlet weak var fidListView: UITableView!
    var fidList = [Fid]()
    var myIndex : IndexPath?
    var row = 0
    var isLike = false

    // 상위뷰에 접근해서 인덱스를 가져오는 함수
    func getIndexPath(_ button: UIButton) {
        let superView = button.superview
        let myCell = superView?.superview as! UITableViewCell
        let indexPath = fidListView.indexPath(for: myCell)
        let indexPathRow = indexPath?.row

        if let clickRow = indexPathRow {
            row = clickRow
        }
    }

    @IBAction func segueAction(_ sender: Any) {
         let buttonObject = sender as! UIButton
        getIndexPath(buttonObject)
        performSegue(withIdentifier: "detailVC", sender: nil)

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? DetailViewController {
//            guard let fidCell = sender as? FidCell else{return}
//            guard let indexPath = fidListView.indexPath(for: fidCell) else {return}

            detailVC.fid = fidList[row]
//            detailVC.cellRow = row
            print("row => \(row)")
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        print(" my Device = > \(DeviceManager.shared.getDevice())")
//        fidList = Fid.dummyFid
        let deviceSize = DeviceManager.shared.getDeviceSize()

        print("myDeviceSize - > \(deviceSize)")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        FidDataSource.shard.fetch {
            self.fidListView.reloadData()
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}


extension FidViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fidList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "fidCell", for: indexPath) as! FidCell
        cell.heartButton.addTarget(self, action: #selector(updateLikeButton(sender:)), for: .touchUpInside)
        cell.selectionStyle = .none

        cell.goodImage.image = UIImage(named: fidList[indexPath.row].img)
        cell.category.text = fidList[indexPath.row].category
        cell.goodNo.text = fidList[indexPath.row].goodNo
        cell.title.text = fidList[indexPath.row].title
        cell.goodText.text = fidList[indexPath.row].goodText
        cell.goodColor.text = fidList[indexPath.row].goodColor
        cell.price.text = fidList[indexPath.row].price

        return cell
    }
}

extension FidViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


extension FidViewController  {
    @objc func updateLikeButton(sender : UIButton) {
        if !isLike {
            sender.setImage(UIImage(named: "heart_button2"), for: .normal)
        }else {
            sender.setImage(UIImage(named: "heart_button1"), for: .normal)
        }
        isLike = !isLike
    }
}

