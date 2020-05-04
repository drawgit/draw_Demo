//
//  CalnderViewController.swift
//  Draw_Demo
//
//  Created by 이성근 on 03/03/2020.
//  Copyright © 2020 Draw_corp. All rights reserved.
//

import UIKit
import FSCalendar


class CalnderViewController: UIViewController {

    @IBOutlet weak var calnderView: FSCalendar!
    @IBOutlet weak var CalendarHeighConstraint: NSLayoutConstraint!

    var isCanderScope : Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        let deviceSize = DeviceManager.shared.getDeviceSize()
        let deviceModel = UIScreen().getDeviceModel(screenHeight: deviceSize)
        print("myDeviceSize - > \(deviceModel)")
        initCalnderHeight(deviceModel: deviceModel)

//        self.CalendarHeighConstraint.constant = 500.00
        print(CalendarHeighConstraint.constant)
    }

    func initCalnderHeight(deviceModel : String){
        print("deviceModel -> \(deviceModel)")
        switch deviceModel {
        case "iphone3":
            self.CalendarHeighConstraint.constant = 480.00
            break
        case "iphoneSE":
            self.CalendarHeighConstraint.constant = 568.0
            break
        case "iphone8":
            self.CalendarHeighConstraint.constant = 667.0
            break
        case "iphone8+":
            self.CalendarHeighConstraint.constant = 736.0
            break
        case "iphoneX":
            self.CalendarHeighConstraint.constant = 812.0
            break
        case "iphoneXR":
            self.CalendarHeighConstraint.constant = 896.0
            break
        default:
            break
        }

    }

    @IBAction func testButton(_ sender: Any) {

        if self.calnderView.scope == .month {
            self.calnderView.setScope(.week, animated: true)
        } else {
            self.calnderView.setScope(.month, animated: true)
        }
    }
    @IBAction func calnderChangeActinon(_ sender: Any) {
        if isCanderScope {
            calnderView.scope = .week
            isCanderScope = false
        } else {
            calnderView.scope = .month
            isCanderScope = true

        }
    }
}

extension CalnderViewController : FSCalendarDelegate{
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {

//        calnderView.scope = .week
        if calnderView.scope == .week {
            calnderView.setScope(.month, animated: true)
        }else {
            calnderView.setScope(.week, animated: true)
        }
        print("Date\(date)")
        

    }
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        print("bounds height \(bounds.height)")
        self.CalendarHeighConstraint.constant = bounds.height
        self.view.layoutIfNeeded()
    }

}

extension CalnderViewController : FSCalendarDataSource {
//    func calendar(_ calendar: FSCalendar, imageFor date: Date) -> UIImage? {
//
//    }
}


extension CalnderViewController : UITableViewDelegate {
}

extension CalnderViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "test", for: indexPath)

        return cell
    }
}
